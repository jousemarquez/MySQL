USE
northwind;

DROP
TABLE IF EXISTS trantest;

CREATE
TABLE trantest(campo INT NOT NULL PRIMARY KEY, descripcion VARCHAR(50)) ENGINE
= InnoDB;

START TRANSACTION;
INSERT INTO trantest (campo,descripcion)
VALUES
(1,"Primer Caso"),
(2,"Segundo Caso");
COMMIT;