-- Library Management System: sample data
USE LibraryManagement;

INSERT INTO Books (BookID, BookName, Author) VALUES
('B101', 'DBMS Concepts', 'Korth'),
('B102', 'Java Complete', 'Herbert Schildt'),
('B103', 'Python Basics', 'Mark Lutz');

INSERT INTO Members (MemberID, Name, Department) VALUES
(1, 'Rahul', 'CSE'),
(2, 'Anjali', 'ECE'),
(3, 'Sneha', 'IT');

-- The image shows 01-Jan and 03-Jan without a year.
-- The sample below uses 2026 as the year so DATE columns can be populated.
INSERT INTO Issue (IssueID, BookID, MemberID, IssueDate, ReturnDate) VALUES
(1, 'B101', 1, '2026-01-01', '2026-01-05'),
(2, 'B102', 2, '2026-01-03', NULL);
