CREATE DATABASE Sec7_Ex6;
USE Sec7_Ex6;

CREATE TABLE orders(
	ma_don_hang VARCHAR(100) PRIMARY KEY,
    ngay_dat_hang DATE NOT NULL,
	trang_thai VARCHAR(100) NOT NULL,
    tong_tien DECIMAL(10,0)
);
CREATE INDEX idx_timKiem_trangThai_ngayDat
ON orders(trang_thai,ngay_dat_hang);
