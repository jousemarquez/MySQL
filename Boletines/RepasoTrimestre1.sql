SELECT CURDATE();
SELECT NOW();

SELECT 
    *
FROM
    Employees;

SELECT 
    pro.ProductID 'ID de producto',
    pro.ProductName 'Nombre de producto',
    pro.SupplierID 'ID de proveedor'
FROM
    Products AS pro;

SELECT 
    *
FROM
    Employees;
SELECT 
    *
FROM
    Categories;

SELECT 
    Prod.*
FROM
    Products Prod
WHERE
    CategoryID IN (1 , 3, 5);
 
SELECT 
    PROD.*
FROM
    Products PROD
WHERE
    PROD.ProductName LIKE '%HOLA%'
ORDER BY PROD.ProductName DESC;

-- Empleados que nacieron antes de 1955 solo nombre apellido y año
SELECT 
    Emp.FirstName, Emp.LastName, YEAR(Emp.BirthDate)
FROM
    Employees Emp
WHERE
    YEAR(BirthDate) < 1955;
    
-- JOIN
-- Ejercicio 1: 
-- Obtener todos los pedidos realizados por Nancy Davolio en 1997
SELECT 
    *
FROM
    Employees AS EMP
        JOIN
    Orders AS ORD ON (emp.EmployeeID = ord.EmployeeID)
WHERE
    EMP.FirstName = 'Nancy'
        AND EMP.LastName = 'Davolio'
        AND YEAR(ORD.OrderDate) = 1997;

-- Ejercicio 2
-- Obtener el número de productos por cada nombre de categoría

SELECT 
    CAT.CategoryName, COUNT(*) AS 'Número de productos'
FROM
    Products AS PRO
        JOIN
    Categories AS CAT ON (PRO.CategoryID = CAT.CategoryID)
GROUP BY CAT.CategoryID;-- Aunque se puede agrupar por CategoryName lo óptimo es usar el campo clave CategoryID

SELECT 
    SHI.CompanyName AS 'Compañía de envíos',
    COUNT(*) AS 'Número de pedidos'
FROM
    Shippers AS SHI
        JOIN
    Orders AS ORD ON (SHI.ShipperID = ORD.ShipVia)
GROUP BY SHI.ShipperID;

-- Ejercicio 3
-- Por cada pedido, mostrar las categorias de los productos que incluye.

SELECT 
    ORDD.OrderID, PRO.ProductID, CAT.CategoryName
FROM
    categories AS CAT
        JOIN
    products AS PRO ON (CAT.CategoryID = PRO.CategoryID)
        JOIN
    orderdetails AS ORDD ON (PRO.ProductID = ORDD.ProductID)
ORDER BY ORDD.OrderID;
    
-- Ejercicio 4
-- Mostrar los nombres de empleados que tienen mas de tres pedidos atendidos en el 1996.
SELECT 
    CONCAT_WS(' ', EMP.FirstName, EMP.LastName) AS 'Empleado',
    COUNT(*) AS 'Pedidos'
FROM
    Employees AS EMP
        JOIN
    Orders AS ORD ON EMP.EmployeeID = ORD.EmployeeID
WHERE
    YEAR(ORD.OrderDate) = 1996
GROUP BY EMP.EmployeeID
HAVING Pedidos > 3;

-- Ejercicio 5
-- Mostrar el nombre de empleado que tiene mas pedidos atendidos.
SELECT 
    CONCAT_WS(' ', EMP.FirstName, EMP.LastName) AS 'Empleado',
    COUNT(*) AS 'Pedidos'
FROM
    Employees AS EMP
        JOIN
    Orders AS ORD ON EMP.EmployeeID = ORD.EmployeeID
GROUP BY EMP.EmployeeID
ORDER BY Pedidos DESC
LIMIT 1;

-- Ejercicio 6
-- Halle el total de unidades en stock para aquellos productos cuya descripción de categoría es "Carnes preparadas"
SELECT 
    CAT.Description, SUM(PRO.UnitsInStock) AS "Unidades de Carnes preaparadas"
FROM
    CATEGORIES AS CAT
        JOIN
    Products AS PRO ON CAT.CategoryID = PRO.CategoryID
WHERE
    CAT.Description = 'Prepared meats';
    
-- Ejercicio 7
-- Hallar los datos que tengan region sin contenido.
SELECT * FROM EMPLOYEES;
SELECT * FROM Employees WHERE Region NOT LIKE '_%'; -- Esta no es válida porque descartaría aquellos resultados con un espacio en blanco.
SELECT * FROM Employees WHERE Region = ''; -- Esta sentencia vale para todos aquellos
SELECT * FROM Employees WHERE TRIM(Region) = ""; -- Esta es la mejor opción salvo que existan tabulaciones.
SELECT * FROM Employees WHERE char_length(Region) = 0; -- Devuelve los caracteres que realiza el trim de la cadena.

-- SUBCONSULTAS
-- Ejercicio 1:
-- Escribir una consulta para imprimir el ID de empleado y edad de aquellos empleados que tienen una edad inferior a la edad media.

-- Primeros calculamos la edad media de los empleados:
SELECT 
    EmployeeID,
    ROUND(DATEDIFF(NOW(), BirthDate) / 365) AS 'Edad'
FROM
    Employees
HAVING -- NO ES RECOMENDABLE USAR
    Edad < (SELECT 
            AVG(ROUND(DATEDIFF(NOW(), BirthDate) / 365)) AS 'Edad Media'
        FROM
            Employees);
            
            -- FORMA ÓPTIMA
SELECT 
    EmployeeID,
    (YEAR(NOW()) - YEAR(BirthDate)) AS 'Edad'
FROM
    Employees
WHERE
    (YEAR(NOW()) - YEAR(BirthDate)) < (SELECT 
            AVG((YEAR(NOW()) - YEAR(BirthDate))) AS 'Edad Media'
        FROM
            Employees);

-- Ejercicio 2:
-- Escribir una consulta para recuperar todos los datos de los empleados que tienen una edad superior a la edad de Margaret Peacock.
SELECT 
    EmployeeID, (YEAR(NOW()) - YEAR(BirthDate)) AS 'Edad'
FROM
    Employees
WHERE
    (YEAR(NOW()) - YEAR(BirthDate)) > (SELECT 
            (YEAR(NOW()) - YEAR(BirthDate)) AS 'Edad Margareth Peacock'
        FROM
            Employees
        WHERE
            FirstName = 'Margaret'
                AND LastName = 'Peacock');
                
-- Ejercicio 3:
-- Hacer una subconsulta para obtener los empleados que tienen como jefe a Andrew Fuller.
SELECT 
    *
FROM
    employees
WHERE
    ReportsTo = (SELECT 
            employeeID
        FROM
            employees
        WHERE
            FirstName = 'Andrew'
                AND LastName = 'Fuller');
                
-- Con Join este ejercicio se puede realizar ya que Employee tien

SELECT 
    CONCAT_WS(' ', emp2.FirstName, emp2.LastName) AS 'Reportan a Andrew Fuller',
    emp1.EmployeeID
FROM
    Employees AS emp1
        JOIN
    Employees AS emp2 ON (emp1.employeeID = emp2.ReportsTo)
WHERE
    emp1.FirstName = 'Andrew'
        AND emp1.LastName = 'Fuller';
        
-- Ejercicio 5:
-- Empleados que son más jóvenes que Margaret, Laura y Michael.

SELECT 
    *
FROM
    Employees
WHERE
    BirthDate > (SELECT 
            MAX(BirthDate)
        FROM
            Employees
        WHERE
            FirstName IN ('Margaret' , 'Laura', 'Michael'));
		
-- Ejercicio 6:
-- Productos cuya categoría empiezan por la letra C o D.
SELECT 
    pro.*
FROM
    Products AS pro
WHERE
    pro.CategoryID IN (SELECT 
            cat.CategoryID
        FROM
            Categories AS cat
        WHERE
            cat.CategoryName LIKE 'C%' OR 'D%');
