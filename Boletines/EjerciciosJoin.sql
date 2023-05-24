-- 1.Obtener todas las ordenes hechas por el empleado King Robert
SELECT ord.OrderID, emp.FirstName, emp.LastName
FROM Orders AS ord
JOIN Employees AS emp
ON ord.EmployeeID= emp.EmployeeID
WHERE emp.FirstName="Robert" AND emp.LastName="King";
-- 2.Obtener todas las ordenes hechas por el empleado King Robert, Davolio Nancy y Fuller Andrew
SELECT ord.OrderID, emp.FirstName, emp.LastName
FROM Orders AS ord
JOIN Employees AS emp
ON ord.EmployeeID= emp.EmployeeID
WHERE (emp.FirstName="Robert" AND emp.LastName="King") OR (emp.FirstName="Nancy" AND emp.LastName="Davolio") OR (emp.FirstName="Andrew" AND emp.LastName="Fuller");
-- 3.Obtener todas las ordenes por el cliente cuya compania es "Que del?cia"
SELECT ord.OrderID, ord.CustomerID, cust.CompanyName
FROM Orders AS ord
JOIN Customers AS cust
ON ord.CustomerID = cust.CustomerID
WHERE cust.CompanyName LIKE "Que del?cia";
-- 4.Obtener todos los productos(codigo, nombre, precio, stock) de la orden 10257
SELECT ord.OrderID, pro.ProductID, pro.ProductName, pro.UnitPrice, pro.UnitsInStock
FROM OrderDetails AS ord
JOIN Products AS pro
ON ord.ProductID = pro.ProductID
WHERE ord.OrderID="10257";
-- 5.Obtener todos los productos(codigo, nombre, precio, stock) de las ordenes hechas desde 1997 hasta la fecha de hoy
SELECT ord.OrderID, pro.ProductID, pro.ProductName, pro.UnitPrice, pro.UnitsInStock, ord.OrderDate
FROM Orders AS ord
JOIN OrderDetails AS ordd
ON ord.OrderID = ordd.OrderID
JOIN Products AS pro
ON ordd.ProductID = pro.ProductID
WHERE ord.OrderDate BETWEEN "1997-01-01" AND curdate();
-- 6.Mostar el ID del pedido, fecha del pedido y el total de productos de cada pedido
SELECT ordd.OrderID, ord.OrderDate, sum(ordd.Quantity) 'Total de productos'
FROM Orders AS ord
JOIN OrderDetails AS ordd
ON ord.OrderID = ordd.OrderID
GROUP BY ordd.OrderID;
-- 7.Obtener el nombre de todas las categorias y los nombres de sus productos, precio y stock.
SELECT cat.CategoryID, cat.CategoryName, pro.ProductName, pro.UnitPrice, pro.UnitsInStock
FROM Categories AS cat
JOIN Products AS pro
ON cat.CategoryID = pro.CategoryID;
-- 8.Obtener el número de productos, por cada categoría. Mostrando el nombre de la categoría
-- y el total de productos por categoría, solamente de las categorías 3, 5 y 8. Ordenar por el nombre de la categoría.
SELECT cat.CategoryID, cat.CategoryName, SUM(pro.UnitsInStock)
FROM products AS pro
JOIN categories AS cat 
ON pro.CategoryID = cat.CategoryID 
WHERE cat.CategoryID IN (3, 5, 8) 
GROUP BY cat.CategoryName
ORDER BY cat.CategoryName;
-- 9.Visualizar el nombre de la categoria y el numero de productos que hay por cada categoria
SELECT cat.CategoryID, cat.CategoryName, SUM(pro.UnitsInStock)
FROM products AS pro
JOIN categories AS cat 
ON pro.CategoryID = cat.CategoryID 
WHERE cat.CategoryID IN (3, 5, 8) 
GROUP BY cat.CategoryName
ORDER BY cat.CategoryName;
-- 10. Por cada pedido, obtener el ID de pedido, ID de proveedor y el nombre de la compañía.
SELECT ordd.OrderID, prod.ProductID, sup.SupplierID, sup.CompanyName 
FROM orderdetails AS ordd 
JOIN products AS prod 
ON ordd.ProductID = prod.ProductID
JOIN suppliers AS sup 
ON sup.SupplierID = prod.SupplierID
ORDER BY OrderID;
-- 11. Por cada pedido, obtener el ID de pedido, ID de empleado y el nombre de empleado.
SELECT ord.OrderID, ord.EmployeesID, emp.FirstName
FROM Orders AS ord
JOIN Employees AS emp
ON ord.EmployeeID = emp.EmployeeID;
-- 12. Por cada producto, obtener el ID de producto, ID de categoría y el nombre de categoría.
SELECT pro.ProductID, pro.CategoryID, cat.CategoryName
FROM Products AS pro
JOIN Categories AS cat
ON pro.CategoryID = cat.CategoryID
ORDER BY pro.ProductID ASC;
-- 13. Por cada empleado, imprimir el ID de empleado, nombre, apellido e ID de territorio.
SELECT emp.EmployeeID, concat(emp.FirstName," ",emp.LastName)'Empleado', empterr.TerritoryID
FROM Employees AS emp
JOIN EmployeeTerritories AS empterr ON emp.EmployeeID = empterr.EmployeeID;
-- 14. Por cada cliente, mostrar el ID de cliente, nombre de contacto y pedidos.
SELECT cust.CustomerID, cust.ContactName, ord.OrderID
FROM Customers AS cust
JOIN Orders AS ord ON cust.CustomerID = ord.CustomerID;
-- 15. Por cada cliente, mostrar el ID de cliente, nombre de contacto y numero total pedidos.
SELECT cust.CustomerID, cust.ContactName, count(*) 'Tº Pedidos'
FROM Customers AS cust
JOIN Orders AS ord ON cust.CustomerID = ord.CustomerID
GROUP BY ord.CustomerID;
-- 16. Por cada pedido presente en orderdetails, imprimir toda su información y además, el nombre de la categoría
-- a la que pertenece.
SELECT ordd.*, cat.CategoryName
FROM OrderDetails AS ordd
JOIN Products AS pro ON ordd.ProductID = pro.ProductID
JOIN Categories AS cat ON pro.CategoryID = cat.CategoryID;
-- 17. Por cada pedido, mostrar el ID de pedido, dirección del cliente y dirección del empleado.
SELECT ord.OrderID, cust.Address "Dirección del empleado", emp.Address "Dirección del empleado"
FROM orders AS ord
JOIN employees AS emp ON ord.EmployeeID = emp.EmployeeID
JOIN customers AS cust ON ord.CustomerID = cust.CustomerID;
-- 18. Por cada producto, mostrar el ID de producto, nombre de producto y dirección del proveedor.
SELECT pro.ProductID, pro.ProductName, supp.Address 'Dirección del proveedor'
FROM Products AS pro
JOIN Suppliers AS supp ON pro.SupplierID = supp.SupplierID
ORDER BY pro.ProductID ASC;
-- 19.Visualizar el nombre de la compañía y el id del cliente, fecha, precio unitario y producto de la orden.
SELECT cust.CompanyName, cust.CustomerID, ord.OrderDate, ordd.UnitPrice, ordd.ProductID, ordd.OrderID
FROM orders AS ord
JOIN Customers AS cust ON ord.CustomerID = cust.CustomerID
JOIN OrderDetails AS ordd ON ord.OrderID = ordd.OrderID;
-- 20.Mostrar el nombre del producto, el precio, el stock y el nombre de la categoría a la que pertenece.
SELECT pro.ProductName, pro.UnitPrice, pro.UnitsInStock, cat.CategoryName
FROM Products AS pro
JOIN Categories AS cat ON cat.CategoryID = pro.CategoryID;
-- 21.Mostrar el nombre del producto, el precio producto, el código del proveedor y el nombre de la compañía proveedora.
SELECT pro.ProductName, pro.UnitPrice, pro.SupplierID, supp.CompanyName
FROM Products AS pro
JOIN Suppliers AS supp ON pro.SupplierID = supp.SupplierID;
-- 22.Mostrar el id de la orden, fecha, código del producto, precio, código del empleado y su nombre completo.
SELECT ord.OrderID, ord.OrderDate, ordd.ProductID, ordd.UnitPrice, emp.EmployeeID, CONCAT(emp.FirstName," ",emp.LastName) 'Nombre de empleado'
FROM OrderDetails AS ordd
JOIN Orders AS ord ON ordd.OrderID = ord.OrderID
JOIN Employees AS emp ON emp.EmployeeID = ord.EmployeeID;
-- 23.Calcular el stock de productos por cada categoria. Mostrar el nombre de la categoria y el stock por categoria
SELECT cat.CategoryName, sum(pro.UnitsInStock) 'Total de productos'
FROM Products AS pro
JOIN categories AS cat ON pro.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName;
-- 24.Obtener el nombre del cliente, nombre del proveedor, nombre del empleado y el nombre de los productos que estan en la orden 10794
SELECT ord.OrderID, cust.CompanyName, supp.CompanyName, CONCAT(emp.FirstName," ",emp.LastName) 'Nombre de empleado', pro.ProductName
FROM Customers AS cust
JOIN Orders AS ord ON cust.CustomersID = ord.Customerid
JOIN Suppliers AS supp ON supp.SupplierID = pro.SupplierID
JOIN Employees AS emp ON emp.EmployeeID = ord.EmployeeID
JOIN Products AS pro ON pro.ProductID = ordd.ProductID
WHERE OrderID LIKE 10794;
-- 25.Seleccionar el nombre de la compañía del cliente, el código de la orden de compra, la fecha de la orden de compra,
-- código del producto, cantidad pedida del producto, nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor, usar Join
SELECT cust.CompanyName "Compañia cliente", ord.OrderID, ord.OrderDate "Fecha orden", orddet.ProductID, orddet.Quantity"Cantidad", prod.ProductName, sup.CompanyName"Proveedor", sup.City "Ciudad provee"
FROM orders AS ord
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID);
-- 26.Seleccionar cuantos proveedores tengo en cada país,
-- considerando solo a los nombres de los proveedores que comienzan con la letra E hasta la letra P,
-- además de mostrar solo los países donde tenga más de 2 proveedores
SELECT count(*) AS Proveedores, Country
FROM Suppliers
WHERE lower(substring(ContactName,1,1)) BETWEEN "e" AND "p%"
GROUP BY Country
HAVING Proveedores>2;
-- 27.Crear una consulta que muestre el nombre de empleado y el número de empleados que cada uno de los empleados tiene a su cargo.
SELECT Boss.EmployeeID, CONCAT(Boss.FirstName," ",Boss.LastName) 'Boss', count(*) 'Empleados a cargo'
FROM employees AS Boss, employees AS Slave
WHERE Slave.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID;
-- 28.Crear una consulta que muestre el nombre de empleado, el número de pedidos tramitado por cada empleado,
-- de aquellos empleados que han tramitado mas de 15 pedidos.
SELECT CONCAT(emp.FirstName," ",emp.LastName) AS Empleado, COUNT(*) AS Pedidos
FROM Employees AS emp
JOIN Orders AS ord
ON ord.EmployeeID = emp.EmployeeID
GROUP BY emp.EmployeeID
HAVING Pedidos>=15;

-- 29.Crear una consulta que muestre el nombre del cliente, el número de pedidos que nos ha realizado el cliente,
-- el dinero que nos ha dejado en la empresa, de todos los clientes que sean de USA y que nos han realizado mas de 5 pedidos.
SELECT cust.CompanyName AS "Nombre de cliente", COUNT(*) AS Pedidos, SUM(ordd.UnitPrice*ordd.Quantity) AS Ventas -- DUDA
FROM Customers AS cust
JOIN OrderDetails AS ordd
ON (ord.OrderID = ordd.OrderID)
JOIN Orders AS ord
ON (cust.CustomerID = ord.CustomerID)
WHERE cust.Country="USA" AND count(*)>5
GROUP BY ord.OrderID;


-- 30.Crear una consulta que muestre el nombre del jefe y el número de empleados a su cargo de aquel jefe que mas empleados tenga a su cargo.
SELECT Boss.EmployeeID, CONCAT(Boss.FirstName," ",Boss.LastName) 'Boss', count(*) 'Empleados a cargo'
FROM employees AS Boss, employees AS Slave
WHERE Slave.ReportsTo = Boss.EmployeeID
GROUP BY Boss.EmployeeID;

-- 31.Obtener el nombre del cliente y el número de pedidos del cliente que mas pedidos ha realizado en la empresa.
SELECT cust.CompanyName AS "Nombre de cliente", COUNT(*) AS Pedidos
FROM Orders AS ord
JOIN Customer AS cust
ON (ord.CustomerID = cust.CustomerID)
GROUP BY OrderID DESC LIMIT 1;

-- 32.Obtener el nombre del cliente y el volumen de negocio del cliente
-- que mas volumen de negocio nos ha dejado en la empresa.
SELECT cust.CompanyName AS "Nombre de cliente", SUM(ordd.UnitPrice*ordd.Quantity) AS Ventas
FROM Customers AS cust
JOIN Orders AS ord
ON (cust.CustomerID = ord.CustomerID)
JOIN OrderDetails AS ordd
ON (ord.OrderID = ordd.OrderID)
GROUP BY OrderID DESC LIMIT 1;