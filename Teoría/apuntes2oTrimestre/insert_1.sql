INSERT INTO Employees (EmployeeID, LastName, FirstName) VALUES (50, 'Sisamon', 'Maria');
SELECT * FROM Employees;
-- INSERT sirve para meter filas totalmente nuevas
INSERT INTO Employees (EmployeeID, LastName, FirstName) 
VALUES 
	(0, 'Sisamon', 'Maria'),
    (5, 'Pérez', 'Maria'),
    (0, 'Márquez', 'Maria');
    
 insert into categories (CategoryName, Description, Picture)
 values 
	("tabaco", "Desc1", null),  -- cada vez que se añade una fila se pone el id de manera
    ("frutos secos", "Desc1",null),-- automática, tiene autoincremento (no hayq que poner el 0)
    ("encurtidos", "Desc1",null),
    ("chacina", "Desc1",null);
    
 INSERT INTO Categories 
 SET CategoryName = "Dulces" , Description = "Dulces y bollería", Picture = null; -- añade una sola fila
 
 -- Insert Into tabla2 Select * FROM tabla1 Las filas que genera el select se insertan en tabla2
 
 INSERT INTO Employees (LastName, FirstName)
 SELECT LastName, FirstName 
 FROM Employees 
 WHERE EmployeeID <=5 
 AND EmployeeID <=9;
 
 -- REPLACE INTO, si la clave primaria coincide, lo reemplaza
 SELECT * FROM Employees;
 REPLACE INTO Employees (EmployeeID, LastName, FirstName)
 VALUES (60,"Buchanan","Alfred");
 SELECT * FROM Categories;
 DELETE FROM Categories WHERE CategoryID > 8; -- borra filas
 DELETE FROM Employees WHERE EmployeeID > 9; 
 
 -- Update tabla SET columna1=a, columna2 = b WHERE condicion;
 insert into categories (CategoryName, Description, Picture)
 values ("tabaco", "Desc1", null);
 SELECT * FROM Categories;
 