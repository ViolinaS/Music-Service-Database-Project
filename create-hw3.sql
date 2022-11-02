
CREATE TABLE IF NOT EXISTS Genres (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(60) NOT NULL,
release_year INTEGER
);

CREATE TABLE IF NOT EXISTS Singer (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(60) NOT NULL,
release_year INTEGER
);

CREATE TABLE IF NOT EXISTS Music_Tracks (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(60) NOT NULL,
album_id INTEGER REFERENCES Album(id),
duration TIME
);

CREATE TABLE IF NOT EXISTS Tracks_collection (
music_tracks_id INTEGER REFERENCES Music_tracks(id),
collection_id INTEGER REFERENCES Collection(id),
CONSTRAINT pk_tracks_collection PRIMARY KEY (music_tracks_id, collection_id)
);

CREATE TABLE singer_genres (
genres_id INTEGER REFERENCES Genres(id),
singer_id INTEGER REFERENCES Singer(id),
CONSTRAINT genres_singer_pkey PRIMARY KEY (genres_id, singer_id) -- связь между жанрами и исполнителями
);

CREATE TABLE album_singer (
singer_id INTEGER REFERENCES Singer(id),
album_id INTEGER REFERENCES Album(id),
CONSTRAINT pk_singer_album PRIMARY KEY (singer_id, album_id) -- связь между исполнителями и альбомами
);
