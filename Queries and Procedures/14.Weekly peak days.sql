USE TechLib;

WITH LoansDates AS
(
	SELECT DateBorrowed AS LoanDate
	FROM Loans
	UNION 
	SELECT DateReturned AS LoanDate
	FROM Loans
	WHERE DateReturned IS NOT NULL
)

SELECT TOP(3)
	DATENAME(WEEKDAY, LoanDate) AS WeekDay, 
	COUNT(*) AS LoansCount, 
	CONCAT(CAST(COUNT(*) * 100.0 / SUM(Count(*)) OVER() AS NUMERIC(4,2)), '%') AS LoansPercentage
FROM LoansDates
GROUP BY DATENAME(WEEKDAY, LoanDate)
ORDER BY COUNT(*) DESC