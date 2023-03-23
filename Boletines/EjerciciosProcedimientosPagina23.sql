-- Crear una rutina que reciba un número y lo eleve al cuadrado.

DELIMITER $$
CREATE PROCEDURE elevar_cuadrado(IN numero INT)
BEGIN
    DECLARE resultado INT;
    SET resultado = numero * numero;
    SELECT resultado;
END $$
DELIMITER ;
CALL elevar_cuadrado(numero);

-- Crear una rutina que reciba dos números, y eleve el primero al segundo (potencia). 

DELIMITER $$
CREATE PROCEDURE elevar_potencia(IN base INT, IN exponente INT)
BEGIN
    DECLARE resultado INT;
    SET resultado = POW(base, exponente);
    SELECT resultado;
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO

CALL elevar_potencia(base, exponente);

-- Crear una rutina que reciba dos cadenas y las concatene con un guion bajo.

DELIMITER $$
CREATE PROCEDURE concatenar_cadenas(IN cadena1 VARCHAR(255), IN cadena2 VARCHAR(255))
BEGIN
    SET resultado = CONCAT(cadena1, '_', cadena2);
    SELECT resultado;
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO

CALL concatenar(cadena1, cadena2);

-- Crear una rutina que reciba una cadena y le quite los espacios del principio y el final.

DELIMITER $$
CREATE PROCEDURE eliminar_espacio_inicio_final(INOUT cadena VARCHAR(255))
BEGIN
    SET resultado = TRIM(cadena);
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO
SET @cadena = '     HOLA MUNDO   ';
CALL eliminar_espacio_inicio_final(@cadena);
SELECT @cadena;

-- Crear una rutina que reciba una cadena y genere una segunda con el mismo contenido pero en mayúsculas.

DELIMITER $$
CREATE PROCEDURE clonar_cadena_mayuscula(IN cadena VARCHAR(255), OUT cadena_mayuscula VARCHAR(255))
BEGIN
    SET resultado = UPPER(cadena);
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO

SET @cadena = 'Hola me llamo Jouse';
CALL clonar_cadena_mayuscula(cadena, @cadena_mayus);
SELECT @cadena_mayus;