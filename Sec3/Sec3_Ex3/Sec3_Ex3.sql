/*
Thực thể: orders,products,order_items
orders: orderId(PK), orderDate
products: productId(PK), productName, price
order_items: orderId(PK),productId(PK),quatity
*/
CREATE DATABASE Sec3_Ex3;
USE Sec3_Ex3;
CREATE TABLE orders(
orderId VARCHAR(20) PRIMARY KEY,
orderDate DATE NOT NULL
);
CREATE TABLE products(
productId VARCHAR(20) PRIMARY KEY,
productName VARCHAR(20) NOT NULL,
price INT NOT NULL
);
CREATE TABLE order_items(
orderId VARCHAR(20),
productId VARCHAR(20) NOT NULL,
quatity INT NOT NULL,
PRIMARY KEY (orderId,productId),
FOREIGN KEY (orderId)
	REFERENCES orders(orderId),
FOREIGN KEY (productId)
	REFERENCES products(productId)
);