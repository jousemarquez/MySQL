-- Crear una función que devuelva 1 o 0 si un número a es divisible por un numero b (siendo estos enteros).

DELIMITER $$
CREATE FUNCTION es_divisible(a INT, b INT)
RETURNS INT
BEGIN
    IF a % b = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END $$
DELIMITER ;

-- PROBANDO LA FUNCIÓN

SELECT es_divisible(20, 2);
SELECT es_divisible(0, 0);

-- Crear un procedimiento que reciba un entero entre 1 y 12, y muestre por pantalla el mes del año. En caso de no ser el número de un mes,
-- mostrar ‘Eres un poco despistado, introduce un mes’.

DELIMITER $$
CREATE PROCEDURE mostrar_mes(IN mes INT)
BEGIN
    IF mes = 1 THEN
        SELECT 'Enero';
    ELSEIF mes = 2 THEN
        SELECT 'Febrero';
    ELSEIF mes = 3 THEN
        SELECT 'Marzo';
    ELSEIF mes = 4 THEN
        SELECT 'Abril';
    ELSEIF mes = 5 THEN
        SELECT 'Mayo';
    ELSEIF mes = 6 THEN
        SELECT 'Junio';
    ELSEIF mes = 7 THEN
        SELECT 'Julio';
    ELSEIF mes = 8 THEN
        SELECT 'Agosto';
    ELSEIF mes = 9 THEN
        SELECT 'Septiembre';
    ELSEIF mes = 10 THEN
        SELECT 'Octubre';
    ELSEIF mes = 11 THEN
        SELECT 'Noviembre';
    ELSEIF mes = 12 THEN
        SELECT 'Diciembre';
    ELSE
        SELECT 'Eres un poco despistado, introduce un mes';
    END IF;
END $$
DELIMITER ;

-- PROBANDO LA FUNCIÓN

SELECT mostrar_mes(2);
SELECT mostrar_mes(13);

-- Crear un procedimiento que reciba una cadena de tamaño 50 (puede usar una inferior si quiere) e imprima por pantalla si es un palíndromo
-- (no elimine espacios ni nada, solo compruebe que se lee igual al derecho que al revés). (Busca información sobre cómo invertir una cadena)

DELIMITER $$
CREATE PROCEDURE comprobar_palindromo(IN cadena VARCHAR(50))
BEGIN
    DECLARE cadena_invertida VARCHAR(50);
    SET cadena_invertida = REVERSE(cadena);
    IF cadena = cadena_invertida THEN
        SELECT CONCAT("'", cadena, "' es un palíndromo") AS resultado;
    ELSE
        SELECT CONCAT("'", cadena, "' no es un palíndromo") AS resultado;
    END IF;
END$$
DELIMITER ;

SELECT comprobar_palindromo('ono');
SELECT comprobar_palindromo('vodafone');
