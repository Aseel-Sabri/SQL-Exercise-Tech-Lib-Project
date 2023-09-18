USE Tech_Lib;

DROP FUNCTION IF EXISTS fn_BookBorrowingFrequency;
GO
CREATE FUNCTION fn_BookBorrowingFrequency
(@BookID INT)
RETURNS INT AS
BEGIN
	DECLARE @freq INT;

	SELECT @freq=Count(*) 
	FROM Loans
	GROUP BY Book_ID
	HAVING Book_ID = @BookID;

	IF (@freq is null)
		SET @freq = 0;

	RETURN @freq;
END;
GO
