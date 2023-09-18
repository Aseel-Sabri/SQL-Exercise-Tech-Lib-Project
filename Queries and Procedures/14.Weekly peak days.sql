USE Tech_Lib;

WITH LOANS_DATES AS
(
	SELECT Date_Borrowed AS Loan_Date
	FROM Loans
	UNION 
	SELECT Date_Returned AS Loan_Date
	FROM Loans
	WHERE Date_Returned IS NOT NULL
)

SELECT TOP(3)
DATENAME(WEEKDAY, Loan_Date) AS Week_Day, 
Count(*) AS Loans_Count, 
CONCAT(CAST(Count(*) * 100.0 /SUM(Count(*)) OVER() AS NUMERIC(4,2)), '%') AS Loans_Percentage
FROM LOANS_DATES
GROUP BY DATENAME(WEEKDAY, Loan_Date)
ORDER BY Count(*) DESC