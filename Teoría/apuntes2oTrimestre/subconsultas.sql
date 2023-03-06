-- 0. Ciudades que tienen menos clientes que la ciudad de Buenos Aires.
SELECT city, count(*) CantidadClientes
FROM customers group by city
having CantidadClientes < (SELECT COUNT(*) FROM Customers WHERE City="Buenos Aires");
-- 1
/*Productos cuyo valor de unidades en stock sea superior al valor máximo de unidades 
en stock de los productos de la categoría 4.*/
SELECT * FROM Products WHERE (UnitsInStock*UnitPrice)
> (SELECT UnitsInStock*UnitPrice FROM Products 
WHERE CategoryID=4 ORDER BY UnitsInStock*UnitPrice DESC LIMIT 1 );

-- 2. Nombre de los empleados que son jefes.
SELECT concat_ws(' ', FirstName, LastName) as "Empleados que son jefes" FROM Employees WHERE EmployeeID IN 
(SELECT ReportsTo FROM Employees);

-- 3. Productos cuya nombre de categoría empieza por la letra C.
SELECT ProductID FROM products
WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName LIKE "C%");

-- 4. Pedidos cuyo valor de carga (Freight) está por encima de la media.
SELECT * FROM orders WHERE Freight > (SELECT AVG(Freight) FROM orders);

-- 5 Productos cuyo valor de unidades en stock sea superior al valor máximo de unidades 
-- en stock de los productos de la categoría 4.
-- REPETIDO --

-- 6 Escribir una consulta para recuperar el nombre de la compañía e ID de proveedor
-- de aquellos proveedores que viven en un país que tiene mas proveedores que Alemania.
SELECT CompanyName, SupplierID FROM Suppliers WHERE Country IN 
(SELECT Country FROM Suppliers GROUP BY Country HAVING Count(*) >
(SELECT Count(*) FROM Suppliers WHERE Country='Germany'));

-- 7. Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados
-- que tienen una edad superior a la edad media.
SELECT concat_ws('-', FirstName, LastName) as Nombre, TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) 
as edad FROM Employees WHERE edad > (SELECT avg(TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())) FROM Employees);

-- 15. Recuperar los ID de productos con un
-- precio unitario superior al precio unitario medio.
SELECT ProductID FROM products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM products);

