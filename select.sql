-- Название и продолжительность самого длительного трека
SELECT title, MAX(duration) as duration 
FROM Tracks;

-- Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT title 
FROM Tracks 
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title 
FROM Compilations 
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name 
FROM Artists 
WHERE name NOT LIKE '% %';

-- Названия треков, которые содержат слово "мой"
SELECT title 
FROM Tracks 
WHERE LOWER(title) LIKE '%мой%' OR LOWER(title) LIKE '%my%';