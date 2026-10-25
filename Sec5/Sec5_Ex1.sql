CREATE DATABASE Sec5_Ex1;
USE Sec5_Ex1;
CREATE TABLE students(
student_id VARCHAR(20) PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
birth_year YEAR,
gender VARCHAR(6),
score DECIMAL(4,2) NOT NULL
);
DROP TABLE students;
INSERT INTO students
VALUES ('SV001','Nguyễn Thị A','2005','Female','8.2');
INSERT INTO students
VALUES ('SV002','Nguyễn Văn B','2008','Male','6.9');
INSERT INTO students
VALUES ('SV003','Nguyễn Thị E','2007','Male','7.5');
INSERT INTO students
VALUES ('SV004','Nguyễn Thu D','2005','Female','8.0');
INSERT INTO students
VALUES ('SV005','Nguyễn Thị H','2000','Female','7.2');
/*Hiển thị:
mã sinh viên
họ tên (viết hoa toàn bộ) - Bạn đầu chưa in hoa hết*/
SELECT student_id,UPPER(full_name) AS full_name FROM students;
/*Hiển thị:
họ tên
số tuổi của sinh viên (dựa vào năm hiện tại)
*/
SELECT full_name,YEAR(CURRENT_DATE()) - birth_year AS Age FROM students;

/*Hiển thị:
điểm trung bình được làm tròn 1 chữ số thập phân
*/
SELECT full_name,ROUND(score,1) AS score FROM students;

/*
Hiển thị:
tổng số sinh viên
điểm cao nhất
điểm thấp nhất
*/
SELECT 
	COUNT(*) AS total_students,
    MAX(score) AS highest_score,
    MIN(score) AS lowest_score
FROM students;
