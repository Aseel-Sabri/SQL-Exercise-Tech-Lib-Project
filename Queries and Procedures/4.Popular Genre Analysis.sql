USE TechLib;

DECLARE @Month INT
SELECT @Month = 5 -- Change Month

SELECT TOP(1) b.Genre 
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
WHERE MONTH(l.DateBorrowed) = @Month
GROUP BY b.Genre
ORDER BY COUNT(b.Genre) DESC;