-- ALL CPDCS_DB OBJECTS CREATION SCRIPT
-- by Ricardo Álamo & José Antonio Márquez (1º DAW/DAM Vedruna 2022/2023)

-- NOTE: This script create each function, procedure and trigger asked in this excercise.
-- In order to launch and check the properly actions, run the following events in the CPDCS_DB_OBJECTS_RUN.sql you'll find in this package.

-- ***************************
-- **		FUNCTIONS		**
-- ***************************

-- FUNCIÓN 1
-- Crear una función que reciba un identificador de servidor de almacenamiento y devuelva el porcentaje de disco libre
-- que queda en el servidor.

DELIMITER //
-- DROP FUNCTION IF EXISTS GetFreeDiskSpacePercentage;
CREATE FUNCTION GetFreeDiskSpacePercentage(TargetIdServer BIGINT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE totalSpace FLOAT;
    DECLARE assignedSpace FLOAT;
    DECLARE freeSpace FLOAT;
    DECLARE freeSpacePercentage FLOAT;

    -- Obtener el espacio total disponible en el servidor
    SELECT TotalSpaceAvailable INTO totalSpace
    FROM CPDCS_Servers
    WHERE idServer = TargetIdServer;

    -- Obtener el espacio asignado en el servidor
    SELECT TotalSpaceAssigned INTO assignedSpace
    FROM CPDCS_Servers
    WHERE idServer = TargetIdServer;

    -- Calcular el espacio libre en el servidor
    SET freeSpace = totalSpace - assignedSpace;

    -- Calcular el porcentaje de espacio libre
    SET freeSpacePercentage = (freeSpace / totalSpace) * 100;

    -- Devolver el porcentaje de espacio libre
    RETURN freeSpacePercentage;
END //

DELIMITER ;

-- FUNCIÓN 2
-- Crear una función que reciba un identificador de servidor de almacenamiento y devuelva el porcentaje de logins que ha
-- recibido respecto del total de logins que ha habido en todos los servidores.

DELIMITER //;
-- DROP FUNCTION IF EXISTS GetLoginPercentage;
CREATE FUNCTION GetLoginPercentage(idServer INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE total_logins INT;
  DECLARE server_logins INT;
  DECLARE login_percentage DECIMAL(5,2);

-- Obtener el total de logins en todos los servidores
SELECT COUNT(*) INTO total_logins FROM CPDCS_Login;

-- Obtener el número de logins del servidor específico
SELECT COUNT(*) INTO server_logins FROM CPDCS_Login WHERE Servers_X_idServer = idServer;
    
-- Calcular el porcentaje de logins del servidor específico respecto al total
SET login_percentage = (server_logins / total_logins) * 100;
    
    RETURN login_percentage;
END //;
DELIMITER ;

-- FUNCIÓN 3
-- Crear una función que reciba dos identificadores de CPD y devuelva la distancia en kilómetros que hay entre ambos.
-- Recuerde que la ubicación física de los CPD se expresa con una posición GPS (latitud, longitud).

DELIMITER //;
-- DROP FUNCTION IF EXISTS GetDistanceFromCPDs;
CREATE FUNCTION GetDistanceFromCPDs(idCPD_1 INT, idCPD_2 INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE cpd1_lat DECIMAL(9,6);
  DECLARE cpd1_long DECIMAL(9,6);
  DECLARE cpd2_lat DECIMAL(9,6);
  DECLARE cpd2_long DECIMAL(9,6);
  DECLARE distance DECIMAL(10,2);
  
  SELECT latitude, longitude INTO cpd1_lat, cpd1_long
  FROM CPDCS_CPDs
  WHERE idCPD = idCPD_1;
  
  SELECT latitude, longitude INTO cpd2_lat, cpd2_long
  FROM CPDCS_CPDs
  WHERE idCPD = idCPD_2;
  
  SET distance = (6371 * ACOS(
    COS(RADIANS(cpd1_lat)) * COS(RADIANS(cpd2_lat)) * COS(RADIANS(cpd2_lon) - RADIANS(cpd1_lon)) +
    SIN(RADIANS(cpd1_lat)) * SIN(RADIANS(cpd2_lat))
  ));
  
  RETURN distance;
END //;
DELIMITER ;

-- ***************************
-- **		PROCEDURE		**
-- ***************************

-- PROCEDIMIENTO
-- Crear un procedimiento que, partiendo de la información de la tabla de eventos del día anterior al actual (ayer),
-- actualice los datos acumulados de consumo eléctrico de cada una de las horas en un determinado CPD.
-- El procedimiento se ejecutará todos los días a las 1:00 AM.


-- Crear el procedimiento
DELIMITER //

-- DROP PROCEDURE IF EXISTS UpdateCPDElectricityUsage;
CREATE PROCEDURE UpdateCPDElectricityUsage()
BEGIN
    DECLARE yesterday DATE;
    
    -- Obtener la fecha de ayer
    SET yesterday = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    
    -- Actualizar los datos acumulados de consumo eléctrico de cada hora en un CPD específico
    UPDATE CPDCS_CPDs_MensualUsage mu
    INNER JOIN CPDCS_CPDs cpd ON cpd.idCPD = mu.CPDs_X_idCPD
    INNER JOIN CPDCS_CPDs_MensualUsage mu_prev ON mu_prev.CPDs_X_idCPD = mu.CPDs_X_idCPD
                                               AND mu_prev.Month = DATE_FORMAT(yesterday, '%Y-%m')
    INNER JOIN CPDCS_APPs_Events ae ON ae.EventDate = yesterday
                                      AND ae.Apps_X_idApp = mu.CPDs_X_idCPD
    SET mu.ResourcesUsage = mu_prev.ResourcesUsage + ae.KWhConsumption
    WHERE cpd.idCPD = CPD_ID;
END //

DELIMITER ;
    
-- ***************************
-- **		TRIGGER			**
-- ***************************

-- Se desea incorporar al sistema un módulo de estadísticas web, el cual no puede acceder a la información de nuestras tablas maestras (las del
-- enunciado). Por ello, se necesita crear un trigger que alimentará una nueva tabla, definida por usted, en la cual se registre de forma directa
-- el acumulado de estadísticas de logins en tres franjas horarias: mañana (8:00AM-3:00PM), tarde (3:00PM-10:00PM) y noche (10:00PM-8:00AM).

-- Drop the CPDCS_WebStatistics table if it was previously created:
-- DROP TABLE IF EXISTS CPDCS_WebStatistics;

-- Create the CPDCS_WebStatistics table that will store the login statistics:
CREATE TABLE CPDCS_WebStatistics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    morning_logins INT,
    afternoon_logins INT,
    night_logins INT
);

-- Drop the UpdateWebStatistics trigger if it was previously created:
-- DROP TRIGGER IF EXISTS UpdateWebStatistics;

-- Create the UpdateWebStatistics trigger to update the login statistics in CPDCS_WebStatistics table in real time:
DELIMITER //

CREATE TRIGGER UpdateWebStatistics
AFTER INSERT ON CPDCS_Login
FOR EACH ROW
BEGIN
    DECLARE time_now DATE;
    DECLARE login_time TIME;
    
    -- Obtener la fecha actual
    SET time_now = CURDATE();
    
    -- Obtener el tiempo del login actual
    SET login_time = TIME(NEW.LoginDate);
    
    -- Actualizar las estadísticas según la franja horaria
    IF login_time >= '08:00:00' AND login_time < '15:00:00' THEN
        INSERT INTO CPDCS_WebStatistics (date, morning_logins)
        VALUES (time_now, 1)
        ON DUPLICATE KEY UPDATE morning_logins = morning_logins + 1;
    ELSEIF login_time >= '15:00:00' AND login_time < '22:00:00' THEN
        INSERT INTO CPDCS_WebStatistics (date, afternoon_logins)
        VALUES (time_now, 1)
        ON DUPLICATE KEY UPDATE afternoon_logins = afternoon_logins + 1;
    ELSE
        INSERT INTO CPDCS_WebStatistics (date, night_logins)
        VALUES (time_now, 1)
        ON DUPLICATE KEY UPDATE night_logins = night_logins + 1;
    END IF;
END //

DELIMITER ;    