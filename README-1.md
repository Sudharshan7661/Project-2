# Library Management System (SQL)

This folder contains the SQL solution for the Library Management System question.

## Files

1. `01_tables.sql` — creates the database and the `Books`, `Members`, and `Issue` tables.
2. `02_insertion.sql` — inserts the sample books, members, and issue records from the question.
3. `03_queries.sql` — contains queries for all five tasks.

## How to run

Run the files in this order in MySQL 8.0+:

1. `01_tables.sql`
2. `02_insertion.sql`
3. `03_queries.sql`

You can run each file in MySQL Workbench or the MySQL command-line client.

## Assumptions

- The image does not specify a year for `01-Jan` and `03-Jan`; the sample inserts use 2026.
- The schema does not include a due date, so the overdue query assumes a 14-day loan period.
- A book is available when it does not currently have an unreturned issue record.
- The maximum-borrowed-member and most-popular-book queries return ties if more than one member/book shares the maximum count.

## Tasks covered

- Find overdue books.
- Find books never issued.
- Find member(s) who borrowed the maximum number of books.
- Find the most popular book.
- Count available books.
