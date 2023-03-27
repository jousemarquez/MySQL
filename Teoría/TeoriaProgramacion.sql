-- PROCEDIMIENTOS
-- IN

DELIMITER $$; DROP PROCEDURE IF EXISTS proc_entrada $$; CREATE PROCEDURE proc_entrada (IN p INT) BEGIN SET p = 5; END $$; DELIMITER ;

-- OUT

DELIMITER $$; 
DROP PROCEDURE IF EXISTS proc_salida $$; 
CREATE PROCEDURE proc_salida (OUT p INT) 
BEGIN 
	SET p = 5; 
END $$; 
DELIMITER ;

-- INOUT

DELIMITER $$; 
DROP PROCEDURE IF EXISTS proc_entrada_salida $$; 
CREATE PROCEDURE proc_entrada_salida (INOUT p INT) 
BEGIN 
	SELECT p;
	SET p = 5; 
END $$; 
DELIMITER ;

-- PROCEDIMIENTO SUMA NÚMEROS

DELIMITER $$;
DROP PROCEDURE IF EXISTS suma_numeros $$;
CREATE PROCEDURE suma_numeros
(IN a INT, IN b INT, OUT c INT)
BEGIN
SET c = a+b;
END $$;
DELIMITER ;

SET @x=3;
SET @y=7;
SET @z=0;
CALL suma_numeros(@x,@y,@z);
SELECT @z;

-- ds

DELIMITER $$; DROP PROCEDURE IF EXISTS es_mayor $$; CREATE PROCEDURE es_mayor (IN a INT, IN b INT, OUT mensaje VARCHAR(30)) BEGIN IF a>b THEN SET mensaje="El primero es mayor"; ELSEIF a<b THEN SET mensaje="El segundo es mayor"; ELSE SET mensaje="Son iguales"; END IF; END $$; DELIMITER ; SET @x=3; SET @y=13; SET @res=""; CALL es_mayor(@x, @y, @res);

-- PROGRAMACION BBDD - BUCLES

DELIMITER $$;
DROP PROCEDURE IF EXISTS bucle $$;
CREATE PROCEDURE bucle()
BEGIN
	DECLARE cont INT;
	SET cont=0;
    bucle1: LOOP
		SET cont=cont+1;
        SELECT cont;
        IF cont>=10 THEN
			LEAVE bucle1;
		END IF;
	END LOOP;
END $$;
DELIMITER ;

CALL bucle();

-- DO WHILE

DELIMITER $$;
DROP PROCEDURE IF EXISTS repetir_hasta$$;
CREATE PROCEDURE repetir_hasta()
BEGIN	
	DECLARE i INT;    
    SET i=0;    
    REPEAT		
		IF MOD(i,2)!=0 THEN
			SELECT CONCAT(i, ' es impar');
		END IF;
        SET i = i + 1;	
	UNTIL i>=10    
    END REPEAT;
END$$;
DELIMITER ;

call repetir_hasta();

-- WHILE

DELIMITER $$;
DROP PROCEDURE IF EXISTS mientras$$;
CREATE PROCEDURE mientras()
BEGIN	
	DECLARE i INT;    
    SET i=0;   
    bucle1: WHILE i<10 DO		
		IF MOD(i,2)<>0 THEN			
			SELECT CONCAT(i, ' es impar');		
		END IF;        
        SET i = i + 1;	    
    END WHILE;
END$$;
DELIMITER ;

CALL mientras();