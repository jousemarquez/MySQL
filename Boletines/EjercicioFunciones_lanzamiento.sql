SELECT sumar(2,3);
SELECT mayuscula("jouse");

# Crear una función multiplicar que reciba un float y un entero, y los devuelva multiplicados.
# Usar la función para mostrar el ID de producto, el nombre de producto y los beneficios de venderlo
# (UnitPrice*UnitsInStock), usando la función creada, sobre la tabla Products.

SELECT ProductID, ProductName, multiplicar(UnitPrice, UnitsInStock) AS "Beneficios de venta" FROM products;