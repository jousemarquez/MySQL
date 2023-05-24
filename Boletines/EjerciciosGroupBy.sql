-- De la tabla pedidos (Orders), imprimir por cada empleado el número de pedidos. Debe mostrarse el ID de empleado como ID DEL EMPLEADO y el número de pedidos como NUM_PEDIDOS.
SELECT count(OrderID)'NUM_PEDIDO', EmployeeID'ID DEL EMPLEADO'
FROM Orders
GROUP BY EmployeeID;
-- De la tabla OrderDetails, por cada pedido, imprimir el ID de pedido y el total de unidades.
SELECT OrderID, SUM(Quantity)
FROM OrderDetails
GROUP BY OrderID;
-- Repetir el ejercicio anterior imprimiendo solo aquellos pedidos con un numero total de unidades inferior a 50.
SELECT OrderID, SUM(Quantity)
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity)<50;
-- En la tabla empleados, por cada país imprimir el número de empleados que ostentan el cargo de “Sales Representative”. Imprimir el nombre del país y el número.
--  PRIMERA FORMA
SELECT Country, COUNT(Title) as "Empleados S.R"
FROM Employees
WHERE Title = "Sales Representative"
GROUP BY Country;
--  SEGUNDA FORMA 
SELECT Title, Country, count(Title)
FROM Employees
GROUP BY Country, Title
HAVING (Title LIKE "Sales Representative");

-- En la tabla empleados, por cada país imprimir el número de empleados que NO ostentan el cargo de “Sales Representative”. Imprimir el nombre del país y el número.
SELECT Country, COUNT(Title) as "Empleados S.R"
FROM Employees
WHERE Title != "Sales Representative"
GROUP BY Country;

-- OTRA OPCIÓN 
SELECT Country, COUNT(EmployeeID)
FROM Employees
WHERE Title NOT LIKE "Sales Representative"
GROUP BY Country;