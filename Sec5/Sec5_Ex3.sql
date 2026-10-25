CREATE DATABASE Sec5_Ex3;
USE Sec5_Ex3;
CREATE TABLE products (
product_id VARCHAR(20) PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(20),
price DECIMAL(15,2) NOT NULL
);
DROP TABLE products;
INSERT INTO products
VALUES ('PRO001','Xa phong tam loai 1','Do tay rua','25000');
INSERT INTO products
VALUES ('PRO002','Xa phong tam loai 2','Do tay rua','50000');
INSERT INTO products
VALUES ('PRO003','Noi inox ABG','Do bep','25000');
INSERT INTO products
VALUES ('PRO004','Noi inox FRT','Do bep','25000');
INSERT INTO products
VALUES ('PRO005','Tivi Panasonic YTUO15','Do dien tu','25000000');
INSERT INTO products
VALUES ('PRO006','Laptop Dell In4589','Do dien tu','35000000');
INSERT INTO products
VALUES ('PRO007','Iphone 18','Do dien tu','18000000');
INSERT INTO products
VALUES ('PRO008','Samsung Galaxy 9','Do dien tu','24000000');
INSERT INTO products
VALUES ('PRO009','Coc nhua ABS','Do gia dung','30000');
INSERT INTO products
VALUES ('PRO010','Den trang tri','Do gia dung','300000');
INSERT INTO products
VALUES ('PRO011','Den trang tri','Do gia dung','30000000');
/*
Hiển thị các sản phẩm có:
giá cao hơn giá trung bình của tất cả sản phẩm
*/
SELECT * FROM products
WHERE price > (
SELECT AVG(price) FROM products
);
/*
Hiển thị sản phẩm có:
giá cao nhất trong từng loại sản phẩm
*/
SELECT * FROM products AS p1
WHERE price = (
SELECT MAX(p2.price)
FROM products AS p2
WHERE p2.category = p1.category
);
/*
Hiển thị các sản phẩm thuộc loại:
có ít nhất một sản phẩm giá trên 20.000.000
*/
SELECT * FROM products AS p1
WHERE price = ANY (
SELECT price FROM products
WHERE price > 20000000
)