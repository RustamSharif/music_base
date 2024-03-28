-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT al.title
FROM Albums al
JOIN AlbumArtists aa ON al.album_id = aa.album_id
WHERE aa.artist_id IN (
    SELECT ag.artist_id
    FROM ArtistGenres ag
    GROUP BY ag.artist_id
    HAVING COUNT(ag.genre_id) > 1
);

-- Наименования треков, которые не входят в сборники.
SELECT t.title
FROM Tracks t
LEFT JOIN CompilationTracks ct ON t.track_id = ct.track_id
WHERE ct.compilation_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT ar.name
FROM Artists ar
JOIN AlbumArtists aa ON ar.artist_id = aa.artist_id
JOIN Albums al ON aa.album_id = al.album_id
JOIN Tracks t ON al.album_id = t.album_id
WHERE t.duration = (
    SELECT MIN(duration)
    FROM Tracks
);

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT al.title
FROM Albums al
JOIN Tracks t ON al.album_id = t.album_id
GROUP BY al.title
HAVING COUNT(t.track_id) = (
    SELECT COUNT(t.track_id)
    FROM Tracks t
    JOIN Albums al2 ON t.album_id = al2.album_id
    GROUP BY al2.album_id
    ORDER BY COUNT(t.track_id) ASC
    LIMIT 1
);