CREATE SCHEMA Sec2_Ex6;

CREATE TABLE orders(
orderId VARCHAR(50) PRIMARY KEY,
orderDate DATE NOT NULL,
orderStatus VARCHAR(10) NOT NULL
);

CREATE TABLE products(
productId VARCHAR(50) PRIMARY KEY,
productName VARCHAR(50),
cost INT NOT NULL
);

CREATE TABLE order_items(
orderId VARCHAR(50) NOT NULL,
productId VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
FOREIGN KEY (orderId)
	REFERENCES orders(orderId),
FOREIGN KEY (productId)
	REFERENCES products(productId)
);