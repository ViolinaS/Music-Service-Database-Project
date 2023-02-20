-- «Продвинутая выборка данных»

-- количество исполнителей в каждом жанре;
SELECT genres.name, count(singer.name) AS singers_in_genre FROM genres
JOIN singer_genres ON genres.id = singer_genres.genres_id 
JOIN singer ON singer_genres.singer_id = singer.id 
GROUP BY genres.name
ORDER BY count(singer_id) DESC;

-- количество треков, вошедших в альбомы 2019-2020 годов
SELECT album.name AS album, album.release_year, count(music_tracks.name) AS tracks_in_albums FROM album
JOIN music_tracks ON music_tracks.album_id = album.id
GROUP BY album.name, album.release_year
HAVING album.release_year BETWEEN '2019' AND '2020';

-- средняя продолжительность треков по каждому альбому
SELECT album.name AS album, avg(music_tracks.duration) AS average_songs_duration FROM album
JOIN music_tracks ON music_tracks.album_id = album.id 
GROUP BY album.name
ORDER BY avg(music_tracks.duration);

-- все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT singer.name AS singer FROM singer
WHERE singer.name NOT IN
(SELECT DISTINCT singer.name AS singer FROM singer
JOIN album_singer ON singer.id = album_singer.singer_id  
JOIN album ON album_singer.album_id = album.id
WHERE album.release_year = 2020)
ORDER BY singer.name;

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT collection.name AS sbornik, singer.name AS singer FROM collection
LEFT JOIN tracks_collection ON collection.id = tracks_collection.collection_id 
LEFT JOIN music_tracks ON tracks_collection.music_tracks_id = music_tracks.id 
LEFT JOIN album ON music_tracks.album_id = album.id 
LEFT JOIN album_singer ON album.id = album_singer.album_id 
LEFT JOIN singer ON album_singer.singer_id = singer.id
WHERE singer.id = 9
GROUP BY singer.name, collection.name;

-- название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT album.name AS album FROM album
LEFT JOIN album_singer ON album.id = album_singer.album_id
LEFT JOIN singer ON singer.id = album_singer.singer_id 
LEFT JOIN singer_genres ON singer.id = singer_genres.singer_id 
LEFT JOIN genres ON genres.id = singer_genres.genres_id 
GROUP BY album.name
HAVING count(distinct genres.name) > 1
ORDER BY album.name;

-- наименование треков, которые не входят в сборники
SELECT music_tracks.name AS song FROM music_tracks
WHERE NOT EXISTS
(SELECT FROM tracks_collection WHERE tracks_collection.music_tracks_id  = music_tracks.id);

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT singer.name AS singer, music_tracks.duration, music_tracks.name AS song FROM music_tracks
LEFT JOIN album ON album.id = music_tracks.album_id
LEFT JOIN album_singer ON album_singer.album_id = album.id
LEFT JOIN singer ON singer.id = album_singer.singer_id
GROUP BY singer.name, music_tracks.duration, music_tracks.name
HAVING music_tracks.duration = (SELECT min(duration) FROM music_tracks)
ORDER BY singer.name; 

-- название альбомов, содержащих наименьшее количество треков
SELECT DISTINCT album."name" AS album FROM album
JOIN music_tracks ON music_tracks.album_id = album.id
WHERE music_tracks.album_id IN
(SELECT album_id FROM music_tracks
GROUP BY album_id
HAVING count (album_id) = (SELECT count(album_id) FROM music_tracks
GROUP BY album_id
ORDER BY count(album_id)
LIMIT 1))
ORDER BY album."name";
