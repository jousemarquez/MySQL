-- 1. Seleccionar las órdenes de compra (Orders) realizadas por el empleado con código entre el 2 y 5 con fecha de pedido del 31 de julio de cualquier año. Buscar información sobre la función EXTRACT.
SELECT OrderID, EmployeeID, OrderDate FROM Northwind.Orders WHERE (EmployeeID BETWEEN 2 AND 5) AND extract(DAY FROM OrderDate)=31 AND extract(MONTH FROM OrderDate)=7;
-- 2. Seleccionar las órdenes de compra realizadas por el empleado con código 3, de cualquier año, pero solo de los últimos 5 meses (agosto-diciembre). Buscar información sobre la función MONTH.
SELECT * FROM Northwind.Orders WHERE EmployeeID="3" AND extract(MONTH FROM OrderDate) BETWEEN 8 AND 12;
-- 3.Seleccionar los detalles de las órdenes de compras (tabla OrderDetails) que tengan cantidades entre 10 y 250.
SELECT * FROM Northwind.OrderDetails WHERE Quantity BETWEEN 10 AND 250;
-- 4. Seleccionar los detalles de las órdenes de compras cuyo coste (precio unitario x unidades) se encuentre entre 10 y 330. Mostrar el coste como TOTAL.
SELECT (UnitPrice*Quantity) AS "TOTAL" FROM OrderDetails WHERE (UnitPrice*Quantity) BETWEEN 10 AND 330;
-- 5. Hacer un listado de todos los países a los que pertenecen los distintos clientes (buscar información sobre el operador DISCTINCT).
SELECT DISTINCT Country FROM Northwind.Customers;
-- 6. Mostrar los 15 productos más vendidos.
SELECT * FROM Northwind.Products ORDER BY UnitsOnOrder DESC LIMIT 15;
SELECT * FROM OrderDetails ORDER BY Quantity DESC LIMIT 15;
-- OJO PORQUE HAY DISCREPANCIA EN ESTE EJERCICIO PORQUE TODAVÍA NO SABEMOS OPERACIONES COMPLEJAS 
-- 7. Imprimir el nombre de todos los empleados, así como la longitud en caracteres del mismo (en dos columnas).
SELECT FirstName, length(FirstName) FROM Northwind.Employees;
-- 8. Imprimir en una única columna el nombre y apellidos de todos los empleados, concatenados.
SELECT FirstName, LastName, concat(FirstName," ",LastName) FROM Northwind.Employees;
-- 9. Imprimir el nombre de los empleados en minúsculas y el apellido en mayúsculas.
SELECT LOWER(FirstName), UPPER(LastName) FROM Northwind.Employees;
-- 10. Imprimir el nombre de los empleados, excluyendo la primera y última letra.
SELECT SUBSTRING(FirstName,2,length(FirstName)-2) FROM Employees;
-- 11.Imprimir el nombre, apellidos y fecha de nacimiento de todos los empleados. La fecha de nacimiento debe estar en el formato europeo (DD—MM--AAAA).
-- FORMA UNO E INEFICIENTE
SELECT FirstName, LastName, CONCAT(extract(DAY FROM BirthDate),"-",extract(MONTH FROM BirthDate),"-",extract(YEAR FROM BirthDate)) FROM Employees;
-- FORMA DOS Y EFICIENTE
SELECT FirstName, LastName, BirthDate, DATE_FORMAT(BirthDate, "%H-%d-%m-%Y") AS "Cumpleaños" FROM Employees;
-- 12. Por cada empleado, imprimir junto a su nombre y apellidos, el número de años que han transcurrido desde su nacimiento hasta su contratación.
SELECT FirstName, LastName, DATEDIFF(HireDate,BirthDate)/365 AS DATEDIFF FROM Employees;
-- 13. Por cada empleado, imprimir el número de años que han transcurrido desde su contratación hasta la fecha actual.
SELECT FirstName, DATEDIFF(CURRENT_TIMESTAMP,HireDate)/365 AS YEARSWORKING FROM Employees;
-- 14. Repetir el ejercicio anterior expresando el resultado en meses.
SELECT FirstName, DATEDIFF(CURRENT_TIMESTAMP,HireDate)/30 AS YEARSWORKING FROM Employees;
-- 15. Repetir el ejercicio anterior expresando el resultado en días.
SELECT FirstName, DATEDIFF(CURRENT_TIMESTAMP,HireDate) AS YEARSWORKING FROM Employees;
-- 16. Imprimir el nombre del día de la semana en el que nació cada empleado, junto con su nombre y apellidos.
SELECT FirstName, LastName, dayname(BirthDate) FROM employees;
-- 17. Imprimir el nombre del mes en el que fue contratado cada empleado, junto con su nombre y apellidos.
SELECT FirstName, LastName, month(HireDate) FROM employees;
-- 18. Por cada pedido, imprimir el id de pedido, nombre del producto y beneficio (precio unitario x unidades del pedido).
-- NO SE PUEDE HACER TODAVÍA;
-- 19. Repetir el ejercicio anterior añadiendo una nueva columna con el nuevo beneficio resultante de incrementar un 20% el precio unitario del producto. Imprimir esa nueva columna como ‘NUEVO BENEFICIO’.
-- NO SE PUEDE HACER TODAVÍA;
-- 20. Por cada empleado, imprimir nombre, apellidos, fecha de contratación y antigüedad en días (días que lleva contratado).
SELECT FirstName, LastName, HireDate, DATEDIFF(current_timestamp,HireDate) FROM Employees;
-- 21. Repetir el ejercicio anterior añadiendo una nueva columna con la edad a la que fue contratado.
SELECT FirstName, LastName, HireDate, DATEDIFF(current_timestamp,HireDate), datediff(HireDate,BirthDate)/365 AS "Edad" FROM Employees;
-- 22. Seleccionar los 7 productos con precio más caro, que cuenten con stock en almacén. Buscar información sobre la función LIMIT.
SELECT * FROM Products WHERE UnitsInStock>0 ORDER BY UnitPrice DESC LIMIT 7;
-- 23. Seleccionar los 9 productos con menos stock en almacén, que pertenezcan a la categoría 3, 5 u 8.
SELECT * FROM Products WHERE CategoryID IN (3,5,8) ORDER BY UnitsInStock ASC LIMIT 9;
SELECT sum(UnitsInStock) FROM Products;
SELECT COUNT(EmployeeID) FROM Employees;
-- Contar el número de productos para los que no hay stock.
SELECT COUNT(*) FROM Products WHERE UnitsInStock=0;
-- Sumar el total de unidades en stock de todos los productos cuyo campo UnitsOnOrder no sea cero.
SELECT SUM(UnitsInStock) FROM Products WHERE UnitsOnOrder>0;
-- Contar el número de empleados cuyo nombre empieza por la letra A.
SELECT COUNT(*) FROM Employees WHERE FirstName LIKE "A%";