CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

--------------------- TABLA USERS -------------------
CREATE TABLE IF NOT EXISTS users(
id int(255) auto_increment not null,
role varchar(20),
name varchar(100),
surname varchar(200),
nick varchar(100),
email varchar(255),
password varchar(255),
image varchar(255),
created_at datetime,
updated_at datetime,
remember_token varchar(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

-- INSERTAR EN USER --
INSERT INTO users VALUES(NULL,'user','Aaron','Aragon Aroca','Arokaap','aaron.david.nagore@gmail.com','pass',null, CURTIME(),CURTIME(),NULL);
INSERT INTO users VALUES(NULL,'user','Juan','Lopez','juanlopez','juan@juan.com','pass',null, CURTIME(),CURTIME(),NULL);
INSERT INTO users VALUES(NULL,'user','Manolo','Garcia','manologarcia','manolo@manolo.com','pass',null, CURTIME(),CURTIME(),NULL);









--------------------- TABLA IMAGES -------------------
CREATE TABLE IF NOT EXISTS images(
id int(255) auto_increment not null,
user_id int(255),
image_path varchar(255),
description text,
created_at datetime,
updated_at datetime,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;


-- INSERTAR IMAGES --
INSERT INTO images VALUES(NULL, 1, 'test.jpg', 'descripcion de prueba 1', CURTIME(),CURTIME());
INSERT INTO images VALUES(NULL, 1, 'playa.jpg', 'descripcion de prueba 2', CURTIME(),CURTIME());
INSERT INTO images VALUES(NULL, 1, 'arena.jpg', 'descripcion de prueba 3', CURTIME(),CURTIME());
INSERT INTO images VALUES(NULL, 3, 'familia.jpg', 'descripcion de prueba 4', CURTIME(),CURTIME());








--------------------- TABLA COMMENTS -------------------
CREATE TABLE IF NOT EXISTS comments(
id int(255) auto_increment not null,
user_id int(255),
image_id int(255),
content text,
created_at datetime,
updated_at datetime,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;


-- INSERTAR COMMENTS --
INSERT INTO comments VALUES(null,1,4,'Buena foto de familia',CURTIME(),CURTIME());
INSERT INTO comments VALUES(null,2,1,'Buena foto de playa',CURTIME(),CURTIME());
INSERT INTO comments VALUES(null,2,4,'Que bueno!!',CURTIME(),CURTIME());









--------------------- TABLA LIKES -------------------
CREATE TABLE IF NOT EXISTS likes(
id int(255) auto_increment not null,
user_id int(255),
image_id int(255),
created_at datetime,
updated_at datetime,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;

-- INSERT LIKES--
INSERT INTO likes VALUES(NULL,1,4,CURTIME(),CURTIME());
INSERT INTO likes VALUES(NULL,2,4,CURTIME(),CURTIME());
INSERT INTO likes VALUES(NULL,3,1,CURTIME(),CURTIME());
INSERT INTO likes VALUES(NULL,3,2,CURTIME(),CURTIME());
INSERT INTO likes VALUES(NULL,2,1,CURTIME(),CURTIME());









--Reiniciar auto_increment:
--ALTER TABLE likes AUTO_INCREMENT = 1
