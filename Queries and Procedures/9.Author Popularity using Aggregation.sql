USE Tech_Lib;

SELECT Books.Author, RANK() OVER (ORDER BY COUNT(Books.Author)) AS Author_Rank
FROM Books
JOIN Loans
ON Books.Book_ID = Loans.Book_ID
GROUP BY Books.Author;
