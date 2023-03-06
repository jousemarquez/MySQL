-- 1
SELECT * 
FROM Orders AS ord
JOIN employees AS emp
ON emp.EmployeeID = ord.EmployeeID
WHERE concat_ws(' ', emp.FirstName, emp.LastName) = "Nancy Davolio" 
AND YEAR(ord.OrderDate) = 1997;

-- 2
SELECT cat.CategoryName, COUNT(*) as nº_productos 
FROM Products AS pro
JOIN Categories AS cat 
ON cat.CategoryID=pro.CategoryID
GROUP BY pro.CategoryID;

-- 3
SELECT 
    shi.CompanyName, COUNT(*) AS nº_pedidos
FROM
    Shippers AS shi
        JOIN
    Orders AS ord ON ord.ShipVia = shi.ShipperID
GROUP BY shi.ShipperID;

-- 4
SELECT DISTINCT
    cat.CategoryName, ode.OrderID
FROM
    OrderDetails AS ode
        JOIN
    Products AS pro ON pro.ProductID = ode.ProductID
        JOIN
    Categories AS cat ON pro.CategoryID = cat.CategoryID
ORDER BY ode.OrderID;

-- 5
SELECT 
    CONCAT_WS(' ', emp.FirstName, emp.LastName) AS 'Nombre Empleado +3 pedidos 1996',
    COUNT(*) AS Nº_Pedidos
FROM
    Orders AS ord
        JOIN
    employees AS emp ON emp.EmployeeID = ord.EmployeeID
WHERE
    YEAR(ord.OrderDate) = 1996
GROUP BY emp.EmployeeID
HAVING COUNT(*) > 3;

-- 6 
SELECT 
    CONCAT_WS(' ', emp.FirstName, emp.LastName) AS 'Nombre de Empleado',
    COUNT(*) AS Nº_Pedidos
FROM
    Orders AS ord
        JOIN
    employees AS emp ON emp.EmployeeID = ord.EmployeeID
GROUP BY emp.EmployeeID
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 7
SELECT SUM(pro.UnitsInStock) as "Unidades en Stock - Carnes Preparadas"
FROM Products as pro
JOIN Categories as cat
ON pro.CategoryID=cat.CategoryID
WHERE cat.Description = "Prepared meats";

-- 8

SELECT 
    *
FROM
    Employees
WHERE
    ReportsTo IN (SELECT 
            EmployeeID
        FROM
            Employees
        WHERE
            CONCAT_WS(' ', FirstName, LastName) = 'Andrew Fuller');
            
SELECT 
    *
FROM
    Employees AS emp
        JOIN
    Employees AS jefe ON emp.ReportsTo = jefe.EmployeeID
WHERE
    CONCAT_WS(' ', jefe.FirstName, jefe.LastName) = 'Andrew Fuller';
    
    
-- 

SELECT *
FROM employees
WHERE BirthDate 
	> 
		(SELECT MAX(BirthDate)
        FROM employees
        WHERE FirstName 
        IN ('Margaret' , 'Laura', 'Michael'));
        
-- 
SELECT *
FROM Products
WHERE CategoryID
	IN 
		(SELECT CategoryID
        FROM Categories
        WHERE lcase((substr(CategoryName, 1, 1))) LIKE 'C%' OR CategoryName LIKE 'D%');
           

