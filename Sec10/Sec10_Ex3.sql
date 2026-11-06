CREATE DATABASE Sec10_Ex3;
USE Sec10_Ex3;
-- DROP DATABASE Sec10_Ex3;
CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(50) NOT NULL,
    quantity  INT NOT NULL
);
DELIMITER //

CREATE TRIGGER BeforeInsertProduct
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    -- Kiểm tra nếu số lượng sản phẩm mới nhỏ hơn 0
    IF NEW.quantity < 0 THEN
        -- Dùng hàm SIGNAL để tạo lỗi và ngăn chặn việc chèn bản ghi
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Số lượng sản phẩm không thể nhỏ hơn 0!';
    END IF;
END //

DELIMITER ;
-- Thêm sản phẩm hợp lệ (số lượng >= 0) -> Thành công
INSERT INTO products (product_name, quantity) VALUES ('Laptop Gaming', 10);

-- Thêm sản phẩm không hợp lệ (số lượng < 0) -> Sẽ bị chặn và báo lỗi
INSERT INTO products (product_name, quantity) VALUES ('Chuột không dây', -5);