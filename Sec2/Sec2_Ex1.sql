CREATE TABLE students(
	maSinhVien VARCHAR(10) PRIMARY KEY,
    hoTen VARCHAR(20),
    ngaySinh DATE,
    gioiTinh ENUM('Nam', 'Nữ', 'Khác')
);