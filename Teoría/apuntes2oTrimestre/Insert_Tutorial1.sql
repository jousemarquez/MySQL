-- Tutorial 1 
/*
CREATE DATABASE [IF NOT EXISTS] database_name
[CHARACTER SET charset_name]
[COLLATE collation_name]
*/
-- SHOW DATABASE testdb;
/*SHOW CREATE database testdb;*/
-- USE testdb;

-- Tutorial 2
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;
INSERT INTO tasks (title,status,priority, description)
VALUES ("a",1,1, 'hola');
SELECT * FROM tasks;

DESCRIBE tasks;

CREATE TABLE IF NOT EXISTS checklists (
    todo_id INT AUTO_INCREMENT,
    task_id INT,
    todo VARCHAR(255) NOT NULL,
    is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (todo_id , task_id),
    FOREIGN KEY (task_id)
        REFERENCES tasks (task_id)
        ON UPDATE RESTRICT ON DELETE CASCADE
);

-- Tutorial 3
/*
[CONSTRAINT constraint_name]
FOREIGN KEY [foreign_key_name] (column_name, ...)
REFERENCES parent_table(colunm_name,...)
[ON DELETE reference_option] // CASCADE, SET NULL, RESTRICT
[ON UPDATE reference_option] // "" 
							 //Default: RESTRICT
*/
CREATE DATABASE fkdemo;

USE fkdemo;

CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
) ENGINE=INNODB;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
) ENGINE=INNODB;

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
SELECT * FROM categories;
SELECT * FROM products;

INSERT INTO products(productName, categoryId)
VALUES('iPhone',1);

INSERT INTO products(productName, categoryId)
VALUES('iPad',3); -- No se puede, categoryId 3 no existe en partent table, RESTRICT Constraint

DROP TABLE products;
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
    REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB;

INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);
    
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;   

DELETE FROM categories
WHERE categoryId = 2;

DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;

CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)ENGINE=INNODB;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
        ON UPDATE SET NULL
        ON DELETE SET NULL 
)ENGINE=INNODB;

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

DELETE FROM categories 
WHERE categoryId = 2;
SELECT * FROM Categories;    
SELECT * FROM Products;    

/*ALTER TABLE table_name 
DROP FOREIGN KEY constraint_name;*/
-- SHOW CREATE TABLE table_name;

SHOW CREATE TABLE products; -- to see constraint_name;

ALTER TABLE products 
DROP FOREIGN KEY fk_category;

SET foreign_key_checks = 0; -- disable foreign key checksum table
SET foreign_key_checks = 1; -- enable



-- Tutorial 4

CREATE TABLE vehicles (
    vehicleId INT,
    year INT NOT NULL,
    make VARCHAR(100) NOT NULL,
    PRIMARY KEY(vehicleId)
);

-- add column to table
/*ALTER TABLE table_name
ADD 
    new_column_name column_definition
    [FIRST | AFTER column_name]
*/
-- column_definition --> specify the datatype, maximum size, and column constraint of the new column
-- FIRST || AFTER column_name specify the position of the new column in the table

ALTER TABLE vehicles
ADD model VARCHAR(100) NOT NULL;

DESCRIBE vehicles; -- shows you table data (how it's constructed)

ALTER TABLE vehicles
ADD color VARCHAR(50),
ADD note VARCHAR(255);

-- modify column
/*ALTER TABLE table_name
MODIFY column_name column_definition
[ FIRST | AFTER column_name];    
*/
 -- 1. Show column list
 DESCRIBE vehicles;
 
 -- 2. Modify data
ALTER TABLE vehicles 
MODIFY note VARCHAR(100) NOT NULL;

-- multiple columns
ALTER TABLE vehicles 
MODIFY year SMALLINT NOT NULL,
MODIFY color VARCHAR(20) NULL AFTER make;

-- rename column
/*
ALTER TABLE table_name
CHANGE COLUMN original_name new_name column_definition
[FIRST | AFTER column_name];
*/

-- CHANGE instead of MODIFY

ALTER TABLE vehicles 
CHANGE COLUMN note vehicleCondition VARCHAR(100) NOT NULL;

-- DROP column
ALTER TABLE vehicles
DROP COLUMN vehicleCondition;

-- rename table
/*
ALTER TABLE table_name
RENAME TO new_table_name;
*/






