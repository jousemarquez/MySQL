-- 1.	Añadir una entrada a la base de datos para indicar que "Suministros Skellington" (code "TNBC") proveerá piñones (code "1") por 7 céntimos cada uno.
INSERT INTO provee (ID_Pieza, ID_Proveedor, Precio)
values ("1", "TNBC", "7");
-- 2.	Incrementa todos los precios por un céntimo.
UPDATE provee 
SET 
    Precio = Precio + 1;
-- 3.	Actualiza la base de datos para reflejar que "Corporacion Susan Calvin" (code "RBT") no proveerá clavos (code 4).
DELETE FROM provee 
WHERE
    ID_Proveedor = 'RBT' AND ID_Pieza = '4';
-- 4.	Actualiza la base de datos para reflejar que "Corporacion Susan Calvin" (code "RBT") no proveerá ninguna pieza (el proveedor debe permanecer en la base de datos).
DELETE FROM provee 
WHERE
    ID_Proveedor = 'RBT';