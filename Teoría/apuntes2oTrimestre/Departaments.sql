CREATE DATABASE DEPARTMENTS;
USE DEPARTMENTS;
CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
) ENGINE=INNODB;

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','O''Donnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

-- Añade un nuevo departamento llamado "Quality Assurance", con un presupuesto de $40,000 
-- y código de departamento de 11. Añade un empleado llamado "Mary Moore" en ese departamento, 
-- con SSN 847-21-9811.

START TRANSACTION;
INSERT INTO Employees (SSN,Name,LastName,Department) 
VALUES (847219811, "Mary", " Moore", 11);
INSERT INTO Departments (Code,Name,Budget)
VALUES (11, "Quality Assurance", 40000);
COMMIT;
SELECT * FROM Employees;

-- Reduce el presupuesto de todos los departamentos un 10%
UPDATE Departments 
SET Budget = Budget * 0.9;

-- Reasigna todos los empleados del departamento Research (code 77) 
-- al departamento IT (code 14).
UPDATE Employees 
SET Department = 14
WHERE Department = 77;

-- Borra todos los empleados del departamento de IT (code 14).
DELETE
FROM Employees
WHERE Department = 14;

-- Borra todos los empleados que trabajan en departamentos con un presupuesto 
-- superior o igual a $60,000.
SELECT * FROM EMPLOYEES;
DELETE 
FROM Employees 
WHERE Department 
IN 
	(SELECT Code 
    FROM Departments 
    WHERE Budget >= 60000);

-- Borra todos los empleados.

DELETE
FROM employees;










