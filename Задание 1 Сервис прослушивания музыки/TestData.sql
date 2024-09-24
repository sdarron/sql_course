-- 1. Вставка данных в таблицу Artists (Исполнители)
INSERT INTO tb_artists (artist_name) VALUES 
('Artist A'),
('Artist B'),
('Artist C');

-- 2. Вставка данных в таблицу Genres (Жанры)
INSERT INTO tb_genres (genres_name) VALUES 
('Pop'),
('Rock'),
('Jazz');

-- 3. Вставка данных в таблицу Albums (Альбомы)
INSERT INTO tb_album (album_name, artist_id, release_year, genre_id) VALUES 
('Album 1', 1, 2021, 1),  -- Artist A, Pop
('Album 2', 2, 2022, 2),  -- Artist B, Rock
('Album 3', 3, 2023, 3);  -- Artist C, Jazz

-- 4. Вставка данных в таблицу Tracks (Треки)
INSERT INTO tb_track (track_name, album_id, genre_id, duration, listen_count, release_year) VALUES 
('Track 1', 1, 1, '00:03:30', 100, 2021),  -- Album 1, Pop
('Track 2', 2, 2, '00:04:00', 200, 2022),  -- Album 2, Rock
('Track 3', 3, 3, '00:05:00', 300, 2023);  -- Album 3, Jazz

-- 5. Вставка данных в таблицу Track_Artists (Промежуточная таблица для связи треков и исполнителей)
-- Связь треков с несколькими исполнителями
INSERT INTO tb_track_artists (track_id, artist_id) VALUES 
(1, 1),  -- Track 1 исполняет Artist A
(1, 2),  -- Track 1 исполняет Artist B (коллаборация)
(2, 2),  -- Track 2 исполняет Artist B
(2, 3),  -- Track 2 исполняет Artist C (коллаборация)
(3, 3),  -- Track 3 исполняет Artist C
(3, 1);  -- Track 3 исполняет Artist A (коллаборация)
