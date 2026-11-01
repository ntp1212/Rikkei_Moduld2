CREATE DATABASE Sec8_Ex1;
USE Sec8_Ex1;

CREATE TABLE students(
	student_id VARCHAR(100) PRIMARY KEY,
    student_name VARCHAR(100)  NOT NULL,
	class VARCHAR(100) NOT NULL
);
DELIMITER $$
CREATE PROCEDURE sp_get_all_students()
BEGIN 
			SELECT * FROM students;
END $$
DELIMITER ;

CALL sp_get_all_students();