-- Sobre la bbdd Northwind cree un procedimiento que muestre la suma de los primeros n números enteros,
-- siendo n un parámetro de entrada.

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_sumar_primeros$$;
CREATE PROCEDURE proc_sumar_primeros(IN n INT)
BEGIN	
	DECLARE i INT DEFAULT 1;
    DECLARE suma INT DEFAULT 0;
    WHILE i<=n DO		
		SET suma = suma + i;
        SET i = i + 1;
    END WHILE;
    SELECT suma;
END$$;
DELIMITER ;

CALL proc_sumar_primeros(8); -- Devuelve la suma de los primeros 5 números enteros (1 + 2 + 3 + 4 + 5 = 15)

-- Haga un procedimiento que muestre la suma de los término 1/n con n entre 1 y m,  es decir 1/2+1/3+...1/m siendo m el parámtro de entrada.
-- Tenga en cuenta que m no puede ser cero.

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_sumar_terminos$$;
CREATE PROCEDURE proc_sumar_terminos(IN m INT)
BEGIN	
	DECLARE i INT DEFAULT 1;
    DECLARE suma FLOAT DEFAULT 0;
    WHILE i<=M DO		
		SET suma = suma + 1/i;
        SET i = i + 1;
    END WHILE;
    SELECT suma;
END$$;
DELIMITER ;

CALL proc_sumar_terminos(3);

-- Cree una función que determine si un número es primo devolviendo 0 ó 1.

DELIMITER $$;
DROP FUNCTION IF EXISTS es_primo$$;
CREATE FUNCTION es_primo(numero INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE divisor INT;
    DECLARE es_primo BOOLEAN;
    
    SET divisor = 2;
    SET es_primo = TRUE;
    
    WHILE divisor < numero DO
        IF numero % divisor = 0 THEN
            SET es_primo = FALSE;
            LEAVE;
        END IF;
        SET divisor = divisor + 1;
    END WHILE;
    IF es_primo THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END $$;
DELIMITER ;

SELECT es_primo(13); -- Llamada a la función con el número 13



-- Usando la función anterior, cree otra que calcule la suma de los primeros m números primos empezando en el 1.