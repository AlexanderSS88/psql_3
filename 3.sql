
CREATE TABLE If NOT EXISTS Singers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL);

CREATE TABLE If NOT EXISTS Albums (
	id_album SERIAL PRIMARY KEY,
	id_singer INTEGER,
	title VARCHAR(50) NOT NULL,
	year_production INTEGER CHECK (year_production > 1850 AND year_production < 2023));
               
CREATE TABLE If NOT EXISTS Tracks (
	id_track SERIAL PRIMARY KEY,
	id_album INTEGER REFERENCES Albums(id_album),
	title VARCHAR(100) NOT NULL,
	duration VARCHAR(30) NOT NULL);

CREATE TABLE If NOT EXISTS Genre (
	id_genre SERIAL PRIMARY KEY,
	genre VARCHAR(50) NOT NULL,
	id_singer INTEGER NOT NULL REFERENCES Singers(id));

CREATE TABLE If NOT EXISTS Singers_and_genres (
	id_singer INTEGER NOT NULL REFERENCES Singers(id),
	id_genre INTEGER NOT NULL REFERENCES Genre(id_genre),
	CONSTRAINT Sing_and_genr_pk PRIMARY KEY (id_singer, id_genre));

CREATE TABLE If NOT EXISTS Albums_and_singers (
	id_sing INTEGER NOT NULL REFERENCES Singers(id),
	id_album INTEGER NOT NULL REFERENCES Albums(id_album),
	CONSTRAINT Alb_and_sing_pk PRIMARY KEY (id_sing, id_album));

CREATE TABLE If NOT EXISTS Collection (
	id_collection SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	year_production INTEGER CHECK (year_production > 1850 AND year_production < 2023),
	track_id INTEGER REFERENCES Tracks(id_track));

CREATE TABLE If NOT EXISTS Collection_and_tracks (
	id_collection SERIAL PRIMARY KEY,
	id_track INTEGER NOT NULL REFERENCES Tracks(id_track),
	id_album INTEGER NOT NULL REFERENCES Albums(id_album));
