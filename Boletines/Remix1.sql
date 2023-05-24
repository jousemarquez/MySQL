-- 1. Contar la cantidad de pedidos que han sido realizados por un cliente de Mexico.
SELECT cust.CompanyName, cust.Country, count(*) AS Pedidos
FROM Customers AS cust
JOIN Orders AS ord
ON cust.CustomerID = ord.CustomerID
WHERE cust.Country LIKE "Mexico";
-- EN CASO DE QUE SEAN LOS PEDIDOS POR "CADA CLIENTE DE MÉXICO" SE HACE ASÍ:
SELECT cust.CompanyName, cust.Country, count(*) AS Pedidos
FROM Customers AS cust
JOIN Orders AS ord
ON cust.CustomerID = ord.CustomerID
WHERE cust.Country LIKE "Mexico"
GROUP BY cust.CompanyName;

-- 2. Por cada pedido adjuntar, además de su información, el nombre de la 
-- compañía que lo ha enviado (ShipVia).
SELECT ord.*, ship.CompanyName
FROM Orders AS ord
JOIN Shippers AS ship
ON ord.ShipVia = ship.ShipperID
GROUP BY ord.OrderID;

-- 3. Imprimir toda la información de los clientes, con los nombres de las columnas
-- traducidos al castellano y separando con espacios aquellos nombres
-- compuestos de varias palabras.
SELECT CustomerID, CompanyName "Nombre de compañía", ContactName "Nombre de contacto", 
ContactTitle "Título", Address "Dirección", City "Ciudad", Region, PostalCode "Código postal",
Country "País", Phone "Teléfono", Fax
FROM Customers;

-- 4. Por cada producto, mostrar su nombre y la descripción de la categoría
-- a la que pertenece.
SELECT pro.ProductName, cat.Description
FROM Products AS pro
JOIN Categories AS cat
ON pro.CategoryID = cat.CategoryID;

-- 5. Mostrar los paises y cantidad de empleados que tiene cada país.
SELECT Country, count(*) AS "Empleados Por Pais"
FROM Employees
GROUP BY Country;

-- 6. Contar los pedidos que han sido realizados por clientes de España.
SELECT count(*) AS "Pedidos Clientes España"
FROM Customers AS cus
JOIN Orders AS ord
ON cus.CustomerID = ord.CustomerID
WHERE Country LIKE "Spain";

-- 7. Mostrar los pedidos realizados por clientes de Suecia y Argentina.
SELECT *
FROM Customers AS cus
JOIN Orders AS ord
ON cus.CustomerID = ord.CustomerID
WHERE cus.Country IN ("Sweden","Argentina");

-- 8. Por cada pedido, mostrar el descuento medio.
SELECT OrderID, AVG(Discount) AS DescuentoMedio
FROM orderdetails 
GROUP BY OrderID;

-- 9. Por cada pedido, contar los productos que incluye, solo para aquellos 
-- pedidos que cuentan con más de tres productos y han sido atendidos por
-- un empleado estadounidense.

SELECT ord.OrderID, count(*) AS PedidosTrabajadorUSA
FROM Orders AS ord
JOIN OrderDetails AS ordd
ON ord.OrderID = ordd.OrderID
JOIN Employees AS emp
ON ord.EmployeeID = emp.EmployeeID
WHERE emp.Country LIKE "USA"
GROUP BY ord.OrderID
HAVING PedidosTrabajadorUSA > 3
ORDER BY ord.OrderID ASC;

-- 10. Mostrar los nombres y apellidos de todos los empleados utilizando
-- una única columna, ordenándolos por edad, de mayor a menor.
SELECT * FROM Employees;
SELECT concat_ws(" ",FirstName, LastName) AS Empleado, substr(datediff(curdate(),BirthDate)/365,1,2) AS Edad
FROM Employees
ORDER BY BirthDate;

-- FORMA DE EMILIO
SELECT * FROM Employees;
SELECT concat_ws(" ",FirstName, LastName) AS Empleado, year(curdate())-year(birthdate) AS Edad
FROM Employees
ORDER BY BirthDate;