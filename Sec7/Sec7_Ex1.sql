CREATE DATABASE Sec7_Ex1;
USE Sec7_Ex1;

CREATE TABLE students(
	Ma_sinh_vien VARCHAR(100) PRIMARY KEY,
    Ho_Ten VARCHAR(100) NOT NULL,
    Born_year YEAR,
    class VARCHAR(15),
    address VARCHAR(255)
);
CREATE VIEW v_student_basic
AS SELECT Ma_sinh_vien,Ho_Ten,class
FROM students;

SELECT * FROM v_student_basic;