INSERT INTO singer (name)
VALUES('Michelle Hale');
INSERT INTO singer (name)
VALUES('Jennifer Underhill');
INSERT INTO singer (name)
VALUES('Barry Gordon');
INSERT INTO singer (name)
VALUES('Megan Higgs');
INSERT INTO singer (name)
VALUES('Luke Boyle');
INSERT INTO singer (name)
VALUES('Nicholas Mcneill');
INSERT INTO singer (name)
VALUES('Caitlyn');
INSERT INTO singer (name)
VALUES('Kieth Palmer');
INSERT INTO singer (name)
VALUES('Amelia');
INSERT INTO singer (name)
VALUES('Morris');

INSERT INTO album (name, release_year)
VALUES
('American Idol','2018'),
('Ragnarok','2019'),
('Limitless','2018'),
('Romeo and Juliet','2019'),
('Ice Age','2020'),
('Friends','2021'),
('Zootropolis','2020'),
('Terminator','2018'),
('Snatch','2022'),
('Chocolat','2020');

INSERT INTO genres (name)
VALUES
('Reggae'),
('country'),
('Baroque'),
('Soul'),
('Pop'),
('Jazz'),
('Blues'),
('Opera'),
('Drum & Bass'),
('House');

INSERT INTO music_tracks (name, album_id, duration)
VALUES
('Rolling In The Deep','10','1:43'),
('You Light Up My Life','10','2:25'),
('Lean on','1','3:01'),
('Sway','1','5:20'),
('I Gotta Feeling','3','2:35'),
('Flashdance...What A Feeling','4','3:40'),
('I Will Always Love You','4','3:25'),
('My Feelings','5','2:48'),
('We Belong Together','3','4:20'),
('Truly Madly Deeply','5','3:53'),
('Billionaire','7','2:46'),
('Physical','7','1:57'),
('Smooth','6','4:55'),
('My Familiar','6','5:37'),
('Baila Morena','2','1:11'),
('My Demons','2','2:29'),
('Cheap thrills','8','3:00'),
('Eye Of my Tiger','8','1:44'),
('Listen to my heart','9','3:42'),
('Bette Davis Eyes','9','1:32');

INSERT INTO music_tracks (name, album_id, duration)
VALUES ('Running', '9', '00:03:30');

INSERT INTO collection (name, release_year)
VALUES
('Cry','2019'),
('The Dark','2018'),
('Rain','2022'),
('Limit','2021'),
('Stoneheart','2018'),
('Moon','2018'),
('Requiem','2020'),
('Firestarter','2019'),
('The Ring','2020'),
('Interstellar','2022');

INSERT INTO tracks_collection (music_tracks_id, collection_id)
VALUES
(1,1);

INSERT INTO tracks_collection (music_tracks_id, collection_id)
VALUES
(generate_series(2, 10),generate_series(2, 10));

INSERT INTO tracks_collection (music_tracks_id, collection_id)
VALUES
(generate_series(11, 20),generate_series(1, 10));

INSERT INTO singer_genres (genres_id, singer_id)
VALUES
(generate_series(1, 10),generate_series(1, 10));

INSERT INTO singer_genres (genres_id, singer_id)
VALUES
(generate_series(3, 6),generate_series(7, 10));

-- Генерация album + singer: 
-- a). Альбом могут выпустить несколько исполнителей вместе. 
-- б). Исполнитель может принимать участие во множестве альбомов.
INSERT INTO album_singer (singer_id, album_id)
VALUES
(generate_series(1, 10),generate_series(1, 10));

INSERT INTO album_singer (singer_id, album_id)
VALUES
(generate_series(2, 5),generate_series(6, 9));
