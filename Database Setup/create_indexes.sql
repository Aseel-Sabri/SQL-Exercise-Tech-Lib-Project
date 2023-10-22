USE TechLib;

CREATE INDEX IX_Loans_DateBorrowed
ON Loans (DateBorrowed);
GO

CREATE INDEX IX_Loans_BorrowerID
ON Loans (BorrowerID);
GO

CREATE INDEX IX_Loans_BookID
ON Loans (BookID);
GO


