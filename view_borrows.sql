CREATE VIEW View_Borrows AS
SELECT bor.BorrowID,stu.Name AS StudentName,boo.Title AS BookTitle,aut.Name AS Author,bor.BorrowDate,bor.DueDate,bor.ReturnDate
FROM Borrows bor INNER JOIN Students stu ON bor.StudentID=stu.StudentID
				 INNER JOIN Books boo ON bor.BookID=boo.BookID
				 INNER JOIN Authors aut ON boo.AuthorID=aut.AuthorID