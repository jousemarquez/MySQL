-- 1.	Por cada proveedor contar sus productos, mostrando sólo aquellos proveedores con un número de productos
-- superior a la cantidad de proveedores cuyo nombre de compañía empieza por la letra G.

SELECT 
    pro.SupplierID, COUNT(*) NumProducts
FROM
    Products AS pro
GROUP BY pro.SupplierID
HAVING NumProducts > (SELECT 
        COUNT(*)
    FROM
        suppliers
    WHERE
        CompanyName LIKE 'G%');
        
-- 2.	Nombres de categorías cuyo precio unitario medio sea inferior al precio unitario medio general (el de toda la tabla).
SELECT 
    cat.CategoryName, AVG(prod.UnitPrice) AS media
FROM
    products AS prod
        JOIN
    categories AS cat ON prod.CategoryID = cat.CategoryID
GROUP BY cat.CategoryID
HAVING media < (SELECT 
        AVG(UnitPrice)
    FROM
        products);
        
-- Otra versión

SELECT 
    cat.CategoryName, AVG(prod.UnitPrice) AS media
FROM
    categories AS cat
WHERE
    cat.CategoryID IN (SELECT 
            CategoryID
        FROM
            products AS prod
        GROUP BY CategoryID
        HAVING AVG(prod.UnitPrice) < (SELECT 
                AVG(prod2.UnitPrice)
            FROM
                products AS prod2));
                
-- 3.	Países de envío con menos pedidos que Argentina.

SELECT 
    SHIPCOUNTRY
FROM
    ORDERS
GROUP BY SHIPCOUNTRY
HAVING COUNT(*) < (SELECT 
        COUNT(*)
    FROM
        ORDERS
    WHERE
        SHIPCOUNTRY = 'Argentina');
