CREATE TABLE If NOT EXISTS Singers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	id_genre INTEGER CHECK (id_genre > 0)
	);

CREATE TABLE If NOT EXISTS Albums (
	id_album SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	year_production INTEGER CHECK (year_production > 1850 AND year_production < 2023)
	);
               
CREATE TABLE If NOT EXISTS Tracks (
	id_track SERIAL PRIMARY KEY,
	id_album INTEGER REFERENCES Albums(id_album),
	title VARCHAR(100) NOT NULL,
	duration VARCHAR(30) NOT NULL	
	);

CREATE TABLE IF NOT EXISTS Genre (
	id_genre SERIAL PRIMARY KEY,
	title VARCHAR(50) 
    );
   
CREATE TABLE IF NOT EXISTS Genre_singers (
	id_genre INTEGER REFERENCES Genre(id_genre),
	id_singer INTEGER REFERENCES Singers(id),
	CONSTRAINT Genre_singers_pk PRIMARY KEY (id_genre, id_singer)
	);
              
CREATE TABLE If NOT EXISTS Albums_and_singers (
	id_sing INTEGER NOT NULL REFERENCES Singers(id),
	id_album INTEGER NOT NULL REFERENCES Albums(id_album),
	CONSTRAINT Alb_and_sing_pk PRIMARY KEY (id_sing, id_album)
	);

CREATE TABLE If NOT EXISTS Collection (
	id_collection SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	year_production INTEGER CHECK (year_production > 1850 AND year_production < 2023)
	);

CREATE TABLE If NOT EXISTS Collection_and_tracks (
	id_collection INTEGER NOT NULL REFERENCES Collection(id_collection),
	id_track INTEGER NOT NULL REFERENCES Tracks(id_track),
	CONSTRAINT Coll_and_track_pk PRIMARY KEY (id_collection, id_track)
	);

















