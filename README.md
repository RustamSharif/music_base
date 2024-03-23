# music_base

 -- Создание таблицы Жанров
CREATE TABLE Genres (
    GenreID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Создание таблицы Исполнителей
CREATE TABLE Artists (
    ArtistID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Создание таблицы Альбомов
CREATE TABLE Albums (
    AlbumID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL
);

-- Создание таблицы Треков
CREATE TABLE Tracks (
    TrackID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Duration INT NOT NULL,
    AlbumID INT NOT NULL,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

-- Создание таблицы Сборников
CREATE TABLE Collections (
    CollectionID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL
);

-- Создание связующей таблицы между Исполнителями и Жанрами
CREATE TABLE ArtistGenres (
    ArtistID INT NOT NULL,
    GenreID INT NOT NULL,
    PRIMARY KEY (ArtistID, GenreID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Создание связующей таблицы между Альбомами и Исполнителями
CREATE TABLE AlbumArtists (
    AlbumID INT NOT NULL,
    ArtistID INT NOT NULL,
    PRIMARY KEY (AlbumID, ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

-- Создание связующей таблицы между Сборниками и Треками
CREATE TABLE CollectionTracks (
    CollectionID INT NOT NULL,
    TrackID INT NOT NULL,
    PRIMARY KEY (CollectionID, TrackID),
    FOREIGN KEY (CollectionID) REFERENCES Collections(CollectionID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);
