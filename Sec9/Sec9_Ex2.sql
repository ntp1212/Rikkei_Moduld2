CREATE DATABASE Sec9_Ex2;
USE Sec9_Ex2;
-- DROP DATABASE Sec9_Ex2;
CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name  VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone  VARCHAR(15) NOT NULL,
    address  VARCHAR(255) NOT NULL
);
CREATE OR REPLACE VIEW view_customer_contact AS
 SELECT customer_id,customer_name,email,phone FROM customers;
SELECT * FROM view_customer_contact;