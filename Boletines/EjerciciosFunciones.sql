-- Crear una función que devuelva 1 o 0 si un número a es divisible por un numero b (siendo estos enteros).

DELIMITER $$;
DROP FUNCTION IF EXISTS es_divisible$$;
CREATE FUNCTION es_divisible(a INT, b INT)
RETURNS BOOLEAN
BEGIN
    IF MOD(a,b) = 0 THEN
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

DELIMITER $$;
DROP PROCEDURE IF EXISTS mostrar_mes$$;
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
SET @mes = 1;
SET @mes2 = 10;
SELECT mostrar_mes(@mes);
SELECT mostrar_mes(@mes2);

-- Crear un procedimiento que reciba una cadena de tamaño 50 (puede usar una inferior si quiere) e imprima por pantalla si es un palíndromo
-- (no elimine espacios ni nada, solo compruebe que se lee igual al derecho que al revés). (Busca información sobre cómo invertir una cadena)

DELIMITER $$;
DROP FUNCTION IF EXISTS proc_palindromear$$;
CREATE PROCEDURE proc_palindromear(IN cadena VARCHAR(50), OUT cadena_invertida VARCHAR(50))
BEGIN
    SET cadena_invertida = REVERSE(cadena);
    IF cadena = cadena_invertida THEN
        SELECT CONCAT("'", cadena, "' es un palíndromo") AS resultado;
    ELSE
        SELECT CONCAT("'", cadena, "' no es un palíndromo") AS resultado;
    END IF;
END$$
DELIMITER ;

-- PROBANDO LA FUNCIÓN

SET @cadena = 'ono';
SET @cadena2 = 'vodafone';
SELECT proc_palindromear(@cadena);
SELECT proc_palindromear(@cadena2);

-- BLOQUE 2
-- FUNCIONES
-- 1. Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.

-- 2. Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.
-- 3. Escribe una función que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que
-- devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de
-- entrada 1 debería devolver la cadena lunes
-- 4. Escribe una función que reciba tres números reales como parámetros de entrada y devuelva el mayor de los tres.
-- 5. Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como
-- parámetro de entrada.
-- 6. Escribe una función que devuelva como salida el número de años que han transcurrido entre dos fechas que se reciben
-- como parámetros de entrada. Por ejemplo, si pasamos como parámetros de entrada las fechas 2e18-e1-e1 y 2ee8-e1-e1
-- la función tiene que devolver que han pasado 10 años.
-- Para realizar esta función puede hacer uso de las siguientes funciones que nos proporciona MySQL: DATEDIFF TRUNCATE
-- 7. Escribe una función que reciba una cadena de entrada y devuelva la misma cadena pero sin acentos. La función tendrá
-- que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe
-- como parámetro de entrada la cadena María la función debe devolver la cadena Maria.

-- PROCEDIMIENTOS
-- 1. Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto iH01a mundo!.
-- 2. Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el número es
-- positivo, negativo o cero.
-- 3. Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor un
-- número real, y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.
-- 4. Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, y
-- muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:
-- [0,5) = Insuficiente
-- [5,6) = Aprobado
-- [6, 7) = Bien
-- [7, 9) = Notable
-- [9, 10) = Sobresaliente
-- En cualquier otro caso la nota no será válida.

-- 5. Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor de la
-- nota en formato numérico y un parámetro de salida, con una cadena de texto indicando la nota correspondiente.
-- 6. Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
-- 7. Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana
-- y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor
-- de entrada 1 debería devolver la cadena lunes.
