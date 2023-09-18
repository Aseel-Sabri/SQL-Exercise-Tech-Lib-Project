USE Tech_Lib;

SELECT 
	Borrower_ID, 
	COUNT(Borrower_ID) AS Frequency, 
	RANK() OVER (ORDER BY COUNT(Borrower_ID) DESC) AS Borrower_Rank
FROM Loans
GROUP BY Borrower_ID;