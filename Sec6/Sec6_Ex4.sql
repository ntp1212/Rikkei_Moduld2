-- DROP DATABASE Sec6_Ex4;
CREATE DATABASE Sec6_Ex4;
USE Sec6_Ex4;
CREATE TABLE categories(
	id INT PRIMARY KEY,
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
CREATE TABLE customers(
	id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE orders(
	id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
);
CREATE TABLE order_details(
	order_id INT,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity > 0),
    price DOUBLE CHECK(price > 0),
    PRIMARY KEY(order_id,product_id),
    FOREIGN KEY (product_id)
    REFERENCES products(id),
    FOREIGN KEY (order_id)
    REFERENCES orders(id)
);

INSERT INTO categories(id,name) 
VALUES 	('1','Đồ điện tử'),
		('2','Đồ gia dụng');

INSERT INTO products(id,name,price,category_id) 
VALUES 	('1','Cốc thủy tinh','25000','2'),
		('2','Bàn trà','10000000','2'),
        ('3','Điện thoại Iphone 18','25000000','1'),
        ('4','Nước mắm','18000','2'),
        ('5','Ấm siêu tốc','500000','2'),
        ('6','Bình giữ nhiệt','600000','2');
        
INSERT INTO customers (id,name,email)
VALUES 	('1','Nguyen Thi A','a@gmail.com'),
		('2','Tran Duy H','h@gmail.com'),
        ('3','Pham Thu G','g@gmail.com'),
        ('4','Chu Thanh N','n@gmail.com'),
        ('5','Nguyen Thi K','k@gmail.com'),
		('6','Khuat Duy t','t@gmail.com');
INSERT INTO orders(id,customer_id, order_date)
VALUES 	('1','3','2026-05-25'),
		('2','4','2026-06-12'),
        ('3','2','2026-04-21'),
        ('4','4','2026-08-14'),
        ('5','4','2026-08-29');
INSERT INTO order_details(order_id,product_id,quantity,price)
VALUES ('1', '2', '3', 10000000),
		('1', 1, 5, 25000),
        (2, 3, 1, 25000000),
        ('3', 4, 3, 18000),
        (4, 6, 1, 600000),
        (5, 5, 6, 500000);
-- Thêm một đơn hàng mới vào bảng orders và chi tiết của đơn hàng đó vào bảng order_details.
INSERT INTO orders(id,customer_id, order_date)
VALUES 	('6','3','2026-10-11'),
		('7','4','2026-10-12');
INSERT INTO order_details(order_id,product_id,quantity,price)
VALUES ('6', '2', '3', 10000000),
		('7', 1, 5, 25000);
-- Tính tổng doanh thu của toàn bộ cửa hàng.
SELECT SUM(price) as Toatal_amount FROM order_details;
-- Tính doanh thu trung bình của mỗi đơn hàng.
SELECT AVG(order_avg) FROM (
SELECT o.id,
 SUM(od.quantity * od.price) AS order_avg 
 FROM orders o
JOIN order_details od
ON o.id = od.order_id
GROUP BY o.id
) AS or_total;
-- Tìm và hiển thị thông tin của đơn hàng có doanh thu cao nhất.
SELECT MAX(or_amount) FROM(
SELECT o.id, SUM(od.quantity * od.price) AS or_amount
FROM orders o
JOIN order_details od
ON o.id =od.order_id
GROUP BY o.id
) AS or_total;
-- Tìm và hiển thị danh sách 3 sản phẩm bán chạy nhất dựa trên tổng số lượng đã bán.
SELECT p.id, p.name, SUM(od.quantity) AS total_sell FROM products p
JOIN order_details od
ON p.id = od.product_id
GROUP BY p.id
ORDER BY total_sell DESC LIMIT 3;