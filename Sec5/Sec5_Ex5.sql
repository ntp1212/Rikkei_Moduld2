CREATE DATABASE Sec5_Ex5;
USE Sec5_Ex5;
CREATE TABLE scores (
student_id VARCHAR(20),
subject_name VARCHAR(100) NOT NULL,
score DECIMAL(4,2) NOT NULL
);
DROP TABLE scores;
INSERT INTO scores
VALUES ('SV001','Math','8.2');
INSERT INTO scores
VALUES ('SV002','Math','5.6');
INSERT INTO scores
VALUES ('SV003','Math','7.5');
INSERT INTO scores
VALUES ('SV001','Biology','6.5');
INSERT INTO scores
VALUES ('SV002','Biology','9.0');
INSERT INTO scores
VALUES ('SV001','Art','8.3');
INSERT INTO scores
VALUES ('SV003','Art','7.62');
INSERT INTO scores
VALUES ('SV004','Physics','9.1');
/*Tính điểm trung bình của mỗi sinh viên
*/
SELECT
    student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id;
/*
Chỉ hiển thị các sinh viên có:
điểm trung bình ≥ 7.0
*/
SELECT
    student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 7.0;
/*
Hiển thị sinh viên có:
điểm trung bình cao nhất trong toàn bộ danh sách
*/
SELECT
    student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) = (
    SELECT MAX(avg_score)
    FROM (
        SELECT AVG(score) AS avg_score
        FROM scores
        GROUP BY student_id
    ) AS student_avg
);
/*
Hiển thị các sinh viên có:
điểm trung bình cao hơn điểm trung bình chung của tất cả sinh viên
*/
SELECT
    student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) > (
    SELECT AVG(score)
    FROM scores
);