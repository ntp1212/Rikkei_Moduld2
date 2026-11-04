CREATE DATABASE Sec9_Ex6;
USE Sec9_Ex6;
-- DROP DATABASE Sec9_Ex6;
CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name  VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone  VARCHAR(15) NOT NULL,
    address  VARCHAR(255) NOT NULL
);
CREATE TABLE products  (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(25,2) NOT NULL CHECK(price > 0),
    stock INT NOT NULL CHECK(stock > 0)
);
CREATE TABLE orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity > 0),
    total_amount DECIMAL(25,2) CHECK(total_amount > 0),
    status ENUM('Pending','Success','Cancel') DEFAULT 'Pending',
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)    
);
-- Thêm các khách hàng mẫu có ID từ 1 đến 10 (nếu bảng đang trống hoặc thiếu ID)
INSERT INTO customers (customer_id, customer_name, email, phone, address) VALUES 
(1, 'Nguyen Van A', 'a@gmail.com', '0901111111', 'Hanoi'),
(2, 'Tran Thi B', 'b@gmail.com', '0902222222', 'Ho Chi Minh'),
(3, 'Le Van C', 'c@gmail.com', '0903333333', 'Da Nang'),
(4, 'Pham Van D', 'd@gmail.com', '0904444444', 'Hai Phong'),
(5, 'Hoang Thi E', 'e@gmail.com', '0905555555', 'Can Tho'),
(6, 'Vu Van F', 'f@gmail.com', '0906666666', 'Nha Trang'),
(7, 'Bui Thi G', 'g@gmail.com', '0907777777', 'Hue'),
(8, 'Dang Van H', 'h@gmail.com', '0908888888', 'Quang Ninh'),
(9, 'Ngo Thi I', 'i@gmail.com', '0909999999', 'Vung Tau'),
(10, 'Do Van K', 'k@gmail.com', '0900000000', 'Binh Duong');
DELIMITER $$
CREATE PROCEDURE auto_create_data ()
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i<= 20 DO
	INSERT INTO products(product_name,price,stock)
    VALUES (
			CONCAT('PRODUCT_', i),
            FLOOR(10000 + RAND() * (10000000-100000 +1)),
            FLOOR(1 + RAND() * 100)
			);
	SET I = i + 1;
    END WHILE;
END$$
DELIMITER ;
CALL auto_create_data();
DELIMITER //

CREATE TRIGGER trg_calculate_total_amount
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE v_price DECIMAL(12, 2);
    
    -- Lấy giá (price) của sản phẩm tương ứng từ bảng products
    SELECT price INTO v_price 
    FROM products 
    WHERE product_id = NEW.product_id;
    
    -- Tính total_amount = price * quantity
    SET NEW.total_amount = v_price * NEW.quantity;
END //

DELIMITER ;

SELECT * FROM products;
INSERT INTO orders (customer_id, product_id, quantity,total_amount,status) VALUES 
(1, 2, 2,  'Success'),
(1, 3, 1,'Success'),
(2, 5, 1, 'Success'),
(2, 7, 2, 'Pending'),
(3, 9, 1,'Success'),
(3, 12, 1, 'Success'),
(4, 15, 1, 'Success'),
(4, 17, 1, 'Cancel'),
(5, 2, 1, 'Success'),
(5, 3, 2, 'Success'),
(6, 5, 1, 'Pending'),
(6, 7, 1, 'Success'),
(7, 9, 2, 'Success'),
(7, 12, 1, 'Success'),
(8, 15, 1, 'Success'),
(8, 17, 1, 'Success'),
(9, 2, 3, 'Success'),
(10, 3, 1, 'Success'),
(10, 5, 1,'Pending'),
(1, 7, 1,'Success');
SELECT * FROM orders;


DELIMITER $$
CREATE PROCEDURE add_order(
					in_customer_id INT,
                    in_product_id INT,
                    in_quantity INT ,
                    OUT mes VARCHAR(250)
				)
BEGIN 
	DECLARE n_stock INT;
    DECLARE n_price INT;
    DECLARE n_total_amount DECIMAL(25,2);
    SELECT stock, price INTO n_stock,n_price
    FROM products
    WHERE product_id = in_product_id;
    IF n_stock <=0 THEN
    SET mes = "Đã hết hàng tồn kho";
    ELSEIF n_stock < in_quantity THEN
    SET mes = "Không đủ tồn kho để đặt hàng.";
    ELSE 
    -- Tinh tong tien
    SET n_total_amount = n_price * in_quantity;
    -- Them don hang moi vao orders
    INSERT INTO orders (customer_id, product_id, quantity, status)
    VALUES (in_customer_id, in_product_id, in_quantity, 'Pending' );
    -- Tru ton kho
    SET SQL_SAFE_UPDATES = 0;
    UPDATE products SET stock = stock - in_quantity 
    WHERE product_id = in_product_id;
	SET SQL_SAFE_UPDATES = 1;
    SET mes = 'Thêm đơn hàng thành công';
    END IF;
    END$$
    DELIMITER ;
CALL add_order(1,2,200,@mes);
SELECT @mes AS message;
    
