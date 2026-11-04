CREATE DATABASE Sec9_Ex4;
USE Sec9_Ex4;
-- DROP DATABASE Sec9_Ex4;
CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name  VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone  VARCHAR(15) NOT NULL,
    address  VARCHAR(255) NOT NULL
);

DELIMITER $$
CREATE PROCEDURE insert_customer(
				IN in_customer_name VARCHAR(50),
                IN in_email VARCHAR(100),
                IN in_phone VARCHAR(15),
                IN in_address VARCHAR(255),
                OUT mes VARCHAR(50)
					)
BEGIN
	INSERT INTO customers(customer_name,email,phone,address)
    VALUES (in_customer_name,in_email,in_phone,in_address);
    SET mes = 'Thêm mới khách hàng thành công ';
END$$
DELIMITER ;
CALL insert_customer('Nguyen Thi A','a@gmail.com',0126789541,'abc xyz', @mes);
SELECT @mes AS message;