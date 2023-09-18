USE Tech_Lib;

WITH Active_Borrowers AS
(
	SELECT Borrower_ID FROM Loans
	WHERE Date_Returned IS NULL
	GROUP BY Borrower_ID
	HAVING Count(Borrower_ID) > 1
)
SELECT Borrower_ID, First_Name, Last_Name, Email
FROM Borrowers
WHERE Borrower_ID IN (SELECT * FROM Active_Borrowers);