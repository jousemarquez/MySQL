-- 1. Contar el número de productos para los que no hay stock.
SELECT COUNT(*) FROM Products WHERE UnitsInStock=0;
-- 2. Sumar el total de unidades en stock de todos los productos cuyo campo UnitsOnOrder no sea cero.
SELECT SUM(UnitsInStock) FROM Products WHERE UnitsOnOrder>0;
-- 3. Contar el número de empleados cuyo nombre empieza por la letra A.
SELECT COUNT(*) FROM Employees WHERE FirstName LIKE "A%";