CREATE DATABASE Sec5_Ex4;
USE Sec5_Ex4;
CREATE TABLE Customers (
customer_id VARCHAR(20) PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
order_id VARCHAR(20) PRIMARY KEY,
order_date DATE NOT NULL,
customer_id  VARCHAR(20),
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id)
);
CREATE TABLE Order_items (
order_id VARCHAR(20) ,
customer_id  VARCHAR(20),
product_name  VARCHAR(100),
quantity INT NOT NULL,
price DECIMAL(15,2) NOT NULL,
PRIMARY KEY(order_id,customer_id),
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id),
FOREIGN KEY (order_id)
REFERENCES Orders(order_id)
);
DROP TABLE Customers;
DROP TABLE Order_items;
DROP TABLE Orders;

INSERT INTO Customers
VALUES ('Cu001','Nguyen thi A');
INSERT INTO Customers
VALUES ('Cu002','Nguyen Van B');
INSERT INTO Customers
VALUES ('Cu003','Nguyen Duy C');
INSERT INTO Customers
VALUES ('Cu004','Nguyen thi D');

INSERT INTO Orders
VALUES ('Or001','2026-01-25','Cu004');
INSERT INTO Orders
VALUES ('Or002','2026-01-29','Cu001');
INSERT INTO Orders
VALUES ('Or003','2026-06-02','Cu003');
INSERT INTO Orders
VALUES ('Or004','2026-07-26','Cu002');
INSERT INTO Orders
VALUES ('Or005','2026-08-25','Cu004');

INSERT INTO Order_items
VALUES ('Or001','Cu004','Xa phong tam loai 1','5','25000');
INSERT INTO Order_items
VALUES ('Or002','Cu004','Tivi Panasonic YTUO15','1','25000000');
INSERT INTO Order_items
VALUES ('Or003','Cu001','Laptop Dell In4589','2','35000000');
INSERT INTO Order_items
VALUES ('Or004','Cu002','Noi inox FRT','3','25000');
INSERT INTO Order_items
VALUES ('Or005','Cu002','Laptop Dell In4589','1','35000000');
/*
Hiển thị:
mã đơn hàng
ngày đặt hàng
tên khách hàng
*/
SELECT
    o.order_id,
    o.order_date,
    c.customer_name
FROM Orders AS o
JOIN Customers AS c
    ON o.customer_id = c.customer_id;
    
/*
Hiển thị:
danh sách sản phẩm trong mỗi đơn hàng
*/
SELECT
    o.order_id,
    oi.product_name,
    oi.quantity,
    oi.price
FROM Orders AS o
JOIN Order_items AS oi
    ON o.order_id = oi.order_id;
/*
Tính:
tổng tiền của mỗi đơn hàng
*/
SELECT
    o.order_id,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders AS o
JOIN Order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id;
/*
Hiển thị:
các đơn hàng có tổng tiền lớn hơn 10.000.000
*/
SELECT
    o.order_id,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders AS o
JOIN Order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING SUM(oi.quantity * oi.price) > 10000000;
