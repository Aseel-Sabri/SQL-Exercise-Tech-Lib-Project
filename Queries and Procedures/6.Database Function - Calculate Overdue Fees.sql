USE TechLib;

GO
CREATE OR ALTER FUNCTION fn_CalculateOverdueFees
(@LoanID INT)
RETURNS INT AS
BEGIN
	DECLARE @Fees INT;
	DECLARE @LateDays INT;

	SELECT @LateDays = DATEDIFF(day, DueDate, ISNULL(DateReturned, GETDATE()))
	FROM Loans
	WHERE LoanID = @LoanID;

	SELECT @Fees = 
		(SELECT MAX(Overdue.TotalDays) FROM (VALUES (@LateDays), (0)) AS Overdue(TotalDays)) 
		+ (SELECT MAX(Overdue.ExtraDays) FROM (VALUES (@LateDays - 30), (0)) AS Overdue(ExtraDays));

	RETURN @Fees;
END;
GO


