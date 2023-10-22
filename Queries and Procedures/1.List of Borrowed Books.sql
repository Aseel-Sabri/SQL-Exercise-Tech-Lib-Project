USE TechLib;

DECLARE @BorrowerID INT;
SELECT  @BorrowerID = 10; -- Change ID

SELECT DISTINCT b.* 
FROM Books b
JOIN Loans l ON l.BookID = b.BookID
WHERE l.BorrowerID = @BorrowerID;