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
genre_id INTEGER REFERENCES Genres(id),
album_id INTEGER REFERENCES Album(id),
name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(60) NOT NULL,
release_year INTEGER
);

CREATE TABLE IF NOT EXISTS Music_Tracks (
id INTEGER PRIMARY KEY REFERENCES Album(id),
name VARCHAR(60) NOT NULL,
duration NUMERIC(10,2)
);

CREATE TABLE IF NOT EXISTS Tracks_collection (
music_tracks_id INTEGER REFERENCES Music_tracks(id),
collection_id INTEGER REFERENCES Collection(id),
CONSTRAINT pk PRIMARY KEY (music_tracks_id, collection_id)
);

-- Исправления связей в таблицах

ALTER TABLE Singer 
DROP COLUMN genre_id CASCADE;

ALTER TABLE Singer 
DROP COLUMN album_id CASCADE;

-- Добавление новых таблиц для связи "многие ко многим"

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

-- Исправления типа поля в Music_Tracks(duration)
ALTER TABLE Music_Tracks
DROP COLUMN duration;

ALTER TABLE Music_Tracks
ADD COLUMN duration time;

-- Исправление имени констрейнта в Tracks_collection
ALTER TABLE Tracks_collection
RENAME CONSTRAINT pk TO pk_tracks_collection;
