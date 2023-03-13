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

SELECT ProductID, ProductName, multiplicar(UnitPrice, UnitsInStock) AS "Beneficios de venta" FROM products;

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

SELECT FirstName, medir_longitud(FirstName) FROM employees;

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

