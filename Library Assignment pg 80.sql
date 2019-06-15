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
(Author_Name)
VALUES
('Dean Koontz'),
('Stephen King'),
('Gerard Way'),
('Alan Moore'),
('Robert Kirkman'),
('Mark Lee'),
('Kieron Gillen'),
('Gerry Conway'),
('Stan Lee'),
('Alan Moore'),
('Nelle Harper Lee'),
('F. Scott Fitzgerald'),
('Gabriel Garcia Marquez'),
('E.M. Forster'),
('Ralph Ellisin'),
('Miguel de Cervantes');

SELECT * FROM BOOK_AUTHORS