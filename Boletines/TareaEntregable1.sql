/*1. Mostrar los productos con ID de producto PAR.*/
SELECT * FROM northwind.products WHERE ProductID % 2 = 0;
/*2. Mostrar los pedidos realizados en el año 1997 o 1998.*/
SELECT * FROM northwind.orders WHERE OrderDate BETWEEN '1997-01-01 00:00:00' AND '1998-12-31 23:59:59';
/*3. Mostrar los proveedores de Londres o Venezuela.*/
SELECT * FROM northwind.suppliers WHERE City='London' OR Country='Venezuela';
