USE TechLib;

GO
CREATE OR ALTER TRIGGER t_loans_update
ON Loans
INSTEAD OF UPDATE
AS BEGIN
	DECLARE @BookID INT;
	DECLARE @PreviousDateReturned DATE;
	DECLARE @CurrentDateReturned DATE;
	SELECT @BookID = BookID, @CurrentDateReturned = DateReturned FROM INSERTED;
	SELECT @PreviousDateReturned = DateReturned FROM DELETED;

	BEGIN TRAN T
		UPDATE Loans
		SET BookID = I.BookID, BorrowerID = I.BorrowerID,
			DateBorrowed = I.DateBorrowed, DueDate = I.DueDate,
			DateReturned = I.DateReturned
		FROM Loans L
		INNER JOIN Inserted I ON L.LoanID = I.LoanID;

		IF(@PreviousDateReturned IS NULL AND @CurrentDateReturned IS NOT NULL)
		BEGIN
			UPDATE Books
			SET CurrentStatus = 'Available'
			WHERE BookID = @BookID;
		END
	COMMIT TRAN T
END;
GO

GO
CREATE OR ALTER TRIGGER t_loans_insert
ON Loans
INSTEAD OF INSERT
AS BEGIN
	DECLARE @BookID INT;
	DECLARE @DateReturned DATE;
	SELECT @BookID = BookID, @DateReturned = DateReturned FROM INSERTED;

	BEGIN TRAN T
		INSERT INTO Loans
		SELECT BookID, BorrowerID, DateBorrowed, DueDate, DateReturned
		FROM Inserted;

		IF(@DateReturned IS NULL)
		BEGIN
			UPDATE Books
			SET CurrentStatus = 'Borrowed'
			WHERE BookID = @BookID;
		END
	COMMIT TRAN T
END;
GO