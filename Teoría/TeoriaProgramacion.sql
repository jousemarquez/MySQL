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