-- DROP DATABASE Sec8_Ex6;
CREATE DATABASE Sec8_Ex6;
USE Sec8_Ex6;

CREATE TABLE employees (
emp_id  VARCHAR(20) PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(6),
salary DECIMAL(15,2) NOT NULL
);
DELIMITER $$

CREATE PROCEDURE sp_classify_student(
    IN avg_score DECIMAL(4,2),
    OUT academic_rank VARCHAR(50)
)
BEGIN
    -- Khai báo biến trung gian
    DECLARE temp_rank VARCHAR(50);

    -- Phân loại học lực bằng CASE
    SET temp_rank = CASE
        WHEN avg_score >= 8.0 THEN 'Giỏi'
        WHEN avg_score >= 6.5 THEN 'Khá'
        WHEN avg_score >= 5.0 THEN 'Trung bình'
        ELSE 'Yếu'
    END;

    -- Gán kết quả cho tham số OUT
    SET academic_rank = temp_rank;

END $$

DELIMITER ;
CALL sp_classify_student(8.5, @result);
SELECT @result;