USE Tech_Lib;

DROP FUNCTION IF EXISTS fn_CalculateOverdueFees;
GO
CREATE FUNCTION fn_CalculateOverdueFees
(@LoanID INT)
RETURNS INT AS
BEGIN
	DECLARE @Fees INT;
	DECLARE @Late_Days INT;

	IF ((SELECT Date_Returned FROM Loans WHERE Loans.Loan_ID = @LoanID) IS NULL)
		SELECT @Late_Days=DATEDIFF(day, Due_Date, GETDATE()) FROM Loans
		WHERE Loans.Loan_ID = @LoanID;
	ELSE
		SELECT @Late_Days=DATEDIFF(day, Due_Date, Date_Returned) FROM Loans
		WHERE Loans.Loan_ID = @LoanID;


	IF (@Late_Days < 0)
		SET @Fees = 0;
	ELSE IF (@Late_Days > 30)
		SET @Fees = 30 + (@Late_Days - 30) * 2;
	ELSE 
		SET @Fees = @Late_Days;

	RETURN @Fees;
END;
GO