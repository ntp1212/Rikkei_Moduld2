/*
Thực thể: couses, professors,students, 
couses : couseId(PK), couseName, decription, price,professorId
professors: professorId, professorsName, professorEmail
students: studentId, studentName, studentEmail, 
couseEnroll: studentId, courseId
*/
CREATE DATABASE Sec3_Ex5;
USE Sec3_Ex5;
CREATE TABLE professors(
professorId VARCHAR(20) PRIMARY KEY,
professorsName VARCHAR(20) NOT NULL,
professorEmail VARCHAR(20) UNIQUE NOT NULL
);
CREATE TABLE courses(
courseId VARCHAR(20) PRIMARY KEY,
courseName VARCHAR(20) NOT NULL,
decription TEXT NOT NULL,
price INT NOT NULL,
professorId VARCHAR(20) NOT NULL,
FOREIGN KEY (professorId)
	REFERENCES professors(professorId)
);
CREATE TABLE students(
studentId VARCHAR(20) PRIMARY KEY,
studentName VARCHAR(20) NOT NULL,
studentEmail VARCHAR(20) UNIQUE NOT NULL
);
CREATE TABLE couseEnroll(
studentId VARCHAR(20),
courseId VARCHAR(20),
PRIMARY KEY (studentId,courseId),
FOREIGN KEY (studentId)
	REFERENCES students(studentId),
FOREIGN KEY (courseId)
	REFERENCES courses(courseId)
);
DROP TABLE courses;
DROP TABLE professors;
DROP TABLE students;
DROP TABLE couseEnroll;