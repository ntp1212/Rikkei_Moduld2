-- DROP DATABASE Sec6_Ex1;
CREATE DATABASE Sec6_Ex1;
USE Sec6_Ex1;
CREATE TABLE categories(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE products(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    price DOUBLE NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id)
    REFERENCES categories(id)
);
INSERT INTO categories(name) 
VALUES 	('Đồ điện tử'),
		('Đồ gia dụng');

INSERT INTO products(name,price,category_id) 
VALUES 	('Cốc thủy tinh','25000','2'),
		('Bàn trà','10000000','2'),
        ('Điện thoại Iphone 18','25000000','1'),
        ('Nước mắm','18000','2'),
        ('Ấm siêu tốc','500000','2'),
        ('Bình giữ nhiệt','600000','2');
-- Cập nhật giá của một sản phẩm đã có
UPDATE products SET price = 350000 WHERE name = 'Bình giữ nhiệt';
SET SQL_SAFE_UPDATES =1;
-- Xóa một sản phẩm
DELETE FROM products WHERE id= 6;
-- Hiển thị tất cả sản phẩm, sắp xếp theo giá
SELECT * FROM products
ORDER BY price;
-- Thống kê số lượng sản phẩm cho từng danh mục
SELECT ca.name, COUNT(p.id) FROM categories ca LEFT JOIN products p
ON ca.id = p.category_id
GROUP BY ca.id;

