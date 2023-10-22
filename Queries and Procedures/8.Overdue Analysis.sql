USE TechLib;

SELECT BookID, BorrowerID
FROM Loans
WHERE DATEDIFF(DAY, DueDate, ISNULL(DateReturned, GETDATE())) > 30
ORDER BY BookID;
