CREATE DATABASE Sec10_Ex2;
USE Sec10_Ex2;
-- DROP DATABASE Sec10_Ex2;
CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(50) NOT NULL,
    quantity  INT NOT NULL
);
DELIMITER //
SELECT * FROM products;
CREATE TRIGGER BeforeProductDelete
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
    -- Kiểm tra nếu số lượng sản phẩm chuẩn bị xóa lớn hơn 10
    IF OLD.quantity > 10 THEN
        -- Dùng hàm SIGNAL để báo lỗi và hủy thao tác xóa
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không được phép xóa sản phẩm có số lượng lớn hơn 10!';
    END IF;
END //

DELIMITER ;
-- Bước 1: Thêm dữ liệu mẫu vào bảng products
INSERT INTO products (product_name, quantity) VALUES ('Tai nghe Bluetooth', 15); -- Số lượng lớn hơn 10
INSERT INTO products (product_name, quantity) VALUES ('Chuột không dây', 5);    -- Số lượng nhỏ hơn hoặc bằng 10

-- Bước 2: Thử xóa sản phẩm có số lượng lớn hơn 10 (Sẽ bị báo lỗi và chặn lại)
DELETE FROM products WHERE product_id = 1;

-- Bước 3: Thử xóa sản phẩm có số lượng nhỏ hơn hoặc bằng 10 (Xóa thành công bình thường)
DELETE FROM products WHERE product_id = 2;

