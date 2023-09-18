USE Tech_Lib;

DROP PROCEDURE IF EXISTS sp_BorrowerWithOverdues;
GO
CREATE PROCEDURE sp_BorrowersWithOverdues
AS BEGIN
	-- I don't really see any value of using the temp table
	SELECT DISTINCT Borrowers.* INTO #Temp_Borrowers
	FROM Borrowers
	JOIN Loans ON Loans.Borrower_ID = Borrowers.Borrower_ID
	WHERE Loans.Date_Returned > Loans.Due_Date
	OR (Loans.Date_Returned IS NULL AND GETDATE() > Loans.Due_Date);
	
	SELECT #Temp_Borrowers.*, Loans.Book_ID
	FROM #Temp_Borrowers
	JOIN Loans
	-- The conditions are also repeated here (:\)
	ON Loans.Borrower_ID = #Temp_Borrowers.Borrower_ID
	WHERE Loans.Date_Returned > Loans.Due_Date
	OR (Loans.Date_Returned IS NULL AND GETDATE() > Loans.Due_Date);
END;
GO
