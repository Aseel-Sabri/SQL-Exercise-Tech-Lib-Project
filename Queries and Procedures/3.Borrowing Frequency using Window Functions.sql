USE TechLib;

SELECT 
	BorrowerID, 
	COUNT(BorrowerID) AS Frequency, 
	RANK() OVER (ORDER BY COUNT(BorrowerID) DESC) AS BorrowerRank
FROM Loans
GROUP BY BorrowerID;