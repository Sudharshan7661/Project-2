-- Library Management System: table creation
-- MySQL 8.0+

CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

CREATE TABLE Books (
    BookID VARCHAR(10) PRIMARY KEY,
    BookName VARCHAR(150) NOT NULL,
    Author VARCHAR(100) NOT NULL
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL
);

CREATE TABLE Issue (
    IssueID INT PRIMARY KEY,
    BookID VARCHAR(10) NOT NULL,
    MemberID INT NOT NULL,
    IssueDate DATE NOT NULL,
    ReturnDate DATE NULL,
    CONSTRAINT fk_issue_book
        FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_issue_member
        FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
