-- EJERCICIO 1: Cree una tabla de nombre CATEGORIES2 que tenga exactamente la misma estructura y 
-- tipos de datos que la tabla CATEGORIES.

DROP TABLE IF EXISTS `CATEGORIES2`;
CREATE TABLE `CATEGORIES2` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(15) NOT NULL,
  `Description` longtext,
  `Picture` longblob,
  PRIMARY KEY (`CategoryID`),
  KEY `Categories_CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- COMENTARIO: he definido los datos TAL CUAL aparecen en CATEGORIES aunque estos no son los óptimos, como por ejemplo,
-- se define la Primary Key "CategoryID" con int en vez de BIGINT.

-- EJERCICIO 2: Rellene la nueva tabla con todos los datos que existan en la tabla original,
-- utilizando para ello una única sentencia SQL (no puede utilizar la palabra reservada VALUES)

INSERT INTO CATEGORIES2 SELECT * FROM CATEGORIES;

-- EJERCICIO 3: Imprima sin repetir los nombres de aquellas ciudades que tengan MENOS clientes
-- que la cantidad de clientes de Buenos Aires menos los de Barcelona.

SELECT DISTINCT
    City
FROM
    Customers
WHERE
    City NOT IN (SELECT 
            City
        FROM
            Customers
        WHERE
            City NOT IN ('Buenos Aires' , 'Barcelona')
        GROUP BY City
        HAVING COUNT(*) >= ((SELECT 
                COUNT(*)
            FROM
                Customers
            WHERE
                City = 'Buenos Aires') - (SELECT 
                COUNT(*)
            FROM
                Customers
            WHERE
                City = 'Barcelona')));
-- EJERCICIO 4: Imprima los productos cuyo precio unitario y unidades en stock sean inferiores al
-- precio unitario medio y unidades en stock medio.

SELECT 
    *
FROM
    Products
WHERE
    UnitPrice < (SELECT 
            AVG(UnitsInStock)
        FROM
            Products)
        AND UnitsInStock < (SELECT 
            AVG(UnitsInStock)
        FROM
            Products);
            
-- EJERCICIO 5: Imprima el nombre y apellidos de aquellos empleados que tienen un número de pedidos
-- inferior a la suma de pedidos del empleado número 1 y el empleado número 4.

SELECT 
    CONCAT(FirstName, ' ', LastName) AS 'NombreEmpleado'
FROM
    Employees
WHERE
    EmployeeID IN (SELECT 
            EmployeeID
        FROM
            Orders
        WHERE
            EmployeeID NOT IN (1,4)
        GROUP BY EmployeeID
        HAVING COUNT(*) <= (SELECT 
                COUNT(*)
            FROM
                Orders
            WHERE
                EmployeeID IN (1,4)));

-- EJERCICIO 6: Elimine de la tabla CATEGORIES2 aquellas categorías cuya descripción contengan
-- las palabras meats", "candies" o "fish".

DELETE FROM CATEGORIES2 
WHERE
    Description LIKE '%meats%'
    OR Description LIKE '%candies%'
    OR Description LIKE '%fish%';