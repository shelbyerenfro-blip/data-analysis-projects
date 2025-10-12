--A. Books Table
--Question 1
SELECT top 1000 *
FROM BooksDB.dbo.books

--Question 2
SELECT COUNT(title)
FROM BooksDB.dbo.books
--Yes, there are 10,000 titles

--Question 3
USE BooksDB
SELECT COUNT(original_publication_year)
FROM books
WHERE original_publication_year < 1800;
--There are 125 books published before 1800

--Question 4
SELECT distinct authors
FROM books

--Question 5
SELECT COUNT(language_code) AS books_in_english
FROM books
WHERE language_code LIKE 'en%'
--There are 8,730 books in English

--Question 6
SELECT COUNT(distinct title) AS world_war_1
FROM books
WHERE original_publication_year BETWEEN 1914 and 1921
--There were 39 books written during WW! era

--B. Book Tags Table
--Question 1
SELECT top 1000 *
FROM book_tags
ORDER BY tag_id

--Question 2
SELECT COUNT(goodreads_book_id), tag_id
FROM book_tags
GROUP BY tag_id

--Question 3
SELECT COUNT(goodreads_book_id) as book_id_count, tag_id
FROM book_tags
GROUP BY tag_id

--C. Ratings Table
--Question 1
SELECT top 1000*
FROM ratings
ORDER BY rating DESC

--Question 2
SELECT COUNT(DISTINCT [user_id]) as low_ratings
FROM ratings 
WHERE rating < 2 
--9.090 users gave ratings less than 2

--Question 3
SELECT COUNT(book_id) as high_ratings
from ratings
WHERE rating >=4
--650,327 books have a rating of 4 or higher

--D. Tags Table
--Question 1
SELECT *
FROM tags
WHERE tag_name LIKE '%mystery%'

--Question 2
SELECT *
FROM BooksDB.dbo.tags
WHERE tag_name < 'd' AND tag_name >= 'c';
--Tag names that begin with all versions of the letter c

--E. To Read Table
--Question 1
SELECT COUNT(user_id) AS total_books_to_read, [user_id]
FROM to_read
GROUP BY [user_id]
ORDER BY [user_id] ASC

--Question 2
SELECT COUNT(user_id) AS total_books_to_read, [user_id]
FROM to_read
GROUP BY [user_id]
ORDER BY total_books_to_read DESC