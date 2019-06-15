CREATE DATABASE db_library
USE db_library

CREATE TABLE LIBRARY_BRANCH (
BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1), 
BranchName VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
);


CREATE TABLE BOOK_COPIES (
BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
Number_of_Copies INT NOT NULL,
);

CREATE TABLE PUBLISHER (
PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(50) NOT NULL,
);

CREATE TABLE BOOK_LOANS (
BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut VARCHAR(50) NOT NULL,
DateDue VARCHAR(50) NOT NULL,
);

CREATE TABLE BOOKS (
BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
Title VARCHAR(50) NOT NULL,
PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE BOOK_AUTHORS (
BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
Author_Name VARCHAR(50) NOT NULL
);

CREATE TABLE BORROWER (
CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
FullName VARCHAR(50) NOT NULL,
Borrower_Address VARCHAR(50) NOT NULL,
Phone VARCHAR(50) NOT NULL
);

/*-----------------------
INSERT VALUES INTO TABLES
----------------------*/

INSERT INTO BOOKS 
(Title, PublisherName)
VALUES
('Odd Thomas', 'Simon & Schuster'),
('IT', 'Simon & Schuster'),
('Tick Tock', 'Simon & Schuster'),
('Batman: Year One', 'DC Comics'),
('Umbrella Academy Vol. 1', 'Dark Horse Comics'),
('Swamp Thing', 'DC Comics'),
('Walking Dead', 'Image Comics'),
('The Lost Tribe', 'Picador USA'),
('Pet Semetary', 'Simon & Schuster'),
('The Wicked + The Divine', 'Bao'),
('The Punisher', 'Max Comics'),
('Daredevil', 'Marvel'),
('The Killing Joke', 'DC Comics'),
('Watchmen', 'DC Comics'),
('To Kill a Mockingbird', 'J.B. Lippnicott & Co.'),
('The Great Gatsby','Charle''s Scribner Sons'),
('One Hundred Years of Solitude', 'Harper Perennial'),
('A Passage to India', 'Mariner Books'),
('Invisible Man', 'Penguin Random House LLC.'),
('Don Quixote', 'Francisco de Robles');

SELECT * FROM BOOKS

INSERT INTO PUBLISHER
(PublisherName, Address, Phone)
VALUES
('Simon & Schuster', '21st st', '534-3435'),
('DC Comics', 'W 23rd', '234-4567'),
('Dark Horse Comics', '123 Fergsuon Dr', '123-5678'),
('Max Comics', '45 Nord Ave', '233-9485'),
('Image Comics', '124 Esplanade', '293-8745'),
('Picador USA', 'W 80 ave', '203-8765'),
('Bao', 'NW Nicolai', '103-8876'),
('Marvel', '8104 Aspen Summit Dr', '981-8263'),
('J.B. Lippnicott & Co.', '6 South Park Dr', '827-8276'),
('Charle''s Scribner Sons', '23 West Park Drive', '203-8726'),
('Harper Perennial', '83 Mangrove Ave', '203-5543'),
('Mariner Books', '9 Cohassett', '233-5555'),
('Penguin Random House LLC.', '8 Wilbur Ave', '222-2222'),
('Francisco de Robles', '34 Oliver Ln', '777-2828');

SELECT * FROM PUBLISHER

INSERT INTO LIBRARY_BRANCH
(BranchName, Address)
VALUES
('Sharpstown', '1234 NW 1st'),
('Central', '5876 SW 2nd'),
('Magalia', '13727 Ferguson Dr'),
('Chico', '929 Nord Ave');

SELECT * FROM LIBRARY_BRANCH

INSERT INTO BOOK_AUTHORS
(BookID,Author_Name)
VALUES
(2,'Dean Koontz'),
(3,'Stephen King'),
(4,'Dean Koontz'),
(5, 'Frank Miller'),
(6,'Gerard Way'),
(7,'Alan Moore'),
(8,'Mark Lee'),
(9,'Stephen King'),
(10,'Kieron Gillen'),
(11,'The Punisher'),
(12,'Daredevil'),
(13,'Alan Moore'),
(14,'Alan Moore'),
(15,'Nelle Harper Lee'),
(16,'F. Scott Fitzgerald'),
(17,'Gabriel Garcia Marquez'),
(18,'E.M. Forster'),
(19,'Ralph Ellisin'),
(20,'Miguel de Cervantes');

SELECT * FROM BOOK_AUTHORS

INSERT INTO BOOK_COPIES
(BookID, BranchID, Number_of_Copies)
VALUES
(8,1,2),
(9,1,3),
(6,1,5),
(5,1,2),
(20,1,8),
(18,1,4),
(11,1,5),
(7,1,7),
(10,1,4),
(12,1,4),
(13,1,2),
(3,2,2),
(9,2,5),
(13,2,4),
(14,2,8),
(15,2,6),
(4,2,3),
(5,2,5),
(6,2,10),
(7,2,2),
(8,2,5),
(2,2,2),
(2,3,5),
(3,3,7),
(4,3,9),
(5,3,3),
(6,3,2),
(7,3,9),
(19,3,2),
(12,3,5),
(18,3,5),
(10,3,3),
(20,4,2),
(19,4,6),
(18,4,3),
(17,4,2),
(16,4,4),
(2,4,4),
(5,4,3),
(4,4,2);

SELECT * FROM BOOK_COPIES

INSERT INTO BOOK_LOANS
(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
(20,1,12,'6/6/2019','6/12/2019'),
(13,2,10,'12/29/2018','1/12/2019'),
(3,2,11,'6/15/2019','6/22/2019'),
(6,2,12,'6/14/2019','6/21/2019'),
(12,3,2,'6/6/2019','6/12/2019'),
(14,2,4,'6/8/2019','6/15/2019'),
(15,2,10,'6/7/2019','6/14/2019'),
(16,4,4,'6/6/2019','6/12/2019'),
(20,4,5,'6/3/2019','6/10/2019'),
(13,1,12,'6/1/2019','6/08/2019'),
(12,3,3,'5/21/2019','5/28/2019'),
(13,1,6,'6/15/2019','6/22/2019'),
(9,2,11,'6/10/2019','6/17/2019'),
(11,1,12,'6/3/2019','6/10/2019'),
(5,4,12,'5/24/2019','6/1/2019'),
(9,2,10,'6/10/2019','6/17/2019'),
(6,2,10,'6/14/2019','6/21/2019'),
(7,2,10,'6/15/2019','6/22/2019'),
(7,1,6,'6/15/2019','6/22/2019'),
(20,1,6,'6/15/2019','6/22/2019'),
(18,3,3,'5/21/2019','5/28/2019'),
(7,3,3,'5/21/2019','5/28/2019'),
(16,4,1,'6/15/2019','6/22/2019'),
(7,3,1,'6/15/2019','6/22/2019'),
(2,4,1,'6/15/2019','6/22/2019'),
(7,3,6,'6/12/2019','6/19/2019'),
(7,3,7,'6/15/2019','6/22/2019'),
(18,3,7,'6/15/2019','6/22/2019'),
(4,3,9,'6/03/2019','6/18/2019'),
(4,3,9,'6/03/2019','6/18/2019'),
(6,2,1,'6/12/2019','6/19/2019'),
(6,2,2,'6/15/2019','6/21/2019'),
(6,2,3,'6/04/2019','6/11/2019'),
(6,2,4,'6/10/2019','6/17/2019'),
(6,2,5,'6/15/2019','6/22/2019'),
(6,2,6,'6/02/2019','6/09/2019'),
(6,2,6,'6/14/2019','6/21/2019'),
(6,2,7,'6/15/2019','6/23/2019'),
(7,2,8,'6/15/2019','6/25/2019'),
(7,2,5,'6/15/2019','6/29/2019'),
(7,2,1,'6/16/2019','6/22/2019'),
(14,2,9,'6/15/2019','6/21/2019'),
(14,2,8,'6/07/2019','6/14/2019'),
(14,2,5,'5/26/2019','6/03/2019'),
(14,2,6,'6/01/2019','6/07/2019'),
(14,2,12,'6/15/2019','6/21/2019'),
(14,2,1,'6/15/2019','6/22/2019'),
(14,2,2,'6/15/2019','6/22/2019'),
(2,3,5,'6/17/2019','6/22/2019'),
(2,3,7,'6/04/2019','6/11/2019'),
(2,3,11,'6/13/2019','6/20/2019');

INSERT INTO BORROWER
(FullName, Borrower_Address, Phone)
VALUES
('Abi Mohormann','25 W 1st Street',987-7657),
('Anne Wright','2 Booker Ave',345-3456),
('Evan Harriman','377 Magnolia',123-4567),
('David Flood','90 Gambino Ave',678-2345),
('Stephen Gilmore','50th Ave',222-7777),
('Inaki Martinez','40 Cesar Chavez',000-3334),
('Fabian Ramirez','2424 Milwakie',565-3434),
('Tori LaDuke','92 St John''s',765-3456),
('Mackenzie Mehrl','808 SE Division',284-4590),
('Jensyn LaDuke','1762 SE 80th Ave',126-5432),
('Mandy Romaine','230 Harvey Milk',100-6777),
('Ron Chapman','29 Belmont Ave',900-3456);

SELECT * FROM BORROWER


/*-----------------
CREATE STORED PROCEDURES 
-----------------*/

USE db_library
GO
CREATE PROCEDURE dbo.uspGetLostTribe @BranchID INT
AS
SELECT * FROM BOOK_COPIES WHERE @BranchID = 1 AND BookID = 8
GO

/*-------------------
2.
-----------------*/


EXEC dbo.uspGetLostTribe @BranchID = 1 

USE db_library
GO
CREATE PROCEDURE dbo.uspGetBookCopies @BranchID INT, @BookID INT
AS
SELECT * FROM BOOK_COPIES WHERE @BranchID = BranchID AND @BookID = BookID
GO

EXEC dbo.uspGetBookCopies @BranchID = 1, @BookID = 8 
EXEC dbo.uspGetBookCopies @BranchID = 2, @BookID = 8
EXEC dbo.uspGetBookCopies @BranchID = 3, @BookID = 8
EXEC dbo.uspGetBookCopies @BranchID = 4, @BookID = 8

/*-----------------
3. 
-------------------*/

USE db_library
GO
CREATE PROCEDURE dbo.uspBorrowersNoBooks @Borrower INT, @BookID INT = NULL
AS
SELECT * FROM BOOK_LOANS WHERE @Borrower = CardNo AND @BookID = ISNULL(@BookID, BookID)
GO

EXEC dbo.uspBorrowersNoBooks @Borrower = 1 

/*----------------------
4.
---------------------*/

USE db_library
GO
CREATE PROCEDURE dbo.uspDueToday

