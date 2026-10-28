-- DROP DATABASE Sec6_Ex3;
CREATE DATABASE Sec6_Ex3;
USE Sec6_Ex3;
CREATE TABLE categories(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE products(
	id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    price DOUBLE NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id)
    REFERENCES categories(id)
);
INSERT INTO categories(name) 
VALUES 	('Đồ điện tử'),
		('Đồ gia dụng');
INSERT INTO products(id,name,price,category_id) 
VALUES 	('1','Cốc thủy tinh','25000','2'),
		('2','Bàn trà','10000000','2'),
        ('3','Điện thoại Iphone 18','25000000','1'),
        ('4','Nước mắm','18000','2'),
        ('5','Ấm siêu tốc','500000','2'),
        ('6','Bình giữ nhiệt','600000','2');
-- Tìm các sản phẩm có giá nằm trong một khoảng cụ thể
SELECT id, name, price FROM products 
WHERE price BETWEEN 100000 AND 1000000;
-- Tìm các sản phẩm có tên chứa một chuỗi ký tự nhất định
SELECT id, name, price FROM products
WHERE name LIKE '%a%';
-- Tính giá trung bình của sản phẩm cho mỗi danh mục
SELECT ca.id, ca.name, AVG(p.price) AS AVG_price
FROM categories ca
JOIN products p
ON ca.id = p.category_id
GROUP BY ca.id;
-- Tìm những sản phẩm có giá cao hơn mức giá trung bình của toàn bộ sản phẩm
SELECT id, name FROM products 
WHERE price > (
SELECT AVG(price) FROM products
);
-- Tìm sản phẩm có giá thấp nhất cho từng danh mục
SELECT ca.id, ca.name, MIN(p.price) FROM categories ca
JOIN products p
ON ca.id = p.category_id
GROUP BY ca.id
HAVING MIN(p.price);