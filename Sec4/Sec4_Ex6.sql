CREATE DATABASE Sec4_Ex6;
USE Sec4_Ex6;
CREATE TABLE employees  (
product_id   VARCHAR(20) PRIMARY KEY,
product_name   VARCHAR(50) NOT NULL,
category  VARCHAR(20),
price DECIMAL(15,2) NOT NULL,
quantity  INT NOT NULL
);
INSERT INTO employees  
VALUES ('1','Iphone 18','Phone','18000000',15);
INSERT INTO employees  
VALUES ('2','ASUS 9','Phone','8000000',30);
INSERT INTO employees  
VALUES ('3','DELL LATUS u86','Laptop','25000000',9);
INSERT INTO employees  
VALUES ('4','Macbook 5','Laptop','35000000',0);
INSERT INTO employees  
VALUES ('5','DELL Er468','Laptop','9800000',17);
INSERT INTO employees  
VALUES ('6','Ipad Air3','Tablet','6000000',18);
INSERT INTO employees  
VALUES ('7','Samsung Galasonix 5','Phone','14000000',0);
DROP TABLE employees;
SELECT * FROM employees
WHERE price BETWEEN 5000000 AND 15000000;
SELECT * FROM employees
WHERE category IN ('Laptop','Phone');
SELECT * FROM employees
WHERE product_name LIKE 'Sam%';
SELECT * FROM employees
WHERE category <> 'Phone';
UPDATE employees
SET price = price * 0.95
WHERE category = 'Laptop';
DELETE FROM employees
WHERE quantity = 0;
SELECT * FROM employees;