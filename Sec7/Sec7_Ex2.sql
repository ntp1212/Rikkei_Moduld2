CREATE DATABASE Sec7_Ex2;
USE Sec7_Ex2;

CREATE TABLE customers(
	Ma_khach_hang VARCHAR(100) PRIMARY KEY,
    ten_khach_hang VARCHAR(100) NOT NULL
);
CREATE TABLE orders(
	ma_don_hang VARCHAR(100) PRIMARY KEY,
    ngay_dat_hang DATE NOT NULL,
    Ma_khach_hang VARCHAR(100) NOT NULL,
    FOREIGN KEY (Ma_khach_hang) 
    REFERENCES customers(Ma_khach_hang)
);

CREATE VIEW v_order_info
AS SELECT o.ma_don_hang,o.ngay_dat_hang, cu.ten_khach_hang 
FROM orders o JOIN customers cu
ON o.Ma_khach_hang = cu.Ma_khach_hang;
SELECT * FROM v_order_info;