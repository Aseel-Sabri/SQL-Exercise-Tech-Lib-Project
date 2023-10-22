USE TechLib;

GO
CREATE OR ALTER PROCEDURE sp_BorrowersWithOverdues
AS BEGIN
	-- I don't really see any value of using the temp table
	SELECT DISTINCT b.* INTO #TempBorrowers
	FROM Borrowers b
	JOIN Loans l ON l.BorrowerID = b.BorrowerID
	WHERE ISNULL(l.DateReturned, GETDATE()) > l.DueDate;
	
	SELECT temp.*, l.BookID
	FROM #TempBorrowers temp
	JOIN Loans l
	-- The conditions are also repeated here (:\)
	ON l.BorrowerID = temp.BorrowerID
	WHERE ISNULL(l.DateReturned, GETDATE()) > l.DueDate;
END;
GO

