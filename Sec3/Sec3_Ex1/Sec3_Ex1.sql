/*
thực thể: classes, students
classes: classID, className, totalStudents
students: studentId, StudentName, classId, phoneNumber
*/



CREATE DATABASE Sec3_Ex1;
USE Sec3_Ex1;

CREATE TABLE classes(
classId VARCHAR(20) PRIMARY KEY,
className VARCHAR(20) UNIQUE NOT NULL,
totalStudents INT NOT NULL
);
CREATE TABLE students(
studentId VARCHAR(20) PRIMARY KEY,
studentName VARCHAR(20) UNIQUE NOT NULL,
classId VARCHAR(20) NOT NULL,
FOREIGN KEY (classID)
	REFERENCES classes(classId)
);

