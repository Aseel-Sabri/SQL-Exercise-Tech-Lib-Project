USE Tech_Lib;

WITH Ages AS
(
	SELECT Borrower_ID, DATEDIFF(year, Date_Of_Birth , CONVERT(DATE, GETDATE())) AS Age
	FROM Borrowers
),

Age_Ranges AS
(
	SELECT Borrower_ID, CONCAT(((Ages.Age-1)/10)*10+1,'-', ((Ages.Age-1)/10 +1)*10) AS Age_Range 
	FROM Ages
),

Ranked_Genres AS
(
	Select Age_Ranges.Age_Range , Books.Genre, Count(*) AS Num_Of_Borrows,
	Rank() OVER (PARTITION BY Age_Ranges.Age_Range ORDER BY Count(*) DESC) AS Genre_Rank
	FROM Age_Ranges
	JOIN Loans ON Age_Ranges.Borrower_ID = Loans.Borrower_ID
	JOIN Books ON Books.Book_ID = Loans.Book_ID
	GROUP BY Age_Ranges.Age_Range, Books.Genre
)

SELECT Age_Range, Genre AS Preferred_Genre
FROM Ranked_Genres
WHERE Genre_Rank = 1
ORDER BY Age_Range