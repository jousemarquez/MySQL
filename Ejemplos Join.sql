-- EJERCICIO 1: realizar una consulta donde obtengamos el ID de los pedidos asociados a la empleada Nancy Davolio.

SELECT ord.OrderID, emp.LastName, emp.FirstName FROM orders AS ord
JOIN employees AS emp ON ord.EmployeeID = emp.EmployeeID
WHERE emp.FirstName="Nancy" AND emp.LastName="Davolio";

-- EJERCICIO 2: recuperar todos los campos de la tabla OrderDetails, imprimiendo además el ID de cliente.
SELECT ordd.*, ord.CustomerID
FROM OrderDetails AS ordd
JOIN Orders AS ord ON ordd.OrderID = ord.OrderID;

-- EJERCICIO 3: por cada producto, mostrar el nombre del producto y el nombre de la compañía que lo provee.
SELECT pro.ProductName, sup.CompanyName FROM Products AS pro
JOIN Suppliers AS sup ON pro.SupplierID = sup.SupplierID;