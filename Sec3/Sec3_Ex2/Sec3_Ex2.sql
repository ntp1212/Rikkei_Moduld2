/*
Thực thể: books,readers,borrowings. borrowDetails
books: bookId(PK), bookName, author, publishYear, quality
readers: readerId(PK), readerName, phoneNumber, address
borrowings: borrowId(PK),readerId(PK), borrowDate, returnDate, borrowTotal 
borrowDetails: borrowId(PK),bookId(FK), borrowDate
*/
CREATE DATABASE Sec3_Ex2;
USE Sec3_Ex2;
CREATE TABLE books(
bookId VARCHAR(20) PRIMARY KEY,
bookName VARCHAR(250) NOT NULL,
author VARCHAR(100),
publishYear YEAR,
quality INT NOT NULL CHECK( quality > 0)
);
CREATE TABLE readers(
readerId VARCHAR(20) PRIMARY KEY,
readerName VARCHAR(250) NOT NULL,
phoneNumber INT NOT NULL,
address VARCHAR(250) NOT NULL
);
CREATE TABLE borrowings(
borrowId VARCHAR(20) PRIMARY KEY,
readerId VARCHAR(20),
borrowDate DATE NOT NULL,
returnDate DATE,
borrowTotal INT NOT NULL,
FOREIGN KEY (readerId)
	REFERENCES readers(readerId)
);
CREATE TABLE borrowDetails(
borrowId VARCHAR(20),
bookId VARCHAR(20),
PRIMARY KEY (borrowId, bookId),
FOREIGN KEY (bookId)
	REFERENCES books(bookId),
FOREIGN KEY (borrowId)
	REFERENCES borrowings(borrowId)
);
DROP TABLE borrowings;
DROP TABLE borrowDetails;
DROP TABLE readers;
DROP TABLE books;