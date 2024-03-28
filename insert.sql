-- Жанры
INSERT INTO Genres (name) VALUES
('Pop'),
('Rock'),
('Hip-Hop'),
('Electronic');

-- Исполнители
INSERT INTO Artists (name) VALUES
('Иван Дорн'),
('Монеточка'),
('Каста'),
('Noize MC'),
('Земфира'),
('Градусы');

-- Альбомы
INSERT INTO Albums (title, release_year) VALUES
('ОТРАЖЕНИЕ', 2020),
('Раскраски для взрослых', 2017),
('Виражи', 2019),
('Тоннель', 2013);

-- Треки
INSERT INTO Tracks (title, duration, album_id) VALUES
('Мой день', 180, 1),
('Мой космос', 210, 1),
('my generation', 230, 2),
('мой звонок', 200, 2),
('Это мой мир', 240, 3),
('Моя игра', 180, 3),
('My style', 190, 4),
('Твой май', 210, 4);

-- Альбомы и исполнители
INSERT INTO AlbumArtists (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 5),
(4, 4);

-- Сборники
INSERT INTO Compilations (title, release_year) VALUES
('Лучшее 2020', 2020),
('Весенний хит', 2021),
('Летние вечера', 2022),
('Осенние дожди', 2023);

-- Треки и сборники
INSERT INTO CompilationTracks (compilation_id, track_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8);

-- Связи исполнителей с жанрами
-- Предполагается, что IDs жанров и исполнителей начинаются с 1
INSERT INTO ArtistGenres (artist_id, genre_id) VALUES
(1, 1), -- Иван Дорн - Pop
(2, 1), -- Монеточка - Pop
(3, 3), -- Каста - Hip-Hop
(4, 3), -- Noize MC - Hip-Hop
(5, 2), -- Земфира - Rock
(6, 4); -- Градусы - Electronic