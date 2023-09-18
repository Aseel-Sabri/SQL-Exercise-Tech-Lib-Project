IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Tech_Lib')
BEGIN
    CREATE DATABASE Tech_Lib;
END;

GO
USE Tech_Lib;

DROP TABLE IF EXISTS AuditLog;
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS [Borrowers];



CREATE TABLE [Books] (
  [Book_ID] int IDENTITY(1,1),
  [Title] varchar(200),
  [Author] varchar(100),
  [ISBN] char(13),
  [Published_Date] date,
  [Genre] varchar(50),
  [Shelf_Location] varchar(50),
  [Current_Status] varchar(10),
  PRIMARY KEY ([Book_ID]),
  CONSTRAINT [Current_Status]
	CHECK ([Current_Status] IN ('Available','Borrowed'))
);

CREATE TABLE [Borrowers] (
  [Borrower_ID] int IDENTITY(1,1),
  [First_Name] varchar(50),
  [Last_Name] varchar(50),
  [Email] varchar(50),
  [Date_of_Birth] date,
  [Membership_Date] date,
  PRIMARY KEY ([Borrower_ID])
);

CREATE TABLE [Loans] (
  [Loan_ID] int IDENTITY(1,1),
  [Book_ID] int,
  [Borrower_ID] int,
  [Date_Borrowed] date,
  [Due_Date] date,
  [Date_Returned] date,
  PRIMARY KEY ([Loan_ID]),
  CONSTRAINT [FK_Loans.Borrower_ID]
    FOREIGN KEY ([Borrower_ID])
      REFERENCES [Borrowers]([Borrower_ID]),
  CONSTRAINT [FK_Loans.Book_ID]
    FOREIGN KEY ([Book_ID])
      REFERENCES [Books]([Book_ID])
);

CREATE TABLE AuditLog(
	Log_ID INT IDENTITY(1,1) PRIMARY KEY,
	Book_ID INT,
	StatusChange VARCHAR(32),
	ChangeDate Date,
	CONSTRAINT [FK_AuditLog.Book_ID]
		FOREIGN KEY (Book_ID)
			REFERENCES [Books]([Book_ID])
);


