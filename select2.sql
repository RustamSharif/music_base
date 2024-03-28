-- Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS num_artists 
FROM Genres g 
JOIN ArtistGenres ag ON g.genre_id = ag.genre_id 
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) AS num_tracks 
FROM Tracks t 
JOIN Albums a ON t.album_id = a.album_id 
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title, AVG(t.duration) AS avg_duration 
FROM Tracks t 
JOIN Albums a ON t.album_id = a.album_id 
GROUP BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name 
FROM Artists ar 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Albums a 
    JOIN AlbumArtists aa ON a.album_id = aa.album_id 
    WHERE aa.artist_id = ar.artist_id AND a.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT c.title 
FROM Compilations c 
JOIN CompilationTracks ct ON c.compilation_id = ct.compilation_id 
JOIN Tracks tr ON ct.track_id = tr.track_id 
JOIN Albums a ON tr.album_id = a.album_id 
JOIN AlbumArtists aa ON a.album_id = aa.album_id 
WHERE aa.artist_id = 1;