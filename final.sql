CREATE DATABASE final_test;
USE  final_test;
-- DROP DATABASE  final_test;

CREATE TABLE courses(
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    department VARCHAR(100) NOT NULL,
    creation_date DATE 
);

DELIMITER $$
CREATE TRIGGER check_creation_date BEFORE INSERT 
ON courses FOR EACH ROW
BEGIN 
	IF NEW.creation_date > CURRENT_DATE() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Loi trigger: khong nhap ngay qua ngay hom nay';
    END IF;
END $$
DELIMITER ;

CREATE TABLE students(
student_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
major VARCHAR(100) NOT NULL,
phone_number VARCHAR(15) NOT NULL UNIQUE,
gpa DECIMAL(3,1) DEFAULT '4.0',
CONSTRAINT check_gpa CHECK (gpa > 0 AND gpa <= 4.0)
);
CREATE TABLE erollments(
enrollment_id INT PRIMARY KEY,
course_id INT NOT NULL,
student_id INT NOT NULL,
enroll_time DATETIME NOT NULL,
credits INT,
CHECK (credits > 0),
status VARCHAR(50) DEFAULT 'Pending',
FOREIGN KEY (student_id)
REFERENCES students(student_id),
FOREIGN KEY (course_id)
REFERENCES courses(course_id)
);
CREATE TABLE enrollment_details(
detail_id INT PRIMARY KEY,
enrollment_id INT ,
attendance_check VARCHAR(50) NOT NULL,
detail_date DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (enrollment_id)
REFERENCES erollments(enrollment_id)
);
CREATE TABLE academic_logs(
log_id INT PRIMARY KEY AUTO_INCREMENT,
enrollment_id INT,
student_id INT ,
log_time DATETIME NOT NULL,
note TEXT,
FOREIGN KEY (student_id)
REFERENCES students(student_id),
FOREIGN KEY (enrollment_id)
REFERENCES  erollments(enrollment_id)
);
-- Điền thông tin bảng
INSERT INTO courses(course_name,course_code,department,creation_date)
VALUES ('Lập trình JAVA','JAVA01','CNTT','2023-12-03'),
		('Cấu trúc dữ liệu','DSA02','Khoa học máy tính','1996-11-25'),
        ('Cơ sở dữ liệu','SQL03','CNTT','2001-09-30'),
        ('Mạng máy tính','NET04','Truyền thông','1998-01-19'),
        ('TRí tuệ nhân tạo','AI05','Khoa học máy tính','2000-09-30');
INSERT INTO students(full_name,major,phone_number,gpa)
VALUES ('Nguyễn Văn Hải','Hệ thống TT','0931112223','3.8'),
		('Trần Thu Hà','Kỹ Thuật PM','0932223334','4.0'),
        ('Lê Quốc Tuấn','An toàn TT','093333445','3.6'),
        ('Phạm Minh Châu','Dữ liệu lớn','0934445556','3.9'),
        ('Hoàng Gia Bảo','Kỹ Thuật PM','0935556667','3.7');
INSERT INTO erollments(enrollment_id,course_id,student_id,enroll_time,credits,status)
VALUES ('7001','1','1','2024-05-20 08:00','3','Pending'),
		('7002','2','2','2024-05-20 09:30','4','Completed'),
        ('7003','3','3','2024-05-20 10:15','3','Pending'),
        ('7004','4','5','2024-05-21 07:00','3','Completed'),
        ('7005','5','4','2024-05-21 08:45','4','Dropped');
INSERT INTO enrollment_details(detail_id,enrollment_id,attendance_check,detail_date)
VALUES ('8001','7002','Đủ điều kiện thi','2024-05-20 10:00'),
		('8002','7004','Vắng 1 buổi','2024-05-21 08:00'),
        ('8003','7001','Đang học','2024-05-20 11:00'),
        ('8004','7003','Nghỉ phép','2024-05-20 11:00'),
        ('8005','7005','Không đi học','2024-05-21 09:00');
INSERT INTO academic_logs(enrollment_id,student_id,log_time,note)
VALUES ('7001','1','2024-05-20 09:05','Bắt đầu lớp học'),
		('7002','2','2024-05-20 10:05','Hoàn tất môn học'),
        ('7003','3','2024-05-20 11:10','Đang sắp xếp lịch bù'),
        ('7004','4','2024-05-21 08:10','Chờ phê duyệt điểm'),
        ('7005','5','2025-05-21 09:05','Hủy do vắng quá số buổi');
-- câu 2: Update & delete
-- Update
SET SQL_SAFE_UPDATES = 0;
UPDATE erollments e
JOIN courses c ON e.course_id = c.course_id
SET credits = credits + 1 
WHERE status = 'Completed' AND YEAR(c.creation_date ) < 2000;
-- DELETE 
DELETE FROM academic_logs WHERE log_time < '2024-05-20 00:00';
SELECT * FROM academic_logs;
SET SQL_SAFE_UPDATES = 1;
-- Phần 3: Truy vấn cơ bản
-- Câu 1: Liệt kê các thông tin sinh viên gồm full_name, major và gpa của những sinh viên có gpa > 3.8 hoặc thuộc chuyên ngành kĩ thuật PM
SELECT full_name, major, gpa FROM students
WHERE gpa > 3.8 OR major = 'Kỹ Thuật PM';
-- Câu 2: Liệt kê các thông tin môn học gồm course_name và course_code của những môn học và có ngày tạo từ 1998-01-01 đến 2001-12-31 và mã học phần bằng A
SELECT course_name, course_code FROM courses
WHERE creation_date BETWEEN '1998-01-01' 
AND '2001-12-31' 
AND course_code LIKE 'A%';
-- Câu 3: Liệt kê các bản ghi đk học gồm ẻnollment_id, ẻnoll_time, credits d=trong đó danh
-- sách được sắp xếp theo số tín chỉ giảm dần và hiển thị 2 bản ghi ở trang thứ 2
SELECT enrollment_id, enroll_time, credits FROM erollments
ORDER BY credits DESC
LIMIT 2
OFFSET 2;

