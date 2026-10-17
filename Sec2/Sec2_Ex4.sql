CREATE SCHEMA Sec2_Ex4;
CREATE TABLE users(
userId VARCHAR(20) PRIMARY KEY,
loginName VARCHAR(20) UNIQUE,
password VARCHAR(18) NOT NULL,
status VARCHAR(8) DEFAULT 'Active' 
	CHECK(status IN ('Active','Inactive'))
);