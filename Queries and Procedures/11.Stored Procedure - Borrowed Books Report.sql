USE TechLib;

GO
CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport
(@StartDate DATE, @EndDate DATE)
AS BEGIN
	SELECT bk.BookID, bk.Title, l.DateBorrowed, 
		CONCAT(br.FirstName, ' ', br.LastName) AS BorrowerName
	FROM Loans l
	JOIN Books bk ON l.BookID = bk.BookID
	JOIN Borrowers br ON br.BorrowerID = l.BorrowerID
	WHERE DateBorrowed BETWEEN @StartDate AND @EndDate;
END;
GO
