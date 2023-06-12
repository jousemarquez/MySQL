-- EJEMPLOS PRÁCTICOS

-- BLOQUE 1
-- PROCEDIMIENTOS

# FUNCIÓN: sumar dos números enteros

DELIMITER $$;
DROP FUNCTION IF EXISTS sumar$$;
CREATE FUNCTION Northwind.sumar(numero1 int, numero2 int)
	RETURNS int
DETERMINISTIC
BEGIN
	RETURN(numero1+numero2);
END$$;
DELIMITER ;

# FUNCIÓN: pasa a mayúsculas una cadena de entrada

DELIMITER $$;
DROP FUNCTION IF EXISTS mayuscula$$;
CREATE FUNCTION Northwind.mayuscula(cadena varchar(100))
	RETURNS varchar(100)
DETERMINISTIC
BEGIN
	RETURN(UPPER(cadena));
END$$;
DELIMITER ;

# PROCEDIMIENTO: mostrar el ID de empleado, nombre en mayúsculas y apellido en mayúsculas de todos los empelados, empleando
# la función mayúscula creada anteriormente. ¿Es mejor una función o un procedimiento?

DELIMITER $$;
DROP PROCEDURE IF EXISTS mayusculas_empleados$$;
CREATE PROCEDURE Northwind.mayusculas_empleados()
BEGIN
	SELECT EmployeeID, mayuscula(FirstName), mayuscula(LastName) FROM employees;
END$$;
DELIMITER ;

# Crear una función multiplicar que reciba un float y un entero, y los devuelva multiplicados.
# Usar la función para mostrar el ID de producto, el nombre de producto y los beneficios de venderlo
# (UnitPrice*UnitsInStock), usando la función creada, sobre la tabla Products.

DELIMITER $$;
DROP FUNCTION IF EXISTS multiplicar$$;
CREATE FUNCTION Northwind.multiplicar(numero1 float, numero2 int)
	RETURNS float
DETERMINISTIC
BEGIN
	RETURN(numero1*numero2);
END$$;
DELIMITER ;

SELECT 
    ProductID,
    ProductName,
    MULTIPLICAR(UnitPrice, UnitsInStock) AS 'Beneficios de venta'
FROM
    products;

# Crear una función medir_longitud que reciba una cadena de caracteres y devuela su longitud.
# Usarla para imprimir el nombre de todos los empleados junto con la longitud de sus nombres.

DELIMITER $$;
DROP FUNCTION IF EXISTS medir_longitud$$;
CREATE FUNCTION medir_longitud(nombre varchar(100))
	RETURNS int
DETERMINISTIC
BEGIN
	RETURN (length(nombre));
END$$;
DELIMITER ;

SELECT 
    FirstName, MEDIR_LONGITUD(FirstName)
FROM
    employees;

# Crear una función concatenar que reciba dos cadenas y las devuelva concatenadas separadas por un guión bajo.
# Por ejemplo, si se reciben ‘Juan’ y ‘Palomo’, devolvería ‘Juan_Palomo’. Usarla para imprimir el ID de empleado,
# y concatenar el nombre y apellidos usando esta función.

DELIMITER $$;
DROP FUNCTION IF EXISTS concatenar$$;
CREATE FUNCTION Northwind.concatenar(cadena1 varchar(100), cadena2 varchar(100))
	RETURNS varchar(201)
DETERMINISTIC
BEGIN
	RETURN (concat(cadena1, '_', cadena2));
END$$;
DELIMITER $$;

SELECT employeeID, concatenar(FirstName, LastName) FROM Employees;

-- Crear una rutina que reciba un número y lo eleve al cuadrado.

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_elevar_cuadrado$$;
CREATE PROCEDURE proc_elevar_cuadrado(IN numero INT)
BEGIN
    DECLARE resultado INT;
    SET resultado = numero * numero;
    SELECT resultado;
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO

SET @numero = 5;
CALL proc_elevar_cuadrado(numero);

-- Crear una rutina que reciba dos números, y eleve el primero al segundo (potencia). 

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_elevar_potencia$$;
CREATE PROCEDURE proc_elevar_potencia(IN base INT, IN exponente INT, OUT resultado INT)
BEGIN
    SET resultado = POW(base, exponente);
    SELECT resultado;
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO
SET @resultado = 0;
SET @base = 5;
SET @exponente = 4;
CALL proc_elevar_potencia(base, exponente, resultado);

-- Crear una rutina que reciba dos cadenas y las concatene con un guion bajo.

DELIMITER $$
CREATE PROCEDURE proc_concatenar_cadenas(IN cadena1 VARCHAR(127), IN cadena2 VARCHAR(127))
BEGIN
	DECLARE resultado VARCHAR(256);
    SET resultado = CONCAT(cadena1, '_', cadena2);
    SELECT resultado;
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO
SET @cadena = "Hola";
SET @cadena2 = "Jouse";
CALL proc_concatenar(cadena1, cadena2);

-- Crear una rutina que reciba una cadena y le quite los espacios del principio y el final.

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_eliminar_espacio_inicio_final$$;
CREATE PROCEDURE proc_eliminar_espacio_inicio_final(INOUT cadena VARCHAR(255))
BEGIN
    SET resultado = TRIM(cadena);
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO
SET @cadena = '     HOLA MUNDO       ';
CALL proc_eliminar_espacio_inicio_final(@cadena);
SELECT @cadena;

-- Crear una rutina que reciba una cadena y genere una segunda con el mismo contenido pero en mayúsculas.

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_clonar_cadena_mayuscula$$;
CREATE PROCEDURE proc_clonar_cadena_mayuscula(IN cadena VARCHAR(255), OUT cadena_mayuscula VARCHAR(255))
BEGIN
    SET resultado = UPPER(cadena);
END $$
DELIMITER ;

-- LANZANDO EL PROCEDIMIENTO

SET @cadena = 'Hola me llamo Jouse';
CALL proc_clonar_cadena_mayuscula(cadena, @cadena_mayus);
SELECT @cadena_mayus;

-- DIAPOSITIVA PÁGINA 28

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

SELECT ES_DIVISIBLE(20, 2);
SELECT ES_DIVISIBLE(0, 0);

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
CALL mostrar_mes(1);
CALL mostrar_mes(10);

-- Crear un procedimiento que reciba una cadena de tamaño 50 (puede usar una inferior si quiere) e imprima por pantalla si es un palíndromo
-- (no elimine espacios ni nada, solo compruebe que se lee igual al derecho que al revés). (Busca información sobre cómo invertir una cadena)

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_palindromear$$;
CREATE PROCEDURE proc_palindromear(IN cadena VARCHAR(50))
BEGIN
    DECLARE cadenaInvertida VARCHAR(50);
    SET cadenaInvertida = REVERSE(cadena);
    IF cadena = cadenaInvertida THEN
        SELECT CONCAT(cadena, "es un palíndromo") AS resultado;
    ELSE
        SELECT CONCAT(cadena, "no es un palíndromo") AS resultado;
    END IF;
END;
DELIMITER ;

-- PROBANDO LA FUNCIÓN

CALL proc_palindromear('ono');

-- BLOQUE 2
-- FUNCIONES
-- 1. Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_isPair$$;
CREATE FUNCTION func_isPair(num INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	IF MOD(num,2) = 0 THEN
		RETURN TRUE;
    ELSE
		RETURN FALSE;
    END IF;
END $$;
DELIMITER ;

-- 2. Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.

DELIMITER $$;
DROP FUNCTION IF EXISTS func_hipotenusa$$;
CREATE FUNCTION func_hipotenusa(num1 FLOAT, num2 FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	RETURN sqrt((pow(num1,2))+(pow(num2,2)));
END$$;
DELIMITER ;

SELECT func_hipotenusa(4, 3);

-- 3. Escribe una función que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que
-- devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de
-- entrada 1 debería devolver la cadena lunes.

DELIMITER $$;
DROP FUNCTION IF EXISTS func_dia_semana$$;
CREATE FUNCTION func_dia_semana(numero1 INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE mensaje VARCHAR(30);
	 CASE numero1
		WHEN 1 THEN
			SET mensaje="Lunes";
		WHEN 2 THEN
			SET mensaje="Martes";
		WHEN 3 THEN
			SET mensaje="Miércoles";
		WHEN 4 THEN
			SET mensaje="Jueves";
		WHEN 5 THEN
			SET mensaje="Viernes";
		WHEN 6 THEN
			SET mensaje="Sábado";
		WHEN 7 THEN
			SET mensaje="Domingo";
		ELSE
        SET mensaje="No es un numero válido.";
        END CASE;
        RETURN mensaje;
END$$;
DELIMITER ;

-- 4. Escribe una función que reciba tres números reales como parámetros de entrada y devuelva el mayor de los tres.

DELIMITER $$;
DROP FUNCTION IF EXISTS func_decir_mayor $$;
CREATE FUNCTION func__decir_mayor(numero1 INT, numero2 INT, numero3 INT)
	RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE mayor INT;
    IF numero1 > numero2 AND numero1 > numero3 THEN
		SET mayor = numero1;
	ELSEIF numero2 > numero1 AND numero2 > numero3 THEN
		SET mayor = numero2;
	ELSE
		SET mayor = numero3;
	END IF;
    RETURN mayor;
END $$;
DELIMITER ;

-- 5. Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como
-- parámetro de entrada.

DELIMITER $$;
CREATE FUNCTION func_area_circulo(radio FLOAT)
	RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE area FLOAT;
    SET area = PI() * POW(radio, 2);
    RETURN area;
END;
DELIMITER ;

SELECT area_circulo(5); -- Devuelve el área del círculo con radio 5

-- Números primos

DELIMITER $$;
DROP FUNCTION IF EXISTS func_es_primo$$;
CREATE FUNCTION func_es_primo(n INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DECLARE es_primo BOOLEAN DEFAULT TRUE;
    DECLARE contador INT DEFAULT 2;
    WHILE (contador < n && es_primo) DO
		IF (MOD(n, contador)=0) THEN
			SET es_primo = FALSE;
        END IF;
		SET contador = contador + 1;
    END WHILE;
	RETURN es_primo;
END $$ ;
DELIMITER ;

SELECT func_es_primo(4);
SELECT func_es_primo(11);

-- 6. Escribe una función que devuelva como salida el número de años que han transcurrido entre dos fechas que se reciben
-- como parámetros de entrada. Por ejemplo, si pasamos como parámetros de entrada las fechas 2e18-e1-e1 y 2ee8-e1-e1
-- la función tiene que devolver que han pasado 10 años.
-- Para realizar esta función puede hacer uso de las siguientes funciones que nos proporciona MySQL: DATEDIFF TRUNCATE

DELIMITER $$;
DROP FUNCTION IF EXISTS func_anos_entre_fechas$$;
CREATE FUNCTION func_anos_entre_fechas(n INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DECLARE es_primo BOOLEAN DEFAULT TRUE;
    DECLARE contador INT DEFAULT 2;
    WHILE (contador < n && es_primo) DO
		IF (MOD(n, contador)=0) THEN
			SET es_primo = FALSE;
        END IF;
		SET contador = contador + 1;
    END WHILE;
	RETURN es_primo;
END $$ ;
DELIMITER ;

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

-- EJERCICIOS BUCLES

-- Crea un programa que lea un número, e imprima en una misma línea tantos ceros como diga el número. Por ejemplo: si se lee el 3 debe imprimirse:
-- 0 0 0

DELIMITER $$;
DROP FUNCTION IF EXISTS func_0$$;
CREATE FUNCTION func_0(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE contador INT DEFAULT 0;
    WHILE (contador <= n ) DO
		IF (MOD(n, contador)=0) THEN
			SET es_primo = FALSE;
        END IF;
		SET contador = contador + 1;
    END WHILE;
	RETURN func_0;
END $$ ;
DELIMITER ;


