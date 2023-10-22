USE TechLib;

WITH RankedGenres AS 
(
	SELECT 
		(DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) - 1) / 10 AS AgeRange,
		bk.Genre,
		RANK() OVER (PARTITION BY (DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) - 1) / 10 ORDER BY COUNT(*) DESC) AS [RANK]
	FROM Borrowers br
	JOIN Loans l ON l.BorrowerID = br.BorrowerID
	JOIN Books bk ON bk.BookID = l.BookID
	GROUP BY (DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) - 1) / 10, bk.Genre
)
SELECT CONCAT(AgeRange * 10 + 1,'-', (AgeRange + 1) * 10) AS AgeRange, Genre AS PreferredGenre
FROM RankedGenres
WHERE [RANK] = 1;

