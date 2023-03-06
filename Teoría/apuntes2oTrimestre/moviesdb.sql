CREATE DATABASE MOVIES;
USE MOVIES;
CREATE TABLE Movies (
   Code INTEGER PRIMARY KEY,
   Title VARCHAR(255) NOT NULL,
   Rating VARCHAR(255) 
 );
 
 CREATE TABLE MovieTheaters (
   Code INTEGER PRIMARY KEY,
   Name VARCHAR(255) NOT NULL,
   Movie INTEGER,  
     FOREIGN KEY (Movie) REFERENCES Movies(Code)
 ) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating) VALUES(9,'Citizen King','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
 /*Añade la película "One, Two, Three" sin calificación*/
 INSERT INTO Movies(Code, Title, Rating) VALUES (0,"One, Two, Three",NULL);
 
/*Configura la calificación de todas las películas sin calificar a "G"*/
UPDATE Movies SET Rating = "G" WHERE Rating IS NULL;

/*Elimina cines que proyecten películas calificadas con "NC-17"*/

DELETE FROM MovieTheaters 
WHERE Movie = (SELECT Code 
               FROM Movies
               WHERE Rating = "NC-17");


SELECT * FROM movies;




