--SQL Part 3 Exercises

--1. Exploring a LEFT JOIN using the books and to_read tables
--Part A: Look at Query 1, which table is the 'left' table and which is the 'right'?
SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
ORDER BY b.average_rating;
--Left table is b.best_book_id, Right table is Books.DB.dbo.to_read

--Part B: When we added a WHERE tr.user_id IS NOT NULL clause, how did the table change? Why?
SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
WHERE tr.user_id IS NOT NULL
ORDER BY b.average_rating;
--Adding a WHERE clause removed titles that had a null user ID (tr table).

--2. Exploring RIGHT joins with the books and to_read tables
--Part A: Looking at the query, which table is the 'left' and which is the 'right'?
-- Query 1: RIGHT JOIN
SELECT TOP 300 b.title, b.average_rating, b.books_count, tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
RIGHT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id;
--The Left table is books and the right table is to_read

--Part B: How do the RIGHT-joined tables differ from the LEFT-joined tables in Question 1?
--There are no null values from the to_read table in question 2, whereas question 1 did have null values in that table

--3. Exploring FULL JOINS with the books and to_read tables
--Part A: Based on your exploration, can you think of when you might want a FULL join rather than a LEFT, RIGHT, or INNER?
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
FULL JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
WHERE tr.book_id IS NOT NULL
--After manipulating the query, I found that using IS NOT NULL on different tables in the FULL JOIN allows me to essentially switch between a LEFT and a RIGHT JOIN. 

--4. Exploring INNER joins with the books and to_read tables
--Part A: What does an inner join do?
--An inner join produces a result that includes only values that are present in both tables.

--Part B. Currently this table has an IS NOT NULL in the WHERE clause. Is this necessary for this table?
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
WHERE b.title IS NOT NULL
ORDER BY tr.book_id;
--Since the inner join only includes non-null values in both tables, an IS NOT NULL clause is not necessary. 

--Part C: Rewrite the inner join query so that it contains no redundant code.
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
ORDER BY tr.book_id;

--5. Using joins to find the most tagged book and the most popular tag
--Part A: What is the most tagged book?
SELECT bk.title as title, SUM(bt.[count]) as "tag count"
from BooksDB.dbo.books as bk
INNER JOIN BooksDB.dbo.book_tags as bt ON bk.best_book_id = bt.goodreads_book_id
GROUP BY title
ORDER BY [tag count] DESC 
--Harry Potter & the Sorcerer's Stone with 786,374 tags

--Part B: How many different tags have been used for the most tagged book?
SELECT bt.tag_id as tag_id, bt.[count] as "tag_count"
from BooksDB.dbo.books as bk
INNER JOIN BooksDB.dbo.book_tags as bt ON bk.best_book_id = bt.goodreads_book_id
WHERE bk.title LIKE '%Harry Potter and the Sorcerer%s Stone%'
ORDER BY tag_count DESC
-- The most used tag ID for Harry Potter #1 is 30574, used 496,107 times

-- Part C: What is this particular tag? (tagID 30574)
SELECT t.tag_id as tag_id, t.tag_name as tag_name
from BooksDB.dbo.tags as t
WHERE tag_id = 30574;
-- The most used tag for Harry Potter #1 (tagID 30574) is to-read

--6. Find a book based on the tag of your choice using joins
--Part A: Tag of choice: magic
SELECT tag_name, tag_id 
FROM BooksDB.dbo.tags
WHERE tag_name LIKE '%magic%';
-- magic-world, 18912

SELECT bk.title as title, bt.tag_id as tag_id, bt.[count] as "tag count"
from BooksDB.dbo.books as bk
INNER JOIN BooksDB.dbo.book_tags as bt ON bk.best_book_id = bt.goodreads_book_id
WHERE tag_id = 18912
ORDER BY [tag count] DESC
-- Ender's Game, Volume 1: Battle School, tag count of 1 (Results show 4 titles all with 1 tag count, but this one showed up first and is one of my fav books!)

--7: What are the top 10 most popular book titles on the 'to read' list?
-- Part A: I would use book_id as the key
--Part B: Group popluarity based on the title based on users
-- books table (title, bookID), to_read table (userID, bookID)
SELECT bk.title as title, COUNT(tr.[user_id]) as user_count
from BooksDB.dbo.to_read as tr
INNER JOIN BooksDB.dbo.books as bk ON tr.book_id = bk.book_id
GROUP BY title
ORDER BY user_count DESC;

-- 8. Largest 'To-Read' lists
-- Part A: Top 10 users with most number of titles on their 'to-read' list
SELECT top 10 tr.[user_id] as [user_id], COUNT(b.title) as title_count
FROM BooksDB.dbo.to_read as tr
INNER JOIN BooksDB.dbo.books AS b ON tr.book_id = b.book_id
GROUP BY [user_id]
ORDER BY title_count DESC;

-- Part B: UserID 14771
SELECT tr.[user_id] as [user_id], b.title as title 
from BooksDB.dbo.to_read as tr
INNER JOIN BooksDB.dbo.books as b ON tr.book_id = b.book_id
WHERE tr.[user_id] = 14771;















