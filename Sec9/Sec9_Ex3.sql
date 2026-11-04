CREATE DATABASE Sec9_Ex3;
USE Sec9_Ex3;
-- DROP DATABASE Sec9_Ex3;
CREATE TABLE products  (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(25,2) NOT NULL CHECK(price > 0),
    stock INT NOT NULL CHECK(stock > 0)
);

DELIMITER $$
CREATE PROCEDURE auto_create_data ()
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i<= 20 DO
	INSERT INTO products(product_name,price,stock)
    VALUES (
			CONCAT('PRODUCT_', i),
            FLOOR(10000 + RAND() * (10000000-100000 +1)),
            FLOOR(1 + RAND() * 100)
			);
	SET I = i + 1;
    END WHILE;
END$$
DELIMITER ;
CALL auto_create_data();
SELECT * FROM products;

DELIMITER $$
CREATE PROCEDURE get_high_value_products()
BEGIN
SELECT * FROM products
WHERE price > 1000000;
END$$
DELIMITER ;
CALL get_high_value_products();
