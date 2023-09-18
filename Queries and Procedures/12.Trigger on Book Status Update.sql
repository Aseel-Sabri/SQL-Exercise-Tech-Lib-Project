USE Tech_Lib;

DROP TRIGGER IF EXISTS t_books_status_update;
GO
CREATE TRIGGER t_books_status_update
ON Books
AFTER UPDATE
AS BEGIN
	DECLARE @BookID INT;
	DECLARE @CurrentStatus VARCHAR(10);
	DECLARE @PreviousState VARCHAR(10);
	SELECT @BookID=Book_ID, @CurrentStatus = Current_Status FROM INSERTED;
	SELECT @PreviousState = Current_Status FROM DELETED;

	if(@CurrentStatus <> @PreviousState)
	BEGIN
		INSERT INTO AuditLog
		VALUES (@BookID, CONCAT(@PreviousState, ' to ', @CurrentStatus), GETDATE());
	END
END;
GO
