/*
Thực thể: users
users : userId(PK), userName, password, signupDate
*/
CREATE DATABASE Sec3_Ex4;
USE Sec3_Ex4;
CREATE TABLE users(
userId VARCHAR(20) PRIMARY KEY,
usersName VARCHAR(20) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
password VARCHAR(20) NOT NULL,
signupDate DATE NOT NULL,
status VARCHAR(15) DEFAULT 'active'
);
ALTER TABLE users 
	ADD CHECK (status IN ('active', 'inactive'));
DROP TABLE users;