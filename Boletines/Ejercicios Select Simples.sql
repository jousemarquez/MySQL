-- 02. Mostrar todos los empleados y todos sus atributos.
SELECT * FROM Northwind.Employees; 
-- 03. Mostrar todos los productos y todos sus atributos.
SELECT * FROM Northwind.Products; 
-- 04. Mostrar el código, nombre y categoría de los productos.
SELECT ProductsID, ProductName, CategoryID FROM Northwind.Products;
-- 05. Mostrar los productos que pertenecen a la categoría 2.
SELECT * FROM Northwind.Products WHERE CategoryID=2;
-- 06. Productos que pertenece a la categoría 2 y 4.
SELECT * FROM Northwind.Products WHERE CategoryID=2 AND CategoryID=4;
-- 07. Productos que pertenece a la categoría 2 o 4.
SELECT * FROM Northwind.Products WHERE CategoryID=2 OR CategoryID=4;
-- 08. Mostrar id de producto, nombre de producto y precio unitario para todos aquellos productos cuyo precio unitario sea superior a 100.
SELECT ProductID, ProductName, UnitPrice FROM Northwind.Products WHERE UnitPrice >=100;
SELECT * FROM Northwind.Products WHERE ProductName LIKE "Tofu";-- Mostrar el producto con nombre “tofu”.
-- 09. Mostrar los productos cuyo ID se encuentra en la categoría, 2, 3 o 4. Hacer de dos formas distintas.
SELECT * FROM Northwind.Products WHERE ProductID=2 OR ProductID=3 OR ProductID=4;
SELECT * FROM Northwind.Products WHERE ProductID IN (2,3,4);
-- 10. Mostrar los productos cuyo ID de proveedor se encuentra en la categoría 3,5 o 8.
SELECT * FROM Northwind.Products WHERE SupplierID=3 OR SupplierID=5 OR SupplierID=8;
-- 11. Mostrar los productos cuyo precio oscilan entre 30 y 60 dólares.
SELECT * FROM Northwind.Products WHERE UnitPrice >= 30 AND UnitPrice <= 60;
-- 12. Mostrar los productos cuyo stock está entre 0 y 10.
SELECT * FROM Northwind.Products WHERE UnitsInStock >= 0 AND UnitsInStock <= 10;
-- 13. Mostrar todos los productos que empiezan con ‘c’.
SELECT * FROM Northwind.Products WHERE ProductName LIKE "C%";
-- 14. Ordenar todos los productos por nombre, en orden ascendente.
SELECT * FROM Northwind.Products ORDER BY ProductName ASC;
-- 15. Ordenar todos los productos por ID, en orden descendente.
SELECT * FROM Northwind.Products ORDER BY ProductID DESC;
-- 16. Seleccione todos los campos de la tabla cliente, ordenado por nombre del contacto
SELECT * FROM Northwind.Customers ORDER BY ContactName;
-- 17. Seleccione todos los campos de la tabla órdenes, ordenados por fecha de la orden, descendentemente.
SELECT * FROM Northwind.Orders ORDER BY OrderDate DESC;
-- 18. Seleccione todos los campos de la tabla detalle de la orden, ordenada por cantidad pedida. Ascendentemente.
SELECT * FROM Northwind.OrderDetails ORDER BY Quantity ASC;
-- 19. Obtener todos los productos, cuyo nombre comienzan con la letra P y tienen un precio unitario comprendido entre 10 y 120.
SELECT * FROM Northwind.Products WHERE ProductName LIKE "P%" AND UnitPrice>=10 AND UnitPrice<=120;
-- 20. Obtener todos los clientes de los países de: USA, Francia o UK. Hacer de dos formas.
SELECT * FROM Northwind.Customers WHERE Country="USA" OR Country="France" OR Country="UK";
SELECT * FROM Northwind.Customers WHERE Country IN ("USA","FRANCE","UK");
-- 21. Obtener todos los productos discontinuados (Discontinued=1) o sin stock, que pertenecen a la categoría 1, 3, 4 o 7.
SELECT * FROM products WHERE CategoryID IN (1,3,4,7) AND (Discontinued=1 OR UnitsInStock<=0);
-- 22. Obtener todas las órdenes hechas por el empleado con código: 2, 5 o 7 en el año 1996.
SELECT * FROM Northwind.Orders WHERE EmployeeID IN (2,5,7) AND OrderDate BETWEEN "1996-01-01" AND "1996-12-31";
-- 23. Seleccionar todos los clientes que cuenten con Fax (valor distinto de null).
SELECT * FROM Northwind.Customers WHERE Fax IS NOT NULL;
-- 24. Seleccionar todos los empleados que cuentan con un jefe (campo ReportsTo).
SELECT * FROM Northwind.Employees WHERE ReportsTo IS NOT NULL;
-- 25. Seleccionar todos los campos del cliente, cuya compañía empiecen con letra A hasta la D y pertenezcan al país de USA, ordenarlos por la dirección.
SELECT * FROM customers WHERE (CompanyName BETWEEN "A%" AND "D%") AND (Country = "USA") ORDER BY Address ASC;
-- 26. Seleccionar todos los campos del cliente, cuya compañía empiecen con las letras de la B a la G, y pertenezcan al país de UK, ordenarlos por nombre de la compañía.
SELECT * FROM Northwind.Customers
WHERE CompanyName
BETWEEN "B%" AND "G%" AND Country LIKE "UK"
ORDER BY CompanyName ASC;

/* 27. Seleccionar los productos vigentes cuyos precios unitarios están entre 35 y 250, sin
stock en almacén, pertenecientes a las categorías 1, 3, 4, 7 o 8, que son
distribuidos por los proveedores, 2, 4, 6, 7, 8 o 9.*/
SELECT * FROM products
WHERE (UnitPrice >= 35 AND UnitPrice <= 250)
AND UnitsInStock=1
AND (CategoryID=1 OR CategoryID=3 OR CategoryID=4 OR CategoryID=7)
AND (SupplierID=2 OR SupplierID=3 OR SupplierID=7 OR SupplierID=8 OR SupplierID=9);

/* 28. seleccionar todos los campos de los productos descontinuados, que pertenezcan a
los proveedores con códigos: 1, 3, 7, 8 y 9, que tengan stock en almacén, y al
mismo tiempo que sus precios unitarios estén entre 39 y 190, ordenados por código
de proveedores y precio unitario de manera ascendente.*/
SELECT * FROM Northwind.Products
WHERE Discontinued=0
AND SupplierID IN (1,3,7,8,9)
AND UnitsInStock>0
AND UnitPrice
BETWEEN 39 AND 190
ORDER BY SupplierID, UnitPrice ASC;