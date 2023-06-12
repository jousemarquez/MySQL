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
DROP PROCEDURE IF EXISTS calcular_potencia$$;
CREATE PROCEDURE calcular_potencia(IN base INT, IN exponente INT, OUT resultado INT)
BEGIN
    SET resultado = POW(base, exponente);
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
SET @cadena1 = "Hola";
SET @cadena2 = "Jouse";
CALL proc_concatenar_cadenas(cadena1, cadena2);

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