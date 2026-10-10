-- Library Management System: task queries
-- MySQL 8.0+
USE LibraryManagement;

-- 1. Find overdue books.
-- Assumption: the loan period is 14 days. A book is overdue when it
-- has not been returned and its issue date is more than 14 days ago.
SELECT b.BookID, b.BookName, i.IssueID, m.Name AS BorrowedBy, i.IssueDate
FROM Issue AS i
JOIN Books AS b ON b.BookID = i.BookID
JOIN Members AS m ON m.MemberID = i.MemberID
WHERE i.ReturnDate IS NULL
  AND i.IssueDate < CURRENT_DATE - INTERVAL 14 DAY;

-- 2. Find books that have never been issued.
SELECT b.BookID, b.BookName, b.Author
FROM Books AS b
LEFT JOIN Issue AS i ON i.BookID = b.BookID
WHERE i.BookID IS NULL;

-- 3. Find the member(s) who borrowed the maximum number of books.
-- Counts all issue records, including books already returned.
SELECT m.MemberID, m.Name, COUNT(i.IssueID) AS BooksBorrowed
FROM Members AS m
JOIN Issue AS i ON i.MemberID = m.MemberID
GROUP BY m.MemberID, m.Name
HAVING COUNT(i.IssueID) = (
    SELECT MAX(book_count)
    FROM (
        SELECT COUNT(*) AS book_count
        FROM Issue
        GROUP BY MemberID
    ) AS member_counts
);

-- 4. Find the most popular book (or books if there is a tie).
SELECT b.BookID, b.BookName, COUNT(i.IssueID) AS TimesIssued
FROM Books AS b
JOIN Issue AS i ON i.BookID = b.BookID
GROUP BY b.BookID, b.BookName
HAVING COUNT(i.IssueID) = (
    SELECT MAX(issue_count)
    FROM (
        SELECT COUNT(*) AS issue_count
        FROM Issue
        GROUP BY BookID
    ) AS book_counts
);

-- 5. Count available books.
-- A book is considered available if it has never been issued, or its
-- latest issue has been returned and it has no active issue.
SELECT COUNT(*) AS AvailableBooks
FROM Books AS b
WHERE NOT EXISTS (
    SELECT 1
    FROM Issue AS i
    WHERE i.BookID = b.BookID
      AND i.ReturnDate IS NULL
);
