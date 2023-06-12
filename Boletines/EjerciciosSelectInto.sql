-- 1. Crear una función que reciba un ID de empleado y devuelva su nombre y apellidos concatenados y separados por un espacio en blanco. Darle el nombre getNombreCompleto.
-- 2. Repetir el ejercicio anterior concatenando la edad, que deberá ser calculada en base a la fecha de nacimiento. Darle el nombre getNombreCompletoEdad.
-- 3. Modificar los ejercicios anteriores para que sea un método que devuelva en variables de salida los datos requeridos.
-- 4. Crear una rutina que reciba un ID de pedido, y devuelva en una variable de salida el empleado que lo atendió.
-- 5. Repetir el anterior, pero devolviendo el cliente.
-- 6. Crear una rutina que devuelva en una variable de salida la cantidad de pedidos del empleado número 3.
-- 7. Crear una rutina que reciba dos nombres de empleados y devuelva el nombre del que ha atendido mayor cantidad de pedidos.
-- 8. ¿Se puede modificar el ejercicio anterior para que el ID de empleado se reciba como un argumento de entrada?
-- 9. Crear una rutina que devuelva en una variable el valor máximo de precio de producto.
-- 10. Crear una rutina que devuelva la cantidad de pedidos en una variable.
-- 11. Repetir el anterior pero solo teniendo en cuenta aquellos pedidos que tienen descuento.
-- 12. Crear una rutina que devuelva el id de empleado que tiene más pedidos.
-- 13. Crear una rutina que reciba un nombre de contacto y devuelva el ID de cliente.
-- 14. Crear una rutina que reciba un ID de envío (ShipperID) y devuelva la cantidad de pedidos enviados con ese transportista.
-- 15. Crear una rutina que reciba dos ID de categoría, y devuelva la suma de la cantidad de productos que tienen ambas.
-- 16. Crear una rutina que reciba tres ID de categorías y devuelva sus descripciones concatenadas y separadas por punto y coma.

-- 1. Crear una función que reciba un ID de empleado y devuelva su nombre y apellidos concatenados y separados por un espacio en blanco.
-- Darle el nombre getNombreCompleto.
DELIMITER $$;
DROP FUNCTION IF EXISTS getNombreCompleto$$;
CREATE FUNCTION getNombreCompleto(id BIGINT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE nombre VARCHAR(30);
	DECLARE apellido VARCHAR(30);
	DECLARE nombreCompleto VARCHAR(100);

	SELECT FirstName, LastName INTO nombre, apellido FROM employees AS emp WHERE emp.employeeID = id;

	SET nombreCompleto = CONCAT(nombre, " ", apellido);
	RETURN nombreCompleto;
END $$;
DELIMITER ;

SELECT getNombreCompleto(2);

-- PRACTICANDO CON CURSORES EJERCICIO 1
DELIMITER $$
DROP FUNCTION IF EXISTS getNombreCompletoCursores $$
CREATE FUNCTION getNombreCompletoCursores(employeeID INT)
RETURNS VARCHAR(120)
DETERMINISTIC
BEGIN
    DECLARE nombreCompleto VARCHAR(120);
    DECLARE nombre VARCHAR(30);
    DECLARE apellido VARCHAR(30);

    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR
		SELECT FirstName, LastName FROM employees WHERE employeeID = employeeID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    FETCH cur INTO nombre, apellido;

    SET nombreCompleto = CONCAT(nombre, ' ', apellido);

    CLOSE cur;

    RETURN nombreCompleto;
END $$
DELIMITER ;

-- Ejemplo de uso de la función
SELECT getNombreCompletoCursores(2);
        
-- 2. Repetir el ejercicio anterior concatenando la edad, que deberá ser calculada en base a la fecha de nacimiento. Darle el nombre getNombreCompletoEdad.
DELIMITER $$;
DROP FUNCTION IF EXISTS getNombreCompletoEdad$$;
CREATE FUNCTION getNombreCompletoEdad(id BIGINT)
RETURNS VARCHAR(120)
DETERMINISTIC
BEGIN
	DECLARE nombre VARCHAR(30);
	DECLARE apellido VARCHAR(30);
    DECLARE edad INT;
	DECLARE nombreCompleto VARCHAR(120);

	SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) INTO nombre, apellido, edad FROM employees AS emp WHERE emp.employeeID = id;

	SET nombreCompleto = CONCAT(nombre, " ", apellido, " ", edad);
	RETURN nombreCompleto;
END $$;
DELIMITER ;

SELECT getNombreCompletoEdad(2);

-- 3. Modificar los ejercicios anteriores para que sea un método que devuelva en variables de salida los datos requeridos.
DELIMITER $$
DROP PROCEDURE IF EXISTS getNombreCompletoEdad $$
CREATE PROCEDURE getNombreCompletoEdad(IN id BIGINT, OUT nombreCompleto VARCHAR(120), OUT edad INT)
BEGIN
    DECLARE nombre VARCHAR(30);
    DECLARE apellido VARCHAR(30);

    SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) INTO nombre, apellido, edad FROM employees WHERE employeeID = id;

    SET nombreCompleto = CONCAT(nombre, ' ', apellido);
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL getNombreCompletoEdad(2, @nombreCompleto, @edad);
SELECT @nombreCompleto, @edad;

-- 4. Crear una rutina que reciba un ID de pedido, y devuelva en una variable de salida el empleado que lo atendió.
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerEmpleadoDePedido $$
CREATE PROCEDURE obtenerEmpleadoDePedido(IN pedidoID INT, OUT empleado VARCHAR(120))
BEGIN
    SELECT CONCAT(e.FirstName, ' ', e.LastName) INTO empleado
    FROM employees AS e
    INNER JOIN orders AS o ON e.employeeID = o.EmployeeID
    WHERE o.OrderID = pedidoID
    LIMIT 1;
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerEmpleadoDePedido(10263, @empleado);
SELECT @empleado;

-- 5. Repetir el anterior, pero devolviendo el cliente.

DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerClienteDePedido $$
CREATE PROCEDURE obtenerClienteDePedido(IN pedidoID INT, OUT cliente VARCHAR(120))
BEGIN
    SELECT ContactName INTO cliente
    FROM customers AS c
    INNER JOIN orders AS o ON c.CustomerID = o.CustomerID
    WHERE o.OrderID = pedidoID
    LIMIT 1;
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerClienteDePedido(10263, @cliente);
SELECT @cliente;


-- 6. Crear una rutina que devuelva en una variable de salida la cantidad de pedidos del empleado número 3.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_getCantidadPedidos$$;
CREATE PROCEDURE proc_getCantidadPedidos(OUT pedidos INT)
BEGIN
	select count(*) AS pedidos into pedidos from orders ord where ord.EmployeeID=3; 
END $$;
DELIMITER ;
set @a=0;
call proc_getCantidadPedidos(@a);
select @a;

-- 7. Crear una rutina que reciba dos nombres de empleados y devuelva el nombre del que ha atendido mayor cantidad de pedidos.

DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerEmpleadoMayorCantidadPedidos $$
CREATE PROCEDURE obtenerEmpleadoMayorCantidadPedidos(IN nombreEmpleado1 VARCHAR(30), IN nombreEmpleado2 VARCHAR(30), OUT empleadoConMayorCantidad VARCHAR(120))
BEGIN
    DECLARE contadorEmpleado1 INT;
    DECLARE contadorEmpleado2 INT;

    SELECT COUNT(*) INTO contadorEmpleado1
    FROM employees AS e
    INNER JOIN orders AS o ON e.employeeID = o.EmployeeID
    WHERE e.FirstName = nombreEmpleado1;

    SELECT COUNT(*) INTO contadorEmpleado2
    FROM employees AS e
    INNER JOIN orders AS o ON e.employeeID = o.EmployeeID
    WHERE e.FirstName = nombreEmpleado2;

    IF contadorEmpleado1 > contadorEmpleado2 THEN
        SET empleadoConMayorCantidad = nombreEmpleado1;
    ELSE
        SET empleadoConMayorCantidad = nombreEmpleado2;
    END IF;
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerEmpleadoMayorCantidadPedidos('Nancy', 'Margareth', @empleadoMayorCantidad);
SELECT @empleadoMayorCantidad;

-- 7. Crear una rutina que reciba dos nombres de empleados y devuelva el nombre del que ha atendido mayor cantidad de pedidos.

DELIMITER $$
DROP PROCEDURE IF EXISTS empleadotop $$
CREATE PROCEDURE empleadotop (IN empleado1 VARCHAR(20), IN empleado2 VARCHAR(20), OUT resultado VARCHAR(20)) 
BEGIN
SELECT 
    employees.FirstName INTO resultado
FROM
    orders
        JOIN
    employees ON orders.EmployeeID = employees.EmployeeID
WHERE
    employees.FirstName LIKE empleado1
        OR employees.FirstName LIKE empleado2
GROUP BY orders.EmployeeID
ORDER BY COUNT(*) DESC
LIMIT 1;
END$$;
DELIMITER ;
set @x='Margaret';
set @y='Janet';
SET @z='';

CALL empleadotop(@x,@y,@z);
SELECT @z;

-- Otra alternativa ejercicio 7, como función

DELIMITER $$;
DROP FUNCTION IF EXISTS func_mayorNumPedidos$$;
CREATE FUNCTION Northwind.func_mayorNumPedidos(empleado1 VARCHAR(60), empleado2 VARCHAR(60))
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
DECLARE numPedidos INT DEFAULT 0;
SELECT COUNT(*) INTO numPedidos FROM orders WHERE EmployeeID=(SELECT EmployeeID FROM employees WHERE concat_ws(' ',FirstName,LastName)=(empleado1)); 

IF numPedidos>(SELECT COUNT(*)FROM orders WHERE EmployeeID=(SELECT EmployeeID FROM employees WHERE concat_ws(' ',FirstNa
me,LastName)=(empleado2))) 
THEN RETURN(empleado1);
END IF;

	RETURN(empleado2);
END$$;
DELIMITER ;

SELECT func_mayorNumPedidos("Nancy Davolio","Andrew Fuller");

-- 9. Crear una rutina que devuelva en una variable el valor máximo de precio de producto.

DELIMITER $$;
DROP FUNCTION IF EXISTS func_getValoMaximo $$;
CREATE FUNCTION  func_getValoMaximo ()
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE valornaximo FLOAT;
	SET valornaximo = 0;
	SELECT 
   MAX(UnitPrice)
INTO valornaximo FROM
    products;
    RETURN(valornaximo);
END $$;
DELIMITER ;

SELECT  func_getValoMaximo(); 

-- 10. Crear una rutina que devuelva la cantidad de pedidos en una variable. -- HAY QUE VERLO
DELIMITER $$;
DROP FUNCTION IF EXISTS  func_getOrderInVar $$;
CREATE FUNCTION func_getOrderInVar()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE cantidadPedidos INT;
    SET cantidadPedidos = 0;
    SELECT COUNT(*)
    INTO cantidadPedidos FROM
    orders;
    RETURN(cantidadPedidos);
END $$;
DELIMITER ;

SELECT func_getOrderInVar();

-- 11. Repetir el anterior pero solo teniendo en cuenta aquellos pedidos que tienen descuento.
DELIMITER $$;
DROP FUNCTION IF EXISTS  func_getOrderWithDiscount $$;
CREATE FUNCTION func_getOrderWithDiscount()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE cantidadPedidos INT;
    SET cantidadPedidos = 0;
    SELECT COUNT(*)
    INTO cantidadPedidos FROM
    Orders
    WHERE Discount >= 0;
    RETURN(cantidadPedidos);
END $$;
DELIMITER ;

CALL func_getOrderWithDiscount;

-- 12. Crear una rutina que devuelva el id de empleado que tiene más pedidos.
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerEmpleadoConMasPedidos $$
CREATE PROCEDURE obtenerEmpleadoConMasPedidos(OUT empleadoID INT)
BEGIN
    SELECT EmployeeID INTO empleadoID
    FROM orders
    GROUP BY EmployeeID
    ORDER BY COUNT(*) DESC
    LIMIT 1;
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerEmpleadoConMasPedidos(@empleadoID);
SELECT @empleadoID;

SELECT * FROM CUSTOMERS;
-- 13. Crear una rutina que reciba un nombre de contacto y devuelva el ID de cliente.
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerIDClientePorNombreContacto $$
CREATE PROCEDURE obtenerIDClientePorNombreContacto(IN nombreContacto VARCHAR(100), OUT clienteID CHAR(5))
BEGIN
    SELECT CustomerID INTO clienteID FROM customers WHERE ContactName = nombreContacto;
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerIDClientePorNombreContacto("Christina Berglund", @clienteID);
SELECT @clienteID;
SELECT * FROM EMPLOYEES;
-- 14. Crear una rutina que reciba un ID de envío (ShipperID) y devuelva la cantidad de pedidos enviados con ese transportista.
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerCantidadPedidosPorEnvio $$
CREATE PROCEDURE obtenerCantidadPedidosPorEnvio(IN shipperID INT, OUT cantidadPedidos INT)
BEGIN
    SELECT COUNT(*) INTO cantidadPedidos
    FROM orders
    WHERE ShipVia = shipperID;
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerCantidadPedidosPorEnvio(1, @cantidadPedidos);
SELECT @cantidadPedidos;

-- 15. Crear una rutina que reciba dos ID de categoría, y devuelva la suma de la cantidad de productos que tienen ambas.
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerSumaCantidadProductosPorCategoria $$
CREATE PROCEDURE obtenerSumaCantidadProductosPorCategoria(IN categoriaID1 INT, IN categoriaID2 INT, OUT sumaCantidadProductos INT)
BEGIN
    SELECT SUM(Quantity) INTO sumaCantidadProductos
    FROM OrderDetails AS od
		JOIN Products AS p ON od.ProductID = p.ProductID
		JOIN Categories AS c ON p.CategoryID = c.CategoryID
    WHERE c.CategoryID = categoriaID1 OR c.CategoryID = categoriaID2;
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerSumaCantidadProductosPorCategoria(1, 2, @sumaCantidadProductos);
SELECT @sumaCantidadProductos;
select * from categories;

-- 16. Crear una rutina que reciba tres ID de categorías y devuelva sus descripciones concatenadas y separadas por punto y coma.
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerDescripcionesCategorias $$
CREATE PROCEDURE obtenerDescripcionesCategorias(IN categoriaID1 INT, IN categoriaID2 INT, IN categoriaID3 INT, OUT descripcionesCategorias VARCHAR(255))
BEGIN
    SELECT GROUP_CONCAT(Description SEPARATOR '; ') INTO descripcionesCategorias
    FROM categories AS c
    WHERE c.CategoryID IN (categoriaID1, categoriaID2, categoriaID3);
END $$
DELIMITER ;

-- Ejemplo de uso del procedimiento almacenado
CALL obtenerDescripcionesCategorias(1, 2, 3, @descripcionesCategorias);
SELECT @descripcionesCategorias;