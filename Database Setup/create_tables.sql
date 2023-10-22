IF NOT EXISTS (SELECT NAME FROM sys.databases WHERE name = 'TechLib')
BEGIN
    CREATE DATABASE TechLib;
END;

GO
USE TechLib;

DROP TABLE IF EXISTS AuditLog;
DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Borrowers;



CREATE TABLE Books (
  BookID INT IDENTITY(1,1),
  Title VARCHAR(200),
  Author VARCHAR(100),
  ISBN CHAR(13),
  PublishedDate DATE,
  Genre VARCHAR(50),
  ShelfLocation VARCHAR(50),
  CurrentStatus VARCHAR(10),
  PRIMARY KEY (BookID),
  CONSTRAINT CurrentStatus
	CHECK (CurrentStatus IN ('Available','Borrowed'))
);

CREATE TABLE Borrowers (
  BorrowerID INT IDENTITY(1,1),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(50),
  DateOfBirth DATE,
  MembershipDate DATE,
  PRIMARY KEY (BorrowerID)
);

CREATE TABLE Loans (
  LoanID INT IDENTITY(1,1),
  BookID INT,
  BorrowerID INT,
  DateBorrowed DATE,
  DueDate DATE,
  DateReturned DATE,
  PRIMARY KEY (LoanID),
  CONSTRAINT FK_Loans_Borrowers
    FOREIGN KEY (BorrowerID)
      REFERENCES Borrowers(BorrowerID),
  CONSTRAINT FK_Loans_Books
    FOREIGN KEY (BookID)
      REFERENCES Books(BookID)
);

CREATE TABLE AuditLog(
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT,
	StatusChange VARCHAR(10),
	ChangeDate DATE,
	CONSTRAINT FK_AuditLog_Books
		FOREIGN KEY (BookID)
			REFERENCES Books(BookID)
);


