-- 1. Contar la cantidad de pedidos que han sido realizados por un cliente
-- de Mexico.
SELECT cust.CompanyName, cust.Country, count(*) AS Pedidos
FROM Customers AS cust
JOIN Orders AS ord
ON cust.CustomerID = ord.CustomerID
GROUP BY ord.OrderID
HAVING Country LIKE "Mexico";

-- 2. Por cada pedido adjuntar, además de su información, el nombre de la 
-- compañía que lo ha enviado (ShipVia).
SELECT count(*) AS Pedidos, ship.CompanyName
FROM Orders AS ord
JOIN Shippers AS ship
ON ord.ShipVia = ship.ShipperID
JOIN OrderDetails AS ordd
ON ord.OrderID = ordd.OrderID
GROUP BY ord.OrderID;

-- 3. Imprimir toda la información de los clientes, con los nombres de las columnas
-- traducidos al castellano y separando con espacios aquellos nombres
-- compuestos de varias palabras.
SELECT * FROM CUSTOMERS;
SELECT substring(locate(" ", ContactName), " ", 1) FROM Customers;

-- 4. Por cada producto, mostrar su nombre y la descripción de la categoría
-- a la que pertenece.
SELECT pro.ProductName, cat.Description FROM Products AS pro
JOIN Categories AS cat
ON pro.CategoryID = cat.CategoryID;

-- 5. Mostrar los paises y cantidad de empleados que tiene cada país.
SELECT Country, count(*) AS "EmpleadosPorPais" FROM employees
group by Country;

-- 6. Contar los pedidos que han sido realizados por clientes de España.
select count(*) AS "Pedidos Clientes España"
FROM Customers AS cus
JOIN Orders AS ord
ON cus.CustomerID = ord.CustomerID
Where Country LIKE "Spain";

-- 7. Mostrar los pedidos realizados por clientes de Suecia y Argentina.

-- 8. Por cada pedido, mostrar el descuento medio.

-- 9. Por cada pedido, contar los productos que incluye, solo para aquellos 
-- pedidos que cuentan con más de tres productos y han sido atendidos por
-- un empleado estadounidense.

-- 10. Mostrar los nombres y apellidos de todos los empleados utilizando
-- una única columna, ordenándolos por edad, de mayor a menor.