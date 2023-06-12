-- CURSORES

# Función que devuelva todos los apellidos concatenas y separados por espacios en blanco.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_getApellidos $$;
CREATE FUNCTION func_getApellidos
()
RETURNS VARCHAR(1000)
DETERMINISTIC
BEGIN
		DECLARE lista VARCHAR(1000) default ' ';
		DECLARE last_name VARCHAR(30);
        DECLARE fin BOOL default FALSE; -- Se inicializa fin = false para controlar la salida del if.
        DECLARE c1 CURSOR FOR SELECT LastName FROM Employees; -- Se almacena en el cursor la sentencia deseada
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE; -- Código que se va a ejecutar cuando detecte que el fetch encuentre un not found.
        OPEN c1; -- El cursor se le mete esa estructura de datos, ejecuta e inicializa.
        etiqueta: LOOP
			FETCH c1 INTO last_name; -- Avanza el cursor y carga el last_name que haya en la fila.
				IF fin THEN -- Se comprueba si fin es verdadero para romper el bucle o continuar
					LEAVE etiqueta; -- Si fin = TRUE se activaría el leave
				END IF;
				SET lista = CONCAT(lista, ' ', last_name); -- Si fin = FALSE se carga los datos de lista.
		END LOOP etiqueta;
        CLOSE c1; -- Importante es cerrar el cursor. En caso de dejarlo abierto, se va llenando la memoria RAM.
        RETURN(lista); -- Devuelve los resultados obtenidos.
END $$;
DELIMITER ;

SELECT func_getApellidos();

# Repetir la función anterior sustituyendo el LOOP por una instrucción REPEAT UNTIL.
DELIMITER $$;
DROP FUNCTION IF EXISTS getApellidos $$;
CREATE FUNCTION getApellidos()
RETURNS VARCHAR(1000)
DETERMINISTIC
	BEGIN
	  DECLARE lista VARCHAR(1000) DEFAULT '';
	  DECLARE last_name VARCHAR(30);
	  DECLARE fin BOOL default FALSE;
	  DECLARE c1 CURSOR FOR SELECT LastName FROM Employees;
	  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=TRUE;
	  OPEN c1;
	  FETCH c1 INTO last_name;
	  REPEAT
		SET lista = CONCAT(lista,' ',last_name);  
		FETCH c1 INTO last_name;
	  UNTIL (fin) -- Se repite el bucle hasta que se cumpla esta condición.
	  END REPEAT;
	CLOSE c1;
	  RETURN(lista);
END $$;
DELIMITER ;

SELECT getApellidos();

# Repetir la función anterior sustituyendo el LOOP por una instrucción WHILE.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_getApellidos $$;
CREATE FUNCTION func_getApellidos
()
RETURNS VARCHAR(1000)
DETERMINISTIC
BEGIN
		DECLARE lista VARCHAR(1000) default ' ';
		DECLARE last_name VARCHAR(30);
        DECLARE fin BOOL default FALSE; -- Se inicializa fin = false para controlar la salida del if.
        DECLARE c1 CURSOR FOR SELECT LastName FROM Employees; -- Se almacena en el cursor la sentencia deseada
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE; -- Código que se va a ejecutar cuando detecte que el fetch encuentre un not found.
        OPEN c1; -- El cursor se le mete esa estructura de datos, ejecuta e inicializa.
        FETCH c1 INTO last_name; -- Se debe hacer un fetch antes del while para evitar errores.
        WHILE (NOT fin) DO
				SET lista = CONCAT(lista, ' ', last_name); -- Si fin = FALSE se carga los datos de lista.
				FETCH c1 INTO last_name;
        END WHILE;
        CLOSE c1; -- Importante es cerrar el cursor. En caso de dejarlo abierto, se va llenando la memoria RAM.
        RETURN(lista); -- Devuelve los resultados obtenidos.
END $$;
DELIMITER ;

SELECT func_getApellidos();

-- BOLETÍN CURSORES

-- Ejercicio 1: crear un procedimiento que, mediante un cursor, y usando un bucle while, que recupere la fecha de nacimiento de los empleados y calcule la media de edad. Para la edad, reste el año
-- actual con el año en el que nació el empleado.

DELIMITER $$;
DROP FUNCTION IF EXISTS func_edadMediaEmpleados $$;
CREATE PROCEDURE func_edadMediaEmpleados
()
RETURNS AGE INT
DETERMINISTIC
BEGIN
    DECLARE age INT DEFAULT 0;
    DECLARE sum_age INT DEFAULT 0;
    DECLARE num_employees INT DEFAULT 0;
    DECLARE BirthDate DATE;
    DECLARE fin BOOL DEFAULT FALSE;
    DECLARE c1 CURSOR FOR SELECT BirthDate FROM Employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
    OPEN c1;
    WHILE (NOT fin) DO
        FETCH c1 INTO BirthDate;
        IF NOT fin THEN
            SET sum_age = sum_age + (YEAR(CURRENT_DATE()) - YEAR(BirthDate));
            SET num_employees = num_employees + 1;
        END IF;
    END WHILE;
    CLOSE c1;
    IF num_employees > 0 THEN
        SET age = sum_age / num_employees;
    END IF;
    SELECT CONCAT('La media de edad de los empleados es ', age, ' años.') AS result;
END$$
DELIMITER ;

SELECT func_edadMediaEmpleados();

-- Ejercicio 2: crear un procedimiento que, mediante un cursor, recupere los valores de UnitsInStock y UnistOnOrder de cada producto, y calcule la suma total de ambos
-- valores para todos los productos. Devolver ambas sumas en dos variables de salida.

SELECT ProductID, UnitsInStock , UnitsOnOrder, UnitsInStock * UnitsOnOrder AS 'Total precio por producto' FROM Products;

-- Ejercicio 3: crear un procedimiento que, mediante un cursor, calcule la ganancia de cada producto (UnitsInStock x UnitPrice), y devuelva la ganancia media de todos los productos.

SELECT UnitsInStock * UnitPrice AS 'Ganancia' FROM Products;

-- Ejercicio 4: crear un procedimiento que, mediante un cursor, cree una lista separada por comas con la siguiente información por cada pedido: OrderID-EmployeeID-
-- FirstName-LastName. Deberá establecer una asociación entre las tablas Orders y Employees. La lista será una cadena de caracteres (tamaño muy grande).

-- Ejercicio 5: crear un procedimiento que, mediante un cursor, cree una lista separada por guiones con la siguiente información por cada territorio: TerritoryID,
-- TerritoryDescription, RegionID, RegionDescription. Deberá establecer una asociación entre las tablas Territories y Region. La lista será una cadena de caracteres (tamaño muy grande).

