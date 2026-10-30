CREATE DATABASE Sec7_Ex3;
USE Sec7_Ex3;

CREATE TABLE employees (
	ma_nhan_vien VARCHAR(100) PRIMARY KEY,
    ten_nhan_vien VARCHAR(100) NOT NULL,
    phong_ban VARCHAR(100),
    luong DECIMAL(10,2)
);
CREATE INDEX idx_department
ON  employees(phong_ban);

