-- DROP DATABASE Sec6_Ex6;
CREATE DATABASE Sec6_Ex6;
USE Sec6_Ex6;
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
INSERT INTO products(id,name,price,category_id) 
VALUES 	(7,'Laptop DELL ','25000000','1');      
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
VALUES 	(1, 2, 3, 10000000),
		(1, 1, 5, 25000),
        (2, 3, 1, 25000000),
        (3, 4, 3, 18000),
        (4, 6, 1, 600000),
        (5, 5, 6, 500000);
        
-- Liệt kê sản phẩm cùng với tên danh mục tương ứng.
SELECT p.id, p.name, ca.name FROM products p
JOIN categories ca
ON p.category_id = ca.id;
-- Đếm số đơn hàng của từng khách hàng.
SELECT cu.id, cu.name, COUNT(o.id) AS total_orders FROM customers cu
JOIN orders o 
ON cu.id = o.customer_id
GROUP BY cu.id;
-- Xác định 5 khách hàng có tổng doanh thu chi tiêu cao nhất.
SELECT cu.id, cu.name, SUM(od.quantity * od.price) AS total_amount
FROM customers cu
JOIN orders o
ON cu.id = o.customer_id
JOIN order_details od
ON od.order_id = o.id
GROUP BY cu.id
ORDER BY total_amount DESC
LIMIT 5;

-- Tìm các sản phẩm chưa từng xuất hiện trong bất kỳ đơn hàng nào.
SELECT p.id, p.name FROM products p
LEFT JOIN order_details od
ON p.id = od.product_id
WHERE od.quantity IS NULL;
-- Tìm những khách hàng đã mua sản phẩm thuộc danh mục có số lượng sản phẩm lớn nhất.
