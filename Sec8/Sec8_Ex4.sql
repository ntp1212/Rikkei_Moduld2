-- DROP DATABASE Sec8_Ex4;
CREATE DATABASE Sec8_Ex4;
USE Sec8_Ex4;

CREATE TABLE orders  (
	order_id VARCHAR(100) PRIMARY KEY,
   total_amount DECIMAL(10,2) NOT NULL
);
DELIMITER $$
CREATE PROCEDURE sp_check_order_value(
			IN order_total DECIMAL(20,2))
BEGIN
DECLARE  order_comment VARCHAR(255);
    IF (order_total > 5000000) THEN 
			SET order_comment = 'Đơn hàng giá trị cao';
	ELSE 
			SET order_comment = 'Đơn hàng bình thường';
	END IF;
    SELECT order_comment;
END $$
DELIMITER ;
CALL sp_check_order_value(500000);