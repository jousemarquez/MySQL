-- Transacciones
-- conjunto de instrucciones que se ejecutan a la vez
-- Tipo por defecto InnoDB
-- PASOS A SEGUIR
-- START TRANSACTION
-- Se usa para actualizar, insertar o eliminar
-- Hay que hacer un COMMIT para pasar instrucciones a base de datos
-- Si hay un problema se puede hacer ROLLBACK
-- SAVEPOINT. Punto de guardado, para poder hacer ROLLBACK hasta ese punto
-- ROLLBACK TO SAVEPOINT
-- COMMIT o ROLLBACK sin argumentos elimina los SAVEPOINTS
USE
northwind;


DROP
TABLE IF EXISTS trantest;


CREATE
TABLE trantest(campo INT NOT NULL PRIMARY KEY, descripcion VARCHAR(50)) ENGINE
= InnoDB;

INSERT INTO trantest VALUES(1,"Primer registro"),(2,"Segundo registro"),(3,"Tercer registro");

SELECT * FROM Northwind.trantest;
START TRANSACTION;
INSERT INTO trantest VALUES(4,"Cuarto registro"),(5,"Quinto registro");
ROLLBACK;

START TRANSACTION;
INSERT INTO trantest VALUES(4,"Cuarto registro"),(5,"Quinto registro");
SAVEPOINT S1;
INSERT INTO trantest VALUES(6,"Sexto registro"),(7,"Septimo registro");
ROLLBACK TO S1;
INSERT INTO trantest VALUES(6,"Sexto registro"),(7,"Septimo registro");

-- Si cerramos la base de datos en este punto, no se guarda ni el 4 ni el 5
-- no hemos hecho commit despues del start transaction;

