USE Tech_Lib;

DROP PROCEDURE IF EXISTS sp_AddNewBorrower;
GO
CREATE PROCEDURE sp_AddNewBorrower
(@FirstName VARCHAR(50), @LastName VARCHAR(50), @Email VARCHAR(50), @DateOfBirth DATE, @MembershipDate DATE)
AS BEGIN
  IF EXISTS (SELECT EMAIL FROM Borrowers WHERE EMAIL = @EMAIL)
  BEGIN
	THROW 50005, N'Email Already Exists', 1;
  END

  INSERT INTO Borrowers
  VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
  RETURN @@IDENTITY;
END
GO

