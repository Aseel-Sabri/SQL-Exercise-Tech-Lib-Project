USE Tech_Lib;

UPDATE books 
SET [Current_Status]='Borrowed' 
WHERE book_id IN (SELECT book_id FROM loans WHERE date_returned IS NULL);