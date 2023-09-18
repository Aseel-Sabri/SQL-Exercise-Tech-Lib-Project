USE Tech_Lib;

DROP PROCEDURE IF EXISTS sp_BorrowedBooksReport;
GO
CREATE PROCEDURE sp_BorrowedBooksReport
(@StartDate DATE, @EndDate DATE)
AS BEGIN
	SELECT Books.Book_ID, Books.Title ,
		Loans.Date_Borrowed, 
		CONCAT(Borrowers.First_Name, ' ', Borrowers.Last_Name) AS Borrower_Name
	FROM Loans
	JOIN Books ON Loans.Book_ID = Books.Book_ID
	JOIN Borrowers ON Borrowers.Borrower_ID = Loans.Borrower_ID
	WHERE Date_Borrowed BETWEEN @StartDate AND @EndDate;
END;
GO


