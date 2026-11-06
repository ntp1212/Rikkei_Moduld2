CREATE DATABASE Sec10_Ex1;
USE Sec10_Ex1;
-- DROP DATABASE Sec10_Ex1;
CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(50) NOT NULL,
    quantity  INT NOT NULL
);
CREATE TABLE InventoryChanges (
	change_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id  VARCHAR(50) NOT NULL,
    old_quantity  INT NOT NULL,
    new_quantity  INT NOT NULL,
    change_date DATE NOT NULL
);


DELIMITER //

CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    -- Chỉ ghi nhận lịch sử nếu cột quantity thực sự có sự thay đổi giá trị
    IF OLD.quantity <> NEW.quantity THEN
        INSERT INTO inventoryChanges (product_id, old_quantity, new_quantity, change_date)
        VALUES (OLD.product_id, OLD.quantity, NEW.quantity, NOW());
    END IF;
END //

DELIMITER ;


-- Bước 1: Thêm một sản phẩm mẫu vào bảng products[cite: 3]
INSERT INTO products (product_name, quantity) VALUES ('Bàn phím cơ', 100);

-- Bước 2: Cập nhật số lượng sản phẩm (Ví dụ: xuất kho bán bớt, số lượng giảm từ 100 xuống 85)
UPDATE products SET quantity = 85 WHERE product_id = 1;

-- Bước 3: Kiểm tra bảng lịch sử thay đổi inventoryChanges[cite: 3]
SELECT * FROM inventoryChanges;
