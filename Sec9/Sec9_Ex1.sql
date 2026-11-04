CREATE DATABASE Sec9_Ex1;
USE Sec9_Ex1;
-- DROP DATABASE Sec9_Ex1;
CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name  VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone  VARCHAR(15) NOT NULL,
    address  VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX idx_email ON customers(email);
CREATE INDEX idx_phone ON customers(phone);
SHOW INDEX FROM customers;