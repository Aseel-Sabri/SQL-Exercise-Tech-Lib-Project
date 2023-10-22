USE TechLib;

GO
CREATE OR ALTER TRIGGER t_books_status_update
ON Books
AFTER UPDATE
AS BEGIN
	IF UPDATE (CurrentStatus) 
	BEGIN
		DECLARE @BookID INT;
		DECLARE @CurrentStatus VARCHAR(10);
		SELECT @BookID = BookID, @CurrentStatus = CurrentStatus FROM INSERTED;

		INSERT INTO AuditLog
		VALUES (@BookID, @CurrentStatus, GETDATE());
	END
END;
GO
