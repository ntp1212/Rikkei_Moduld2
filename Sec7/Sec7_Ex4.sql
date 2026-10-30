CREATE DATABASE Sec7_Ex4;
USE Sec7_Ex4;

CREATE TABLE products (
	ma_san_pham VARCHAR(100) PRIMARY KEY,
    ten_san_pham VARCHAR(100) UNIQUE NOT NULL,
    loai_san_pham VARCHAR(100) NOT NULL,
    gia_ban DECIMAL(10,2) NOT NULL
);
CREATE INDEX idx_loai_sp_gia_ban
ON products(loai_san_pham,gia_ban);