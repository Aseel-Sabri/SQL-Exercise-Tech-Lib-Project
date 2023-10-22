USE TechLib;

SELECT b.Author, RANK() OVER (ORDER BY COUNT(b.Author)) AS AuthorRank
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
GROUP BY b.Author;