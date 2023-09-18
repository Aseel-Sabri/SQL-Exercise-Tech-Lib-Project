USE Tech_Lib;

DECLARE @month INT
SELECT @month = 5 -- Change Month

SELECT TOP(1) Books.Genre FROM Books
JOIN Loans ON Books.Book_ID = Loans.Book_ID
WHERE MONTH(Loans.Date_Borrowed) = @month
GROUP BY Books.Genre
ORDER BY COUNT(Books.Genre) DESC;