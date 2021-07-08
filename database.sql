--Create the BookStore DataBase
DROP DATABASE IF EXISTS bookStoreDB;
CREATE DATABASE bookStoreDB;
USE bookStoreDB;


DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	bookId  INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(30) NOT NULL,
	genre VARCHAR(30),
	author VARCHAR(30),
	published_year VARCHAR(20),
	stock INT UNSIGNED,
	price DOUBLE,
	PRIMARY KEY (bookId),
	UNIQUE (title)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
	userId INT NOT NULL AUTO_INCREMENT,
	userName VARCHAR(30),
	firstName VARCHAR(30),
	familyName VARCHAR(30),
	email VARCHAR(30),
	bankingCardNumber VARCHAR(19) NOT NULL,
	password VARCHAR(10) NOT NULL,
	PRIMARY KEY (userID),
	UNIQUE (userName)
);

DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews(
	reviewId INT NOT NULL AUTO_INCREMENT,
	reviewText VARCHAR(250),
	PRIMARY KEY (reviewId)
);

DROP TABLE IF EXISTS BooksBought;
CREATE TABLE BooksBought(
	userId INT NOT NULL,
	bookId INT NOT NULL,
	quantity INT NOT NULL,
	PRIMARY KEY (userId, bookId),

	FOREIGN KEY (userId)
		REFERENCES Users(userId)
		ON DELETE CASCADE,

	FOREIGN KEY (bookId)
		REFERENCES Books(bookId)
		ON DELETE CASCADE
);

DROP TABLE IF EXISTS ReviewedBooks;
CREATE TABLE ReviewedBooks(
	reviewId INT NOT NULL,
	bookId INT NOT NULL,
	userId INT NOT NULL,
	score DOUBLE NOT NULL,
	PRIMARY KEY (reviewId),


	FOREIGN KEY (reviewId)
		REFERENCES Reviews(reviewId)
		ON DELETE CASCADE,

	FOREIGN KEY (bookId)
		REFERENCES Books(bookId)
		ON DELETE CASCADE,

	FOREIGN KEY (userId)
		REFERENCES Users(userId)
		ON DELETE CASCADE

);

-- dummy examples
INSERT INTO Books (title, genre, author, published_year, stock, price) VALUES ('Harry Potter and The Goblet of Fire', 'Fiction', 'J. K. Rowling' , '2001', 5, 450);
INSERT INTO Books (title, genre, author, published_year, stock, price) VALUES ('Great Gatsby', 'Romance', 'F Scott Fitzgerald', '1920', 3, 279);
INSERT INTO Books (title, genre, author, published_year, stock, price) VALUES ('100KM to Death', 'Science Fiction', 'Issac Asimov', '2013', 5, 320);
INSERT INTO Books (title, genre, author, published_year, stock, price) VALUES ('Love in The Time of Cholera', 'Drama', 'G. Garcia Marquez', '1960', 5, 270);
INSERT INTO Books (title, genre, author, published_year, stock, price) VALUES ('Dark Matter', 'Science Fiction', 'P. Pullman', '2015', 5, 400);