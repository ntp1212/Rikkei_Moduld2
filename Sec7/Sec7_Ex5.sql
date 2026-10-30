CREATE DATABASE Sec7_Ex5;
USE Sec7_Ex5;

CREATE TABLE employees (
	ma_nhan_vien VARCHAR(100) PRIMARY KEY,
    ten_nhan_vien VARCHAR(100) NOT NULL,
    phong_ban VARCHAR(100),
    luong DECIMAL(10,2),
    CMND INT UNIQUE NOT NULL
);
CREATE VIEW v_employee_public
AS SELECT ma_nhan_vien,ten_nhan_vien,phong_ban
FROM employees;
SELECT * FROM v_employee_public;