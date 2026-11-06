CREATE DATABASE Sec10_Ex4;
USE Sec10_Ex4;
-- DROP DATABASE Sec10_Ex4;
-- Tạo bảng employees
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
);

-- Tạo bảng salary_log (lưu lịch sử thay đổi lương)
CREATE TABLE salary_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
INSERT INTO employees (first_name, last_name, salary, email, phone_number) VALUES 
('An', 'Nguyen Van', 12000.00, 'an.nguyen@email.com', '0901111111'),
('Binh', 'Tran Thi', 15000.00, 'binh.tran@email.com', '0902222222'),
('Cuong', 'Le Van', 11000.00, 'cuong.le@email.com', '0903333333'),
('Dung', 'Pham Thi', 18000.00, 'dung.pham@email.com', '0904444444'),
('Hieu', 'Hoang Van', 13500.00, 'hieu.hoang@email.com', '0905555555'),
('Linh', 'Vu Thi', 14500.00, 'linh.vu@email.com', '0906666666'),
('Minh', 'Bui Van', 16000.00, 'minh.bui@email.com', '0907777777'),
('Nga', 'Dang Thi', 12500.00, 'nga.dang@email.com', '0908888888'),
('Phuc', 'Ngo Van', 17000.00, 'phuc.ngo@email.com', '0909999999'),
('Quynh', 'Do Thi', 15500.00, 'quynh.do@email.com', '0900000000');
DELIMITER //

CREATE TRIGGER trg_after_update_salary
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    -- Chỉ ghi lịch sử khi mức lương thực sự có sự thay đổi
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log (employee_id, old_salary, new_salary, change_date)
        VALUES (OLD.id, OLD.salary, NEW.salary, NOW());
    END IF;
END //

DELIMITER ;

-- Cập nhật lương cho nhân viên có id = 1 (tăng từ 12000 lên 14000)
UPDATE employees SET salary = 14000.00 WHERE id = 1;

-- Kiểm tra xem lịch sử thay đổi lương đã được tự động ghi vào bảng salary_log chưa
SELECT * FROM salary_log;
