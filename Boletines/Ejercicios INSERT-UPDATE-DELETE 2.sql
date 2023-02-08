-- BOLETÍN PIEZAS
USE PIEZAS;
-- 1.	Añadir una entrada a la base de datos para indicar que "Suministros Skellington" (code "TNBC") proveerá piñones (code "1") por 7 céntimos cada uno.
INSERT INTO provee (ID_Pieza, ID_Proveedor, Precio)
values ("1", "TNBC", "7");
-- 2.	Incrementa todos los precios por un céntimo.
UPDATE provee 
SET 
    Precio = Precio + 1;
-- 3.	Actualiza la base de datos para reflejar que "Corporacion Susan Calvin" (code "RBT") no proveerá clavos (code 4).
DELETE FROM provee 
WHERE
    ID_Proveedor = 'RBT' AND ID_Pieza = '4';
-- 4.	Actualiza la base de datos para reflejar que "Corporacion Susan Calvin" (code "RBT") no proveerá ninguna pieza (el proveedor debe permanecer en la base de datos).
DELETE FROM provee 
WHERE
    ID_Proveedor = 'RBT';

-- BOLETÍN MOVIES
USE MOVIES;

-- 1. Añade la película "One, Two, Three" sin calificación.

INSERT INTO Movies (Code, Title, Rating) VALUES (1,'One, Two, Three', ''); -- DUDA

-- 2. Configura la calificación de todas las películas sin calificar a "G".

UPDATE movies 
SET 
    rating = 'G'
WHERE
    rating IS NULL;

-- 3. Elimina cines que proyecten películas calificadas con "NC-17".

DELETE FROM MovieTheaters 
WHERE
    Code = (SELECT 
        Code
    FROM
        Movies
    WHERE
        Rating = 'NC-17');

-- BOLETÍN WAREHOUSES.
USE WAREHOUSES;

-- 1. Crea un nuevo almacén en New York con capacidad para 3 cajas.
SELECT * FROM WAREHOUSES;
SELECT * FROM BOXES;

INSERT INTO Warehouses (Code,Location,Capacity)
VALUES (6,"New York","3");

-- 2. Crea una nueva caja con código "H5RT", que contenga "Papers" con un valor de $200, y situada en el almacén 2.
INSERT INTO Boxes (Code, Contents, Value, Warehouse)
VALUES ("H5RT","Papers","200","2");

-- 3. Reduce el valor de todas las cajas un 15%.
UPDATE Boxes 
SET 
    Value = Value - ((15 * Value) / 100);

-- 4. Aplica un 20% de reducción a las cajas con un valor superior que el valor medio de todas las cajas.
UPDATE Boxes 
SET 
    Value = Value - ((20 * Value) / 100)
WHERE
    Value > (SELECT 
            AVG(tmp.Value)
        FROM
            (SELECT 
                *
            FROM
                BOXES) AS tmp);

-- 5. Elimina todas las cajas con un valor inferior a $100.
START TRANSACTION;
DELETE FROM Boxes WHERE Value < 100;
COMMIT;

-- 6. Elimina todas las cajas de los almacenes saturados.
DELETE FROM boxes 
WHERE
    Warehouse IN (SELECT 
        *
    FROM
        (SELECT 
            Code
        FROM
            warehouses AS war
        
        WHERE
            wr.Capacity <= (SELECT 
                COUNT(*)
            FROM
                boxes AS box
            
            WHERE
                box.Warehouse = war.Code)));

-- BOLETÍN DEPARTMENTS
USE DEPARTMENTS;

-- 1. Añade un nuevo departamento llamado "Quality Assurance", con un presupuesto de $40,000 y código de departamento de 11.
-- Añade un empleado llamado "Mary Moore" en ese departamento, con SSN 847-21-9811.
START TRANSACTION;
INSERT INTO Departments(Code,Name,Budget)
VALUES (11,"Quality Assurance",40000);
COMMIT;

START TRANSACTION;
INSERT INTO Employees(SSN,Name,LastName,Department)
VALUES (847219811,"Mary","Moore",11);
COMMIT;

-- 2. Reduce el presupuesto de todos los departamentos un 10%.
START TRANSACTION;
UPDATE Departments
SET 
    Budget = Budget - ((10 * Budget) / 100);
COMMIT;

-- OTRA FORMA DE HACERLO
START TRANSACTION;
UPDATE Departments 
SET 
    Budget = Budget * 0.9;
COMMIT;

-- 3. Reasigna todos los empleados del departamento Research (code 77) al departamento IT (code 14).
START TRANSACTION;
UPDATE Employees 
SET 
    Department = 14
WHERE
    Department = 77;
COMMIT;

-- 4. Borra todos los empleados del departamento de IT (code 14).
START TRANSACTION;
DELETE FROM Employees 
WHERE
    Department = 14;
COMMIT;

-- 5. Borra todos los empleados que trabajan en departamentos con un presupuesto superior o igual a $60,000.
DELETE Employees FROM Employees
        JOIN
    departments ON Departments.code = Employees.Department 
WHERE
    departments.budget >= 60000;

-- 6. Borra todos los empleados.
START TRANSACTION;
DELETE FROM employees; -- Borra el contenido de la tabla Employees
COMMIT;

-- BOLETÍN MANUFACTURERS
USE MANUFACTURERS;

-- 1. Añade un nuevo producto: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products (Code,Name,Price,Manufacturer) VALUE(11,"Loudspeakers",70,2);

-- 2. Actualiza el nombre del producto 8 a "Laser Printer".
UPDATE Products 
SET 
    Name = 'Laser Printer'
WHERE
    Code = 8;

-- 3. Aplica un 10% de descuento a todos los productos.
START TRANSACTION;
UPDATE Products
SET 
    Price = Price * 0.9;
COMMIT;

-- 4. Aplica un 10% de descuento a todos los productos con un precio superior o igual a $120.
UPDATE Products
SET 
    Price = Price * 0.9
WHERE Price >= 120;