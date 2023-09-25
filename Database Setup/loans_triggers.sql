USE Tech_Lib;

DROP TRIGGER IF EXISTS t_loans_update;
GO
CREATE TRIGGER t_loans_update
ON Loans
INSTEAD OF UPDATE
AS BEGIN
	DECLARE @BookID INT;
	DECLARE @PreviousDateReturned DATE;
	DECLARE @CurrentDateReturned DATE;
	SELECT @BookID=Book_ID, @CurrentDateReturned=Date_Returned FROM INSERTED;
	SELECT @PreviousDateReturned=Date_Returned FROM DELETED;

	BEGIN TRAN T
		UPDATE Loans
		SET Book_ID=I.Book_ID, Borrower_ID=I.Borrower_ID,
			Date_Borrowed=I.Date_Borrowed, Due_Date=I.Due_Date,
			Date_Returned=I.Date_Returned
		FROM Loans L
		INNER JOIN Inserted I ON L.Loan_ID=I.Loan_ID;

		if(@PreviousDateReturned IS NULL AND @CurrentDateReturned IS NOT NULL)
		BEGIN
			UPDATE Books
			SET Current_Status='Available'
			WHERE Book_ID=@BookID;
		END
	COMMIT TRAN T
END;
GO

DROP TRIGGER IF EXISTS t_loans_insert;
GO
CREATE TRIGGER t_loans_insert
ON Loans
INSTEAD OF INSERT
AS BEGIN
	DECLARE @BookID INT;
	DECLARE @DateReturned DATE;
	SELECT @BookID=Book_ID, @DateReturned=Date_Returned FROM INSERTED;

	BEGIN TRAN T
		INSERT INTO Loans
		SELECT Book_ID, Borrower_ID, Date_Borrowed, Due_Date, Date_Returned
		FROM Inserted ;

		if(@DateReturned IS NULL)
		BEGIN
			UPDATE Books
			SET Current_Status='Borrowed'
			WHERE Book_ID=@BookID;
		END
	COMMIT TRAN T
END;
GO