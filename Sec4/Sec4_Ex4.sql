CREATE DATABASE Sec4_Ex4;
USE Sec4_Ex4;

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
VALUES ('SV003','Nguyen Van C','2000-4-15','Other','c@gmail.com');
INSERT INTO students 
VALUES ('SV004','Nguyen Duy D','2000-1-1','Male',NULL);
INSERT INTO students 
VALUES ('SV005','Nguyen Thi E','1998-10-18','Female',NULL);
INSERT INTO students 
VALUES ('SV006','Nguyen Thu F','1995-12-24','Other','f@gmail.com');


DROP TABLE students;

SELECT * FROM students
WHERE email IS NULL;
SELECT * FROM students
WHERE email IS NOT NULL;
SELECT * FROM students
WHERE full_name LIKE 'Ng%';
SELECT * FROM students
WHERE gender <> 'Male';

