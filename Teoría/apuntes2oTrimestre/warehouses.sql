CREATE DATABASE WAREHOUSES;
USE WAREHOUSES;
CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code VARCHAR(255) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;

INSERT INTO Warehouses(Code,Location,Capacity)VALUES(1,'Chicago',3);
INSERT INTO Warehouses(Code,Location,Capacity)VALUES(2,'Chicago',4);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

-- Crea un nuevo almacén en New York con capacidad para 3 cajas.

INSERT INTO Warehouses (Code, Location, Capacity) VALUES (0,"New York", 3);

-- Crea una nueva caja con código "H5RT", que contenga "Papers" con un valor de 
-- $200, y situada en el almacén 2.

INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES ("H5RT","Papers", 200, 2);

-- Reduce el valor de todas las cajas un 15%.
UPDATE Boxes SET Value = Value * 0.85;

-- Aplica un 20% de reducción a las cajas con un valor superior 
-- que el valor medio de todas las cajas.
UPDATE Boxes
SET Value = Value * 0.80  
WHERE Value > (SELECT avg(Value) FROM (SELECT value FROM Boxes) as b1);

-- Elimina todas las cajas con un valor inferior a $100.
DELETE 
FROM Boxes 
WHERE value < 100;

-- Elimina todas las cajas de los almacenes saturados.
SELECT * FROM Boxes;

DELETE 
FROM Boxes
WHERE
    Code IN 
    (SELECT 
        Code
    FROM
        (SELECT 
            Warehouse
        FROM
            Boxes) AS b
	JOIN
		Warehouses as w ON b.warehouse = w.code
    GROUP BY Warehouse
    HAVING COUNT(*) >= w.Capacity)
    ;  
    
    
             
