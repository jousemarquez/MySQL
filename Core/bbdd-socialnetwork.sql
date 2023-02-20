/* Práctica de desarrollo de Base de Datos para red social.
El modelado que se plantee, debe satisfacer los siguientes requisitos:
- Cada usuario crea muchas publicaciones, respuestas y favoritos.
- Cada publicación pertenece a un solo usuario/usuaria.
- Cada publicación tiene muchas respuestas y muchos favoritos.
- Cada respuesta pertenece tanto a un usuario como a una publicación.
- Cada favorito pertenece tanto a un usuario como a una publicación.
*/

DROP DATABASE IF EXISTS SocialNetwork;
CREATE DATABASE SocialNetwork;
USE SocialNetwork;

DROP TABLE IF EXISTS Countries;
CREATE TABLE Countries (
country_id BIGINT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (`country_id`),
UNIQUE KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP DATA COUNTRIES
INSERT INTO Countries (country_id, name) VALUES (0,"Spain");

DROP TABLE IF EXISTS Cities;
CREATE TABLE Cities (
city_id BIGINT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
country_id BIGINT NOT NULL,
PRIMARY KEY (`city_id`),
UNIQUE KEY (`name`),
FOREIGN KEY (`country_id`) REFERENCES Countries(`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP DATA COUNTRIES
INSERT INTO Cities (city_id, name, country_id) VALUES (0,"Sevilla",0);

DROP TABLE IF EXISTS Genders;
CREATE TABLE Genders(
gender_id BIGINT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (`gender_id`),
UNIQUE KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP DATA GENDERS
INSERT INTO Genders (gender_id, name)
VALUES (0,"Male"),
(1,"Female"),
(2,"Helicopter");

DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users(
user_id BIGINT NOT NULL AUTO_INCREMENT,
email VARCHAR(255) NOT NULL,
username VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
real_name VARCHAR(1000) NOT NULL,
gender_id BIGINT NOT NULL,
city_id BIGINT NOT NULL,
profile_picture_url VARCHAR(255),
birth_date DATE NOT NULL,
date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
active ENUM('yes','no') NOT NULL DEFAULT 'no',
PRIMARY KEY (`user_id`),
FOREIGN KEY (`gender_id`) REFERENCES Genders(`gender_id`),
FOREIGN KEY (`city_id`) REFERENCES Cities(`city_id`),
UNIQUE KEY (`email`),
UNIQUE KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP DATA USERS
INSERT INTO Users (email,username,password,real_name,gender_id,city_id,profile_picture_url,birth_date,date_created,date_updated)
VALUES ("jouse@socialnetwork.com","Quorom","t0nt03lqu3l0l34","Jouse MF",0,0,NULL,DATE '1987-01-23',now(),now()),
("josemari@socialnetwork.com","JM","t0nt03lqu3l0l34","JM AMF",0,0,NULL,DATE '1987-01-23',now(),now());

DROP TABLE IF EXISTS Posts;
CREATE TABLE Posts(
post_id BIGINT NOT NULL AUTO_INCREMENT,
user_id BIGINT NOT NULL,
comment TEXT NULL,
type ENUM('image', 'video'),
date_created DATE NOT NULL,
date_updated DATE,
PRIMARY KEY (`post_id`),
FOREIGN KEY (`user_id`) REFERENCES Users(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP DATA POSTS
INSERT INTO Posts (post_id, user_id, comment, type, date_created, date_updated)
VALUES (0,1,"Hello world","image",now(),now());

CREATE TABLE Comments(
comment_id BIGINT NOT NULL AUTO_INCREMENT,
post_id BIGINT NOT NULL,
user_id BIGINT NOT NULL,
content TEXT NOT NULL,
date_created DATE NOT NULL,
date_updated DATE,
PRIMARY KEY (`comment_id`),
FOREIGN KEY (`post_id`) REFERENCES Posts(`post_id`),
FOREIGN KEY (`user_id`) REFERENCES Users(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP DATA COMMENTS
INSERT INTO Comments (comment_id, post_id, user_id, content, date_created, date_updated)
VALUES (0,0,1,"Love your bald head",now(),now());

CREATE TABLE Followings(
user_id BIGINT NOT NULL,
following_id BIGINT NOT NULL,
date_created DATE NOT NULL,
PRIMARY KEY (`user_id`),
FOREIGN KEY (`user_id`) REFERENCES Users(`user_id`),
FOREIGN KEY (`following_id`) REFERENCES Users(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP DATA FOLLOWING
INSERT INTO Followings (user_id, following_id, date_created)
VALUES (0,0,now(),now());