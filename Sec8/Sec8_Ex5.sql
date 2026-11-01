-- DROP DATABASE Sec8_Ex5;
CREATE DATABASE Sec8_Ex5;
USE Sec8_Ex5;

CREATE TABLE employees (
emp_id  VARCHAR(20) PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(6),
salary DECIMAL(15,2) NOT NULL
);

DELIMITER $$
CREATE PROCEDURE sp_check_employee_income(
			IN em_name VARCHAR(100),
            IN em_salary DECIMAL(25,2)
            )
BEGIN 
	DECLARE salary_comment  VARCHAR(100);
	IF (em_salary > 15000000) THEN 
		SET salary_comment = 'Thu nhập cao';
	ELSEIF (em_salary > 8.000000) THEN
		SET salary_comment = 'Thu nhập trung bình';
	ELSE
		SET salary_comment = 'Thu nhập thấp';
	END IF;
SELECT em_name AS employee_name, salary_comment AS comment;
END $$
DELIMITER ;

CALL sp_check_employee_income('A', 25000000);