CREATE DATABASE Sec4_Ex2;
USE Sec4_Ex2;

CREATE TABLE students (
student_id VARCHAR(20) PRIMARY KEY,
full_name VARCHAR(50) NOT NULL,
birth_date DATE,
gender VARCHAR(6) NOT NULL,
email VARCHAR(100) UNIQUE
);
INSERT INTO students 
VALUES ('SV001','Nguyen Thi A','2000-1-1','Female','a@gmail.com');
INSERT INTO students 
VALUES ('SV002','Nguyen Thi B','1998-6-1','Female','b@gmail.com');
INSERT INTO students 
VALUES ('SV003','Nguyen Van C','2000-4-15','Male','c@gmail.com');
INSERT INTO students 
VALUES ('SV004','Nguyen Duy D','2000-1-1','Male',NULL);
INSERT INTO students 
VALUES ('SV005','Nguyen Thi E','1998-10-18','Female',NULL);
INSERT INTO students 
VALUES ('SV006','Nguyen Thu F','1995-12-24','Female','f@gmail.com');
UPDATE students
SET email = 'd@gmail.com'
WHERE student_id = 'SV004';
UPDATE students
SET email = 'e@gmail.com'
WHERE student_id = 'SV005';
UPDATE students
SET gender = 'Male'
WHERE student_id = 'SV005';
DELETE FROM students
WHERE student_id ='SV003';
SELECT * FROM students;
SELECT student_id,full_name,email FROM students;