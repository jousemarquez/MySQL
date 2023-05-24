/*A la atención de su señoría, aqueste enunciado ha sido preparado para que lo entienda vuesa merced.
Espero que sea de su gusto y no genere ambigüedades, puesto que este servidor suyo lo ha preparado
con grande cuidado. Si así no fuere, pardiez que me lleve el diablo y se coma mi alma.*/

-- 1. Por cada compañía de envíos, mostrar su nombre y contar el número de pedidos
-- que ha enviado.
SELECT ship.ShipperID, ship.CompanyName, count(*) AS "Nº Pedidos"
FROM Shippers AS ship
JOIN Orders AS ord
ON ship.ShipperID = ord.ShipVia
GROUP BY ship.CompanyName;

-- 2. Mostrar el nombre de los países a los que pertenecen los distintos clientes y empleados,
-- de forma que no se repitan.

SELECT DISTINCT(cust.Country)
FROM orders AS ord
JOIN Customers AS cust
ON ord.CustomerID = cust.CustomerID
JOIN Employees AS emp
ON emp.EmployeeID = ord.EmployeeID;

-- 3. Contar los distintos ID de territorios.
SELECT count(*) AS "Nº Distritos"
FROM Territories;

-- 4. Contar el número de categorías cuyo nombre empieza por C y termina por S,
-- dando un alias a la columna.

SELECT count(*) AS CategoríasEntreCyS
FROM Categories
WHERE CategoryName LIKE "C%S";

-- 5. Mostrar los distintos territorios, adjuntando también la descripción de región (RegionDescription).
SELECT terr.TerritoryID, terr.TerritoryDescription, reg.RegionDescription
FROM Territories AS terr
JOIN Region AS reg
ON terr.RegionID = reg.RegionID;

-- 6. Contar el número de filas de la tabla customerdemographics.
SELECT count(*) AS NºFilas
FROM customerdemographics;

-- 7. Mostrar los nombres de ciudades de los proveedores en orden alfabetico inverso, pero solo
-- para aquellas cuyo nombre de ciudad comienza de la A a la C incluidas ambas letras.
SELECT City
FROM Suppliers
WHERE substring(City,1,1) BETWEEN "A" AND "C"
ORDER BY City DESC;

-- 8. Por cada nombre de compañía de envíos contar el número de distintos productos 
-- enviados.
SELECT ship.CompanyName, count(DISTINCT(ordd.ProductID)) AS ProductosEnviados FROM orders AS ord
JOIN OrderDetails AS ordd
ON ord.OrderID = ordd.OrderID
JOIN shippers AS ship
ON ship.ShipperID = ord.ShipVia
GROUP BY ship.CompanyName;

-- Es decir, que si una compañía de envíos envía una bata, tres bicis y siete jerseys de cuello
-- de pico estampados a un cliente zamorano y luego la misma compañía de envíos envía
-- una bata a un cliente jienense, esa compañía de envíos (que Dios la guarde en su alma) habría enviado tres productos distintos.