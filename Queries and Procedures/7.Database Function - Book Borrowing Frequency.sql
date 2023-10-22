USE TechLib;

GO
CREATE OR ALTER FUNCTION fn_BookBorrowingFrequency
(@BookID INT)
RETURNS INT AS
BEGIN
	DECLARE @BorrowingFrequency INT;

	SELECT @BorrowingFrequency = COUNT(*) 
	FROM Loans
	GROUP BY BookID
	HAVING BookID = @BookID;

	SET @BorrowingFrequency = ISNULL(@BorrowingFrequency, 0);

	RETURN @BorrowingFrequency;
END;
GO

