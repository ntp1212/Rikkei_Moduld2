CREATE DATABASE Sec5_Ex2;
USE Sec5_Ex2;
CREATE TABLE employees (
emp_id  VARCHAR(20) PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(6),
salary DECIMAL(15,2) NOT NULL
);
DROP TABLE employees;
INSERT INTO employees
VALUES ('EMP001','Nguyễn Thị H','HR','5000000');
INSERT INTO employees
VALUES ('EMP002','Nguyễn Duy K','QA','12000000');
INSERT INTO employees
VALUES ('EMP003','Nguyễn Van T','QA','14000000');
INSERT INTO employees
VALUES ('EMP004','Nguyễn Thị N','HR','8000000');
INSERT INTO employees
VALUES ('EMP005','Trần Thị KH','IT','9000000');
INSERT INTO employees
VALUES ('EMP006','Nguyễn Thị H','IT','10000000');
INSERT INTO employees
VALUES ('EMP007','Trần Duy Kh','DI','16000000');
INSERT INTO employees
VALUES ('EMP008','Nguyễn Thu A','DI','24000000');
INSERT INTO employees
VALUES ('EMP009','Nguyễn Ngoc J','HR','21000000');
INSERT INTO employees
VALUES ('EMP010','Nguyễn Thị B','QC','14000000');
INSERT INTO employees
VALUES ('EMP011','Nguyễn Van C','IT','20000000');
INSERT INTO employees
VALUES ('EMP012','Nguyễn Van R','IT','20000000');
/*Thống kê:
mỗi phòng ban có bao nhiêu nhân viên*/
SELECT department, COUNT(*) AS total_employees
 FROM employees
 GROUP BY department;
/*Tính:
mức lương trung bình của từng phòng ban*/
SELECT department, AVG(salary) AS avarege_salary
FROM employees
GROUP BY department;
/*Chỉ hiển thị:
các phòng ban có trên 3 nhân viên*/
SELECT department, COUNT(*) AS total_employees
 FROM employees
 GROUP BY department
 HAVING total_employees > 3 
 ORDER BY total_employees ASC;
/*Chỉ hiển thị:
các phòng ban có lương trung bình lớn hơn 12.000.000*/
SELECT department, AVG(salary) AS avarege_salary
FROM employees
GROUP BY department
HAVING avarege_salary > 12000000;
