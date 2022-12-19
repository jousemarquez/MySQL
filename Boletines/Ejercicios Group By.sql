-- 1. Por cada pedido, mostrar el número de líneas (tabla OrderDetails).
SELECT OrderID, count(*) 'Nº lineas' FROM OrderDetails GROUP BY OrderID;
-- 2. Por cada producto, mostrar el número de líneas (tabla OrderDetails).
SELECT ProductID, count(*) 'Nº lineas' FROM OrderDetails GROUP BY ProductID;
-- 3. Por cada cliente, mostrar el número de pedidos.
SELECT CustomerID, count(*) 'Nº pedidos' FROM Orders GROUP BY CustomerID;
-- 4. Repetir el anterior sólo con los clientes de Londres.
SELECT CustomerID, count(*) 'Pedidos Londres' FROM Orders WHERE ShipCity='London' GROUP BY CustomerID;
-- 5. Repetir el ejercicio 1 mostrando sólo aquellos que tienen más de 4 líneas.
SELECT OrderID, count(*) 'Lineas' FROM OrderDetails GROUP BY OrderID HAVING Lineas>4;
-- 6. Por cada cliente, mostrar el número de pedidos sólo para los clientes con más de 10 pedidos.
SELECT CustomerID, count(*) 'Pedidos' FROM Orders GROUP BY CustomerID HAVING Pedidos>10;
-- 7. Mostrar el número de empleados en cada ciudad.
SELECT City, COUNT(*) 'Empleados_por_ciudad' FROM Employees GROUP BY City;
-- 8. Mostrar el número de empleados en cada ciudad que tenga al menos dos empleados.
SELECT City, COUNT(*) 'Empleados_por_ciudad' FROM Employees GROUP BY City HAVING empleados_por_ciudad>=2;
-- 9. Mostrar el número de empleados en cada ciudad que tengan el cargo de ‘Sales representative’, 
-- para aquellas ciudades con al menos dos empleados de este cargo. Ordenar por el número de empleados.
-- Forma con WHERE
SELECT COUNT(*), City, Title FROM employees WHERE Title="Sales representative" GROUP BY City HAVING COUNT(*)>=2;
-- Forma con HAVING
SELECT City, COUNT(*), Title FROM Employees GROUP BY City, Title HAVING (Title LIKE "Sales Representative" AND COUNT(*) >= 2);
-- 10. Muestra las distintas ciudades en las que hay empleados.
SELECT DISTINCT City FROM employees; -- Como el GROUP BY de los dos siguientes ya directamente filtra los duplicados, aquí sí es necesario eliminarlos con DISTINCT
SELECT City, COUNT(*) 'Ciudades de los empleados' FROM Employees GROUP BY City;
SELECT City FROM employees GROUP BY City HAVING COUNT(EmployeeID)>0;
-- 11. Cuenta las ciudades en las que hay empleados.
SELECT City FROM Employees GROUP BY City;
-- 12. Por cada país y ciudad de envío, mostrar el total de pedidos.
SELECT ShipCountry, ShipCity, COUNT(*)'total_pedidos' 
FROM Orders
GROUP BY ShipCountry, ShipCity;
-- 13. Por cada país y ciudad, contar los empleados que tienen el cargo de ‘Sales representative’.
SELECT Country, City, COUNT(*) 'Sales_Representative'
FROM Employees
GROUP BY Country, City, Title
HAVING Title='Sales Representative'; -- Ojo, que si se quiere consultar una columna dentro del HAVING hay que definirla dentro del GROUP BY.
-- 14. Por cada país y ciudad, contar el número de clientes.
SELECT * FROM Customers;
SELECT Country, City, COUNT(*) 'Num_Clientes'
FROM Customers
GROUP BY Country, City;
-- 15. Repetir el anterior mostrando sólo aquellos que tienen más de un cliente.
SELECT Country, City, COUNT(*) 'Num_Clientes'
FROM Customers
GROUP BY Country, City
HAVING Num_Clientes>1;
-- 16. Por cada producto, hallar la cantidad de unidades vendidas y la media por pedido.
SELECT ProductID, SUM(Quantity) 'Unidades_Vendidas', AVG(Quantity) 'Media_Por_Pedido'
FROM OrderDetails
GROUP BY ProductID;
-- 17. Por cada pedido, contar los distintos productos vendidos (no la cantidad).
SELECT OrderID, COUNT(*) 'Productos_Vendidos'
FROM orderdetails
GROUP BY OrderID;
-- 18. Repetir el anterior mostrando solo los pedidos con un único producto.
SELECT OrderID, COUNT(ProductID) 'Productos_Vendidos' 
FROM orderdetails 
GROUP BY OrderID
HAVING count(ProductsID)=1;
-- 19. En la tabla de proveedores (suppliers), contar el número de proveedores por cada título de contacto (ContactTitle).
SELECT ContactTitle, count(SupplierID) 'Proveedores_Contacto'
FROM Suppliers
GROUP BY ContactTitle;
-- 20. Contar el número de productos que empiezan por la letra C.
SELECT count(ProductName) 'Productos C%'
FROM Products
WHERE ProductName LIKE 'C%';
-- 21. Contar el número de pedidos que fueron realizados en un mes de Julio (OrderDate).
SELECT count(*) 'Pedidos en Julio'
FROM Orders
WHERE extract(MONTH from OrderDate)=7;
-- Otra forma
SELECT COUNT(*) 
FROM orders 
WHERE month(OrderDate)=7;
-- 22. Contar el número de pedidos realizados por el cliente DUMON en el año 1997.
SELECT count(*) 'Nº Pedidos DUMON 1997'
FROM Orders
WHERE extract(YEAR from OrderDate)=1997 AND CustomerID='DUMON';
-- Otra forma
SELECT COUNT(*) AS "Nº pedidos", CustomerID
FROM orders
WHERE YEAR(OrderDate)=1997
GROUP BY CustomerID
HAVING CustomerID="DUMON";
-- 23. Contar el número de pedidos (Orders) en los que los años de sus campos de tipo fecha no son exactamente iguales.
SELECT count(*) 'Pedidos_sin_años_iguales' FROM Orders
WHERE YEAR(OrderDate) != YEAR(RequiredDate) AND YEAR(OrderDate) != YEAR(ShippedDate)
AND YEAR(RequiredDate) != YEAR(OrderDate) AND YEAR(RequiredDate) != YEAR(ShippedDate)
AND YEAR(ShippedDate) != YEAR(OrderDate) AND YEAR(ShippedDate) != YEAR(RequiredDate);

SELECT count(*) 'Pedidos_sin_años_iguales' FROM Orders
WHERE extract(YEAR from OrderDate) != extract(YEAR from RequiredDate) AND extract(YEAR from OrderDate) != extract(YEAR from ShippedDate)
AND extract(YEAR from RequiredDate) != extract(YEAR from OrderDate) AND extract(YEAR from RequiredDate) != extract(YEAR from ShippedDate)
AND extract(YEAR from ShippedDate) != extract(YEAR from OrderDate) AND extract(YEAR from ShippedDate) != extract(YEAR from RequiredDate);

-- OJO, ESTA QUERY DE ARRIBA FUNCIONA PERO EN MAC NO.
SELECT count(*) AS "Número de pedidos con años de los campos tipo fecha diferentes" FROM orders
WHERE YEAR(OrderDate)!=YEAR(RequiredDate) AND YEAR(OrderDate)!=YEAR(ShippedDate) AND YEAR(RequiredDate)!=YEAR(ShippedDate);