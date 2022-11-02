-- название и год выхода альбомов, вышедших в 2018 году
SELECT name, release_year  FROM album WHERE release_year = '2018';

-- название и продолжительность самого длительного трека
SELECT name, duration FROM music_tracks WHERE duration = (SELECT max(duration) FROM music_tracks);

-- название треков, продолжительность которых не менее 3,5 минуты
SELECT name FROM music_tracks WHERE duration >= '00:03:30';

-- название треков, продолжительность которых не менее 3 часов и 3,5 минут
SELECT name FROM music_tracks WHERE duration >= '03:03:30';

-- названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name, release_year FROM collection WHERE release_year BETWEEN '2018' AND '2020';

-- исполнители, чье имя состоит из 1 слова
SELECT name FROM singer WHERE name NOT LIKE '%% %%';

-- название треков, которые содержат слово “мой”/“my”
SELECT name FROM music_tracks WHERE name iLIKE '%my%';