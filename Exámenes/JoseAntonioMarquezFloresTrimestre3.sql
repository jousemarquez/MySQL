-- EXAMEN TERCER TRIMESTRE
-- POR José Antonio Márquez Flores

/*
Ejercicio 1:
Crear una rutina que reciba como entrada un número entero. La rutina devuelve
en tres variables de salida el propio número, el número elevado al cuadrado y 
el número elevado al cubo.
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS proc_calcular_potencias$$
CREATE PROCEDURE proc_calcular_potencias(INOUT num INT, OUT numCuadrado INT, OUT numCubo INT)
BEGIN
    SET numCuadrado = POW(num, 2);
    SET numCubo = POW(num, 3);
END$$
DELIMITER ;

-- Lanzamiento de la rutina proc_calcular_potencias
SET @num = 3;
CALL proc_calcular_potencias(@num, @numCuadrado, @numCubo);
SELECT @num AS Numero, @numCuadrado AS Cuadrado, @numCubo AS Cubo; -- Devuelve: 3, 9, 27.

SET @num = 12;
CALL proc_calcular_potencias(@num, @numCuadrado, @numCubo);
SELECT @num AS Numero, @numCuadrado AS Cuadrado, @numCubo AS Cubo; -- Devuelve: 12, 144, 1728.

/*
Ejercicio 2:
Crear una rutina que reciba un ID de categoría y devuelva la descripción de la misma.
*/
DELIMITER $$
DROP FUNCTION IF EXISTS func_obtener_descripcion_categoria$$
CREATE FUNCTION func_obtener_descripcion_categoria(categoryID INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE descriptionText VARCHAR(255);
    SELECT c.Description INTO descriptionText FROM Categories c WHERE c.CategoryID = categoryID;
    RETURN descriptionText;
END$$
DELIMITER ;

-- Llamada a la función obtenerDescripcionCategoria
SELECT func_obtener_descripcion_categoria(4) AS Descripcion; -- Devuelve: "Cheeses"
SELECT func_obtener_descripcion_categoria(3) AS Descripcion; -- Devuelve: "Desserts, candies, and sweet breads."
SELECT func_obtener_descripcion_categoria(8) AS Descripcion; -- Devuelve: "Seaweed and fish."
SELECT func_obtener_descripcion_categoria(10) AS Descripcion; -- Devuelve NULL porque no existe más registros del 8.

/*
Ejercicio 3:
Crear una rutina que reciba una letra y un número. La rutina debe devolver una cadena
en la que la letra se repita tantas veces como diga el número. Debe validar el número:
si es negativo o cero, se devuelve únicamente una cadena con la letra.
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS proc_generar_cadena$$
CREATE PROCEDURE proc_generar_cadena(IN letter CHAR(1), IN num INT, OUT str VARCHAR(255))
BEGIN
    IF num <= 0 THEN
        SET str = letter;
    ELSE
        SET str = REPEAT(letter, num);
    END IF;
END$$
DELIMITER ;

-- Lanzamiento de la rutina proc_generar_cadena
SET @letter = 'Z';
SET @num = 9;
CALL proc_generar_cadena(@letter, @num, @str); -- Devuelve: "ZZZZZZZZZ".
SELECT @str AS Cadena;

SET @letter = 'Ñ';
SET @num = 3;
CALL proc_generar_cadena(@letter, @num, @str); -- Devuelve: "ÑÑÑ".
SELECT @str AS Cadena;

/*
Ejercicio 4:
Crear una rutina que sume los precios unitarios de todos los productos. La rutina
NO puede realizar la suma con una sentencia SQL y el operador SUM, sino que deberá recuperar
iterativamente por cada producto su precio unitario e ir sumando. La rutina devuelve
la suma en una variable de salida. Tenga en cuenta dentro de la rutina que los ID
de producto van desde 1 a 77.

NOTA: se puede hacer sin un cursor, pero si desea usar cursores, adelante.
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS proc_sumar_precios_unitarios$$
CREATE PROCEDURE proc_sumar_precios_unitarios(OUT total DECIMAL(10,2))
BEGIN
    DECLARE prize DECIMAL(10,2);
    DECLARE productID INT;
    DECLARE fin BOOLEAN DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT ProductID, UnitPrice FROM Products;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
    
    SET total = 0;
    OPEN cur;
    loop1: WHILE NOT fin DO
        FETCH cur INTO productID, prize;
        IF fin THEN
            LEAVE loop1;
        END IF;
        SET total = total + prize;
    END WHILE;
    CLOSE cur;
END$$
DELIMITER ;

-- Lanzamiento de la rutina proc_sumar_precios_unitarios
CALL proc_sumar_precios_unitarios(@total); -- Devuelve: "2222.71"
SELECT @total AS "Total Precios Unitarios";

-- Comprobación de resultado:
SELECT sum(UnitPRice) FROM Products;