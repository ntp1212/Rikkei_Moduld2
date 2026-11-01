-- DROP DATABASE Sec8_Ex3;
CREATE DATABASE Sec8_Ex3;
USE Sec8_Ex3;

CREATE TABLE employees (
	employee_id VARCHAR(100) PRIMARY KEY,
   employee_name VARCHAR(100) NOT NULL,
   salary DECIMAL(10,2) NOT NULL
);
INSERT INTO employees
VALUES ('EMP001','Nguyễn Thị H','5000000');
INSERT INTO employees
VALUES ('EMP002','Nguyễn Duy K','12000000');
INSERT INTO employees
VALUES ('EMP003','Nguyễn Van T','14000000');
DROP PROCEDURE sp_get_avg_salary;
DELIMITER $$
CREATE PROCEDURE sp_get_avg_salary()
BEGIN 
	DECLARE avg_salary  DECIMAL(10,2);
	SELECT AVG(salary) INTO avg_salary FROM employees;
    SELECT avg_salary AS avarage_salary;
END $$
DELIMITER ;
CALL sp_get_avg_salary()

