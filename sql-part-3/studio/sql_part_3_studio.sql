/* SQL PART 3 STUDIO
Dataset = BooksDB
Business Issue

Part 1: March - Women's History Month, National Pie Day 3/14, St. Patrick's Day 3/17, Season - Spring
Event 1: Women's History Month */
--tags table (tag id, tag name), book_tags table (count)

SELECT t.tag_name as tag_name,
t.tag_id as tag_id,
SUM(bt.[count]) as tag_usage
from BooksDB.dbo.book_tags as bt
INNER JOIN BooksDB.dbo.tags as t ON bt.tag_id = t.tag_id
WHERE t.tag_name like '%woman%'
    OR t.tag_name LIKE '%female%'
    OR t.tag_name LIKE '%feminism%'
GROUP BY t.tag_id, t.tag_name
HAVING SUM(bt.[count]) > 50
ORDER BY tag_usage DESC


--Event 2: Choose another event from March/Spring

-- books (authors, titles, ratings) book tag (tag id)

SELECT books.authors as authors, books.title as title, books.average_rating as rating, bt.tag_id as tag_id, t.tag_name as tag 
from BooksDB.dbo.books as books
INNER JOIN BooksDB.dbo.book_tags as bt ON books.book_id = bt.goodreads_book_id
INNER JOIN BooksDB.dbo.tags as t on bt.tag_id = t.tag_id
WHERE t.tag_name LIKE '%pie %'
    OR t.tag_name LIKE '%baking%'
ORDER BY books.average_rating DESC





--Part 2: Choose another month
--1) October
--2) Halloween, National Coffee Day

--Part 3: Summarize your work
--Event 1
-- I chose Halloween as my first October event. I wanted to showcase spooky and haunted stories that are highly-rated.
SELECT b.authors as authors, b.title as title, b.average_rating as rating, t.tag_name as tag_name
from BooksDB.dbo.books as b
INNER JOIN BooksDB.dbo.book_tags as bt ON b.book_id = bt.goodreads_book_id
INNER JOIN BooksDB.dbo.tags as t ON bt.tag_id = t.tag_id
WHERE t.tag_name like '%halloween%'
    or t.tag_name like '%spooky%'
    or t.tag_name like '%haunted%'
    or t.tag_name like '%ghost%'
GROUP BY b.authors, b.title, b.average_rating, t.tag_name
HAVING b.average_rating> 4
ORDER BY average_rating DESC

--Event 2
-- MY second October event is National Coffee Day. For this day I looked for books about coffee, or coffee table books.
SELECT b.authors as authors, b.title as title, b.average_rating as rating, t.tag_name as tag_name
FROM BooksDB.dbo.books as b
INNER JOIN BooksDB.dbo.book_tags as bt ON b.book_id = bt.goodreads_book_id
INNER JOIN BooksDB.dbo.tags as t ON bt.tag_id = t.tag_id
WHERE t.tag_name LIKE '%coffee%'
    OR t.tag_name LIKE '%espresso%'
ORDER BY average_rating DESC;