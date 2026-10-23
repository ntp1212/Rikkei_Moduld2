CREATE DATABASE Sec4_Ex1;
USE Sec4_Ex1;

CREATE TABLE students (
student_id VARCHAR(20) PRIMARY KEY,
full_name VARCHAR(50) NOT NULL,
birth_date DATE,
gender VARCHAR(6) NOT NULL,
email VARCHAR(100) UNIQUE
);
/*
Thêm ít nhất 5 sinh viên vào bảng students
Trong số đó:
Có ít nhất 1 sinh viên chưa có email
Viết câu lệnh SELECT để:
Hiển thị toàn bộ danh sách sinh viên
Chỉ hiển thị các cột: mã sinh viên, họ tên, email
*/

INSERT INTO students 
VALUES ('1','Nguyen Thi A','2000-1-1','Female','a@gmail.com');
INSERT INTO students 
VALUES ('2','Nguyen Thi B','1998-6-1','Female','b@gmail.com');
INSERT INTO students 
VALUES ('3','Nguyen Van C','2000-4-15','Male','c@gmail.com');
INSERT INTO students 
VALUES ('4','Nguyen Duy D','2000-1-1','Male',NULL);
INSERT INTO students 
VALUES ('5','Nguyen Thi E','1998-10-18','Female',NULL);
INSERT INTO students 
VALUES ('6','Nguyen Thu F','1995-12-24','Female','f@gmail.com');
SELECT * FROM students;
SELECT student_id,full_name,email FROM students;
