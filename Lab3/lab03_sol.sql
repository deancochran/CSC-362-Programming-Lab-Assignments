/*
  Lab 03
  CSC 362 Database Systems
  Dean Cochran

In this lab, creating tables and columns and inserting rows of data is the standard. 
Learning how to use primary and foreign keys to relate tables and how to select
information from multiple tables with JOIN is also a major topic for this lab. 


This lab creates a database called 'Movie ratings' and generates tables utilizing 
the 'linking' concept to related movies consumers and genres together.
*/

--removing instances of previous dbs
DROP DATABASE movie_ratings;
--creating new instance of db
CREATE DATABASE movie_ratings;
--use created instance
USE movie_ratings;


--TABLE CREATION STATION

--creating a movies table
CREATE TABLE movies (
    PRIMARY KEY (MovieID), --movie ID is primary key
    MovieID             INT, --each movie has a uniwue int
    MovieTitle          VARCHAR(200), --movie titles can be long so I gave it a good character buffer
    ReleaseDate         VARCHAR(20), --release date is not in date time form 
    Genre               VARCHAR(64) --This is a multivalued field but I guess were okay with this
);

--creating consumers table
CREATE TABLE consumers (
    PRIMARY KEY (ConsumerID), --consumerID is primary key
    ConsumerID          INT, -- each consumer has a unique int
    FirstName           VARCHAR(32), --first name of client
    LastName            VARCHAR(32), --last name of client
    Address             VARCHAR(64), -- address of client
    City                VARCHAR(32), -- city of client
    State               VARCHAR(2), -- state of client
    Zip                 INT(5) --zipcode of client
);
--creating LINKING table of ratings
CREATE TABLE ratings(
    
    MovieID             INT, --when the table is linked, this info will be accessible 
    ConsumerID          INT,-- ""
    WhenRated           VARCHAR(20),-- ""
    NumberStars         INT-- ""
);


--INSTERTING LAB INFORMATION INTO OUR TABLES

INSERT INTO movies (MovieID, MovieTitle, ReleaseDate, Genre)
VALUES ('1',    'The Hunt for Red October', '1990-03-02 ', 'AcAon, Adventure, Thriller'),
       ('2',    'Lady Bird',  '2017-12-01', 'Comedy, Drama'),
       ('3',    'Inception',  '2010-08-16', 'AcAon, Adventure, Sci-Fi');


INSERT INTO consumers (ConsumerID, FirstName, LastName, Address, City, State, Zip)
VALUES ('1',    'Toru', 'Okada', '800 Glenridge Ave', 'Hobart ','IN','46342'),
       ('2',    'Kumiko', 'Okada', '864 NW Bohemia St', 'Vincentown','NJ','08088'),
       ('3',    'Noboru', 'Wataya', '342 Joy Ridge St', 'Hermitage','TN','37076'),
       ('4',    'May', 'Kasahara', '5 Kent Rd', 'East Haven','CT','06512');
       


INSERT INTO ratings (MovieID, ConsumerID, WhenRated, NumberStars)
VALUES ('1', '1', '2010-09-02 10:54:19', '4'),
       ('1', '3', '2012-08-05 15:00:01', '3'),
       ('1', '4', '2016-10-02 23:58:12', '1'),
       ('2', '3', '2017-03-27 00:12:48', '2'),
       ('2', '4', '2018-08-02 00:54:42', '4');


--SELECTING INFROMATION JUST INSERTED
SELECT * FROM movies;

SELECT * FROM consumers; 

SELECT * FROM ratings; 

/* Generate a report */
SELECT (FirstName, LastName, MovieTitle, NumberStars)
    FROM movies 
        NATURAL JOIN ratings 
        NATURAL JOIN consumers


/* The design flaw that resides in the movies table....
   The table has a field called Genre which contains a multi valued field

   This field should be separated in to a separate table, 
   ideally a linking table since it is a multivalued field...


   STEP #6
 */




 --HERE WE LITERALLY DO THE WHOLE LAB OVER EXPECT FOR ONE SMALL DETAIL

DROP DATABASE movie_ratings;

CREATE DATABASE movie_ratings;

USE movie_ratings;

CREATE TABLE movies (
    PRIMARY KEY (MovieID),
    MovieID             INT,
    MovieTitle          VARCHAR(200),
    ReleaseDate         VARCHAR(20)
);

--HERE IS OUR NEW TABLE OF GENRES SINCE IN THE LAST STEPS IT WAS CONSIDERED A MULTIVALUED FIELD
CREATE TABLE genres(
    PRIMARY KEY (GenreID), -- genre ID is primary key
    GenreID             INT, -- every genre has a unique int
    Genre               VARCHAR(20) --every ID has a unique string value as well!
);


CREATE TABLE consumers (
    PRIMARY KEY (ConsumerID),
    ConsumerID          INT,
    FirstName           VARCHAR(32),
    LastName            VARCHAR(32),
    Address             VARCHAR(64),
    City                VARCHAR(32),
    State               VARCHAR(2),
    Zip                 INT(5)
);


CREATE TABLE ratings(
    FOREIGN KEY (MovieID) REFERENCES movies(MovieID),
    FOREIGN KEY (ConsumerID) REFERENCES consumers(ConsumerID),
    MovieID             INT,
    ConsumerID          INT,
    WhenRated           VARCHAR(20),
    NumberStars         INT
);

--WE USE OUR NEW GENRES TABLE TO CREATE A NEW LINKING TABLE BETWEEN MOVIES AND GENRES
CREATE TABLE movie_genres(
    FOREIGN KEY (MovieID) REFERENCES movies(MovieID), -- movie ID is a foreign key
    FOREIGN KEY (GenreID) REFERENCES genres(GenreID), -- genre ID is a foreign key
    MovieID             INT, -- every movie has a unique int
    GenreID             INT  -- every genre has a unique int
);


INSERT INTO movies (MovieID, MovieTitle, ReleaseDate)
VALUES ('1',    'The Hunt for Red October', '1990-03-02 '),
       ('2',    'Lady Bird',  '2017-12-01'),
       ('3',    'Inception',  '2010-08-16');

INSERT INTO genres (GenreID, Genre)
VALUES ('1',    'Action'),
       ('2',    'Adventure'),
       ('3',    'Comedy'),
       ('4',    'Drama'),
       ('5',    'Thriller'),
       ('6',    'Sci-Fi');

INSERT INTO consumers (ConsumerID, FirstName, LastName, Address, City, State, Zip)
VALUES ('1',    'Toru', 'Okada', '800 Glenridge Ave', 'Hobart ','IN','46342'),
       ('2',    'Kumiko', 'Okada', '864 NW Bohemia St', 'Vincentown','NJ','08088'),
       ('3',    'Noboru', 'Wataya', '342 Joy Ridge St', 'Hermitage','TN','37076'),
       ('4',    'May', 'Kasahara', '5 Kent Rd', 'East Haven','CT','06512');


INSERT INTO ratings (MovieID, ConsumerID, WhenRated, NumberStars)
VALUES ('1', '1', '2010-09-02 10:54:19', '4'),
       ('1', '3', '2012-08-05 15:00:01', '3'),
       ('1', '4', '2016-10-02 23:58:12', '1'),
       ('2', '3', '2017-03-27 00:12:48', '2'),
       ('2', '4', '2018-08-02 00:54:42', '4');


INSERT INTO movie_genres (MovieID,GenreID)
VALUES ('1', '1'),
       ('1', '2'),
       ('1', '5'),
       ('2', '3'),
       ('2', '4'),
       ('3', '1'),
       ('3', '2'),
       ('3', '6');


SELECT * FROM movies;

SELECT * FROM consumers; 

SELECT * FROM genres; 

SELECT * FROM ratings;

SELECT * FROM movie_genres; 
