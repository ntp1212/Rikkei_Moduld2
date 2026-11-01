-- DROP DATABASE Sec8_Ex2;
CREATE DATABASE Sec8_Ex2;
USE Sec8_Ex2;

CREATE TABLE products(
	product_id VARCHAR(100) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
	catelogy VARCHAR(100) NOT NULL
);
INSERT INTO products(product_id,product_name,price,catelogy)
VALUES (1, 'IphoneX',25000000, 'Đồ điện tử'),
		(2, 'Bình nước khoáng',50000, 'Đồ gia dụng'),
        (3, 'Laptop',25000000, 'Đồ điện tử');
DELIMITER $$
CREATE PROCEDURE sp_get_products_by_category(
				IN catelogy_IN VARCHAR(100))
BEGIN 
	SELECT product_name FROM products
    WHERE catelogy = catelogy_IN;
END $$
DELIMITER ;

CALL sp_get_products_by_category('Đồ điện tử');