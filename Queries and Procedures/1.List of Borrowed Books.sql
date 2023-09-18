USE Tech_Lib;

DECLARE @borrower_id INT;
SELECT  @borrower_id = 888; -- Change ID

SELECT DISTINCT Books.* FROM Books
JOIN Loans ON Loans.Book_ID = Books.Book_ID
WHERE Loans.Borrower_ID = @borrower_id;