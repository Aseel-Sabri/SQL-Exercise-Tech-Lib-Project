USE TechLib;

WITH ActiveBorrowers AS
(
	SELECT BorrowerID 
	FROM Loans
	WHERE DateReturned IS NULL
	GROUP BY BorrowerID
	HAVING COUNT(BorrowerID) > 1
)
SELECT b.BorrowerID, b.FirstName, b.LastName, b.Email
FROM Borrowers b
JOIN ActiveBorrowers ab ON b.BorrowerID = ab.BorrowerID