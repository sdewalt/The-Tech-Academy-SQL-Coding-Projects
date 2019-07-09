USE db_library2;

CREATE TABLE tbl_library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR (20) NOT NULL,
	Address VARCHAR (30) NOT NULL
);

INSERT INTO tbl_library_branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '3477 Johnson St.'),
	('Central', '122 Main St.'),
	('Eastside', '4766 River Rd.'),
	('Westside', '755 Sunset Dr.'),
	('Laguna', '575 Beach Blvd.')
	;

CREATE TABLE tbl_books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR (30) NOT NULL,
	PublisherName VARCHAR (70) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES tbl_Publisher(PublisherName)
);

INSERT INTO tbl_books 
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Imagination'),
	('Carrie', 'Doubleday'),
	('Misery', 'Viking'),
	('Doctor Sleep', 'Scribner'),
	('Christine', 'Viking Press'),
	('Pet Sematary', 'Hanover Press'),
	('The Shining', 'Doubledown'),
	('The Green Mile', 'New American'),
	('Cujo', 'Viking Press'),
	('The Dead Zone', 'Hopper Press'),
	('Fleishman is in Trouble', 'Random House'),
	('Recursion', 'Crown'),
	('Pass of Fire', 'Ace'),
	('The Oracle', 'G. P. Putnams Sons'),
	('Tom Clancy Enemy Contact', 'Total'),
	('Alphabet Squadron', 'Del Rey'),
	('This Storm', 'Knopf'),
	('City of Girls', 'Riverhead Books'),
	('The Friends We Keep', 'Berkley'),
	('Whiskers in the Dark', 'Bantam Books'),
	('The Body in the Castle Well', 'Alfred A. Knopf'),
	('The Book Supremacy', 'Berkley Press')
;

CREATE TABLE tbl_Publisher (
	PublisherName VARCHAR (70) PRIMARY KEY NOT NULL, 
	Address VARCHAR (40) NOT NULL,
	Phone VARCHAR (40) NOT NULL
);

INSERT INTO tbl_Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Imagination', '8733 Jamestown Rd.', '455-243-9982'),
	('Doubleday', '774 Newbury Dr.', '622-444-2621'),
	('Viking', '8233 Grand St.', '455-222-6674'),
	('Scribner', '4977 Front St.', '330-522-7742'),
	('Viking Press', '447 10th St.', '772-664-9090'),
	('Hanover Press', '4997 26th Ave.', '772-677-9032'),
	('Doubledown', '774 North Dr.', '622-499-6262'),
	('Denver Post', '7465 Eastwat Dr.', '622-444-2677'),
	('New American', '5574 Canal Rd.', '442-975-4545'),
	('Hopper Press', '447 55th St.', '772-664-2339'),
	('Random House', '7622 Porter Blvd.', '255-788-9042'),
	('Crown', '720 Terrier Ct.', '575-883-9012'),
	('Ace', '5578 Harbor Dr.', '337-677-4588'),
	('G. P. Putnams Sons', 'Market St.', '949-442-3917'),
	('Total', 'Gavin St.', '949-557-9932'),
	('Del Rey', '2274 Northend Dr.', '714-772-7745'),
	('Knopf', '233 3rd Dr.', '522-622-9976'),
	('Riverhead Books', '6244 Connor Blvd.', '737-288-5534'),
	('Berkley', '555 Grover Rd.', '252-661-8844'),
	('Bantam Books', '133 Kilgore Ct.', '445-772-5656'),
	('Alfred A. Knopf', '7724 Hoover Rd.', '622-994-8821'),
	('Berkley Press', '555 Gallop Rd.', '252-661-8877')
;

CREATE TABLE tbl_Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID1 FOREIGN KEY REFERENCES tbl_books(BookID), 
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	Number_Of_Copies INT NOT NULL
);

INSERT INTO tbl_Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 1, 4),
	(1, 2, 2),
	(1, 3, 3),
	(1, 4, 2),
	(1, 5, 3),
	(2, 2, 3),
	(3, 2, 2),
	(5, 2, 4),
	(7, 2, 4),
	(9, 2, 6),
	(11, 2, 2),
	(13, 2, 3),
	(15, 2, 2),
	(17, 2, 2),
	(19, 2, 4),
	(4, 1, 2),
	(6, 1, 2),
	(8, 1, 4),
	(10, 1, 2),
	(12, 1, 4),
	(14, 1, 2),
	(16, 1, 2),
	(18, 1, 4),
	(20, 1, 6),
	(22, 1, 2),
	(21, 3, 4),
	(18, 3, 2),
	(13, 3, 4),
	(15, 3, 6),
	(3, 3, 2),
	(6, 3, 4),
	(7, 3, 4),
	(4, 3, 4),
	(17, 3, 2),
	(20, 3, 4),
	(2, 4, 4),
	(4, 4, 2),
	(7, 4, 4),
	(16, 4, 2),
	(19, 4, 4),
	(5, 4, 6),
	(9, 4, 4),
	(18, 4, 2),
	(14, 4, 5),
	(17, 4, 3),
	(12, 5, 2),
	(14, 5, 4),
	(15, 5, 2),
	(21, 5, 3),
	(5, 5, 4),
	(2, 5, 2),
	(7, 5, 4),
	(9, 5, 2),
	(22, 5, 4),
	(18, 5, 2),
	(20, 5, 4)
;

CREATE TABLE tbl_Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_books(BookID),
	AuthorName VARCHAR (30) NOT NULL,
);

INSERT INTO tbl_Book_Authors
	(BookID, AuthorName)
	VALUES
	(1, 'John Doe'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Stephen King'),
	(5, 'Stephen King'),
	(6, 'Stephen King'),
	(7, 'Stephen King'),
	(8, 'Stephen King'),
	(9, 'Stephen King'),
	(10, 'Stephen King'),
	(11, 'Taffy Brodesser-Akner'),
	(12, 'Blake Crouch'),
	(13, 'Taylor Anderson'),
	(14, 'Clive Cudsler'),
	(15, 'Mike Maden'),
	(16, 'Alexander Freed'),
	(17, 'James Ellroy'),
	(18, 'Elizabeth Gilbert'),
	(19, 'Jane Green'),
	(20, 'Rita Mae Brown'),
	(21, 'Martin Walker'),
	(22, 'Kate Carlisle')
;

CREATE TABLE tbl_Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES tbl_books(BookID), 
	BranchID INT NOT NULL CONSTRAINT fk_BranchID1 FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_Borrower(CardNo),
	DateOut VARCHAR (20) NOT NULL,
	DateDue VARCHAR (20) NOT NULL
);

INSERT INTO tbl_Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(20, 5, 44872, '5-20-19', '7-20-19'),
	(12, 5, 44872, '4-21-19', '6-21-19'),
	(14, 5, 44872, '4-21-19', '6-21-19'),
	(18, 5, 44872, '6-27-19', '7-10-19'),
	(5, 5, 44872, '6-27-19', '7-10-19'),
	(2, 5, 44872, '7-1-19', '9-1-19'),
	(3, 2, 55722, '6-22-19', '8-22-19'),
	(7, 2, 55722, '6-5-19', '7-24-19'),
	(11, 2, 55722, '6-29-19', '8-2-19'),
	(15, 2, 55722, '6-12-19', '8-12-19'),
	(13, 2, 55722, '6-7-19', '8-18-19'),
	(19, 2, 55722, '6-14-19', '8-14-19'),
	(17, 2, 55722, '6-14-19', '8-14-19'),
	(18, 1, 54667, '6-4-19', '7-8-19'),
	(20, 1, 54667, '6-4-19', '7-8-19'),
	(8, 1, 54667, '6-4-19', '7-8-19'),
	(1, 1, 54667, '6-4-19', '7-8-19'),
	(22, 1, 54667, '6-4-19', '7-4-19'),
	(2, 4, 82266, '6-17-19', '7-17-19'),
	(4, 4, 82266, '6-17-19', '7-17-19'),
	(7, 4, 82266, '6-17-19', '7-17-19'),
	(17, 4, 82266, '6-17-19', '7-17-19'),
	(3, 3, 77558, '6-22-19', '7-22-19'), 
	(6, 3, 77558, '6-22-19', '7-22-19'),
	(7, 3, 77558, '6-22-19', '7-22-19'),
	(4, 3, 77558, '6-22-19', '7-22-19'),
	(13, 3, 77558, '6-22-19', '7-22-19'),
	(15, 3, 77558, '6-22-19', '7-22-19'),
	(20, 3, 77558, '6-22-19', '7-22-19'),
	(13, 3, 56772, '6-11-19', '7-11-19'),
	(15, 3, 56772, '6-11-19', '7-11-19'),
	(18, 3, 56772, '6-11-19', '7-11-19'),
	(21, 3, 56772, '6-11-19', '7-11-19'),
	(18, 5, 76991, '6-14-19', '8-14-19'),
	(20, 5, 76991, '6-14-19', '8-14-19'),
	(21, 5, 76991, '6-14-19', '8-14-19'),
	(22, 5, 76991, '6-14-19', '8-14-19'),
	(4, 1, 89894, '6-19-19', '8-19-19'),
	(6, 1, 89894, '6-19-19', '8-19-19'),
	(8, 1, 89894, '6-19-19', '8-19-19'),
	(10, 1, 89894, '6-19-19', '8-19-19'),
	(16, 1, 89894, '6-19-19', '8-19-19'),
	(18, 1, 89894, '6-19-19', '8-19-19'),
	(20, 1, 89894, '6-19-19', '8-19-19'),
	(2, 2, 87226, '6-3-19', '8-4-19'),
	(3, 2, 87226, '6-3-19', '8-4-19'),
	(5, 2, 87226, '6-3-19', '8-4-19'),
	(7, 2, 87226, '6-3-19', '8-4-19'),
	(13, 3, 67383, '6-6-19', '8-6-19'),
	(6, 3, 67383, '6-6-19', '8-6-19'),
	(7, 3, 67383, '6-6-19', '8-6-19'),
	(4, 3, 67383, '6-6-19', '8-6-19')
;
	
CREATE TABLE tbl_Borrower (
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR (50) NOT NULL,
	Address VARCHAR (50) NOT NULL,
	Phone VARCHAR (50) NOT NULL
);

INSERT INTO tbl_Borrower
	(CardNo, Name, Address, Phone)
	VALUES
	(44872, 'John Jones', '433 18th St.', '714-322-9972'),
	(54667, 'Emily Thomas', '5532 Jenkins Ln.', '714-622-1818'),
	(76991, 'Jane Fields', '4785 Henry Blvd.', '714-787-3322'),
	(55722, 'Hank Arron', '7722 Johnson Dr.', '714-435-9192'),
	(87226, 'Mickey Mantle', '9844 Fairchild Dr.', '714-744-7720'),
	(67383, 'Willie Mays', '633 Dover Rd.', '714-277-8812'),
	(77558, 'Magic Johnson', '788 Garfield Dr.', '714-890-8237'),
	(82266, 'Larry Bird', '744 Beantown Rd.', '714-526-3312'),
	(56772, 'Tony Gwynn', '8866 Backbay Blvd.', '714-533-7784'),
	(89894, 'Joe Montana', '7844 Ashbury St.', '714-488-9292'),
	(56567, 'John Elway', '572 Milehigh Dr.', '714-944-7890'),
	(63387, 'Brett Farve', '890 Lakeview Ln.', '714-844-3822')
;

#1
USE db_library2
GO
CREATE PROCEDURE uspCopiesofTheLostTribeAtSharpstown
AS
BEGIN
SELECT tbl_library_branch.BranchName, tbl_Book_Copies.Number_Of_Copies
FROM tbl_Book_Copies
INNER JOIN tbl_library_branch ON tbl_Book_Copies.BranchID = tbl_library_branch.BranchID
WHERE BookID =1 
AND BranchName ='Sharpstown';
END;

#2
USE db_library2
GO
CREATE PROCEDURE uspCopiesofTheLostTribeAtEachBranch
AS
BEGIN
SELECT tbl_library_branch.BranchName, tbl_Book_Copies.Number_Of_Copies
FROM tbl_Book_Copies
INNER JOIN tbl_library_branch ON tbl_Book_Copies.BranchID = tbl_library_branch.BranchID
WHERE BookID =1;
END;

#3
USE db_library2
GO
CREATE PROCEDURE uspBorrowersWithNoBooksCheckedOut
AS
BEGIN
SELECT tbl_Borrower.Name, COUNT (tbl_Book_Loans.CardNo) 'Books Out'
FROM tbl_Borrower
LEFT JOIN tbl_Book_Loans ON tbl_Book_Loans.CardNo = tbl_Borrower.CardNo
GROUP BY tbl_Borrower.Name HAVING COUNT (tbl_Book_Loans.CardNo) =0;
END;

#4
USE db_library2
GO
CREATE PROCEDURE uspSharpstownBooksDueToday
AS
BEGIN
SELECT tbl_library_branch.BranchName, tbl_books.Title, tbl_Borrower.Name, tbl_Borrower.Address
FROM tbl_books
INNER JOIN tbl_Book_Loans ON tbl_books.BookID = tbl_Book_Loans.BookID
INNER JOIN tbl_library_branch ON tbl_Book_Loans.BranchID = tbl_library_branch.BranchID
INNER JOIN tbl_Borrower ON tbl_Book_Loans.CardNo = tbl_Borrower.CardNo
WHERE DateDue = '7-8-19'
AND BranchName ='Sharpstown';
END;

#5
USE db_library2
GO
CREATE PROCEDURE uspTotalBooksCheckedOut
AS
BEGIN
SELECT tbl_library_branch.BranchName, COUNT (tbl_Book_Loans.BookID) 'Books Checked Out'
FROM tbl_library_branch
INNER JOIN tbl_Book_Loans ON tbl_Book_Loans.BranchID = tbl_library_branch.BranchID
GROUP BY tbl_library_branch.BranchName;
END;

USE db_library2
GO
CREATE PROCEDURE uspRetrieveInfoOFBoorrowersWith5_OrMoreOut
AS
BEGIN
SELECT tbl_Borrower.Name, tbl_Borrower.Address, COUNT (tbl_Book_Loans.CardNo) 'Books Checked Out'
FROM tbl_Borrower
INNER JOIN tbl_Book_Loans ON tbl_Book_Loans.CardNo = tbl_Borrower.CardNo
GROUP BY tbl_Borrower.Name, tbl_Borrower.CardNo,tbl_Borrower.Address 
HAVING COUNT (tbl_Book_Loans.CardNo) >5;
END;

USE db_library2
GO
CREATE PROCEDURE CentralBranchesStephenKingBooks
AS
BEGIN
SELECT tbl_library_branch.BranchName, tbl_Book_Authors.AuthorName, tbl_books.Title, tbl_Book_Copies.Number_Of_Copies
FROM tbl_Book_Copies
INNER JOIN tbl_books ON tbl_Book_Copies.BookID = tbl_books.BookID
INNER JOIN tbl_library_branch ON tbl_Book_Copies.BranchID = tbl_library_branch.BranchID
INNER JOIN tbl_Book_Authors ON tbl_Book_Authors.BookID = tbl_books.BookID
WHERE AuthorName = 'Stephen King' AND tbl_Library_Branch.BranchID = '2'
 
END;





	
	