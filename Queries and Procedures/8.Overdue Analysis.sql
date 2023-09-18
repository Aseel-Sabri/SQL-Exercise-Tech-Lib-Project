USE Tech_Lib;

SELECT Book_ID, Borrower_ID
FROM Loans
WHERE DATEDIFF(DAY, Due_Date, Date_Returned) > 30
	OR Date_Returned IS NULL AND DATEDIFF(DAY, Due_Date, GETDATE()) > 30
ORDER BY Book_ID;
