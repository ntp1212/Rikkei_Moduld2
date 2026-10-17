CREATE SCHEMA Sec2_Ex5;
CREATE TABLE classes(
classId VARCHAR(20) PRIMARY KEY,
classsName VARCHAR(20) NOT NULL,
studyYear VARCHAR(10) NOT NULL
);

CREATE TABLE students(
studentId VARCHAR(20) PRIMARY KEY,
fullName VARCHAR(30) NOT NULL,
dateOfBirth DATE NOT NULL,
gender VARCHAR(6) CHECK(gender IN('male','female')),
classID VARCHAR(20) NOT NULL,
FOREIGN KEY (classID)
	REFERENCES classes(classID)
);