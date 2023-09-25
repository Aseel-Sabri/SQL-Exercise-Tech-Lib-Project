USE Tech_Lib;

CREATE INDEX IX_Books_Title
ON Books (Title);
GO

CREATE INDEX IX_Books_Author
ON Books (Author);
GO

CREATE INDEX IX_Borrowers_FirstNameLastName
ON Borrowers (First_Name, Last_Name);
GO

CREATE INDEX IX_Loans_BorrowerID
ON Loans (Borrower_ID);
GO

CREATE INDEX IX_Loans_BookID
ON Loans (Book_ID);
GO



