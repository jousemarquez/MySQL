# BLOQUE DE PROCEDIMIENTOS

DELIMITER $$
DROP PROCEDURE IF EXISTS hola_mundo$$
CREATE PROCEDURE Northwind.hola_mundo()
BEGIN 
	SELECT 'hola mundo';
END$$;
DELIMITER ; # Restablecemos el delimitador por defecto a partir de aqui podemos poner comandos SQL como siempre incluyendo
# otras llamadas a la rutina.
CALL hola_mundo();

SELECT * FROM employees;

# mostrar texto en pantalla 

DELIMITER $$
DROP PROCEDURE IF EXISTS saludar$$
CREATE PROCEDURE saludar()
BEGIN 
	SELECT 'Hey, qué pasa, tío?';
END$$;
DELIMITER ;

# mostrar version mysql

DELIMITER $$
DROP PROCEDURE IF EXISTS mostrar_version$$
CREATE PROCEDURE mostrar_version()
BEGIN 
	SELECT version();
END$$;
DELIMITER ;
CALL mostrar_version();

# mostrar fecha

DELIMITER $$;
#DROP PROCEDURE IF EXISTS mostrar_fecha$$
CREATE PROCEDURE Northwind.mostrar_fecha()
BEGIN 
	SELECT curdate();
END$$;
DELIMITER ;
CALL mostrar_fecha();

# crear aleatorio

DELIMITER $$;
#DROP PROCEDURE IF EXISTS crear_aleatorio$$
CREATE PROCEDURE Northwind.crear_aleatorio()
BEGIN 
	SELECT rand();
END$$;
DELIMITER ;
CALL crear_aleatorio();

# crear aleatorio entre 0 y 9

DELIMITER $$;
DROP PROCEDURE IF EXISTS crear_aleatorio_acotado$$;
CREATE PROCEDURE Northwind.crear_aleatorio_acotado()
BEGIN
	SELECT SELECT FLOOR(RAND(10);
END$$;
DELIMITER ;