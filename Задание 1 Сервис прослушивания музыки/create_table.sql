

CREATE TABLE IF NOT EXISTS student06.tb_artist();
ALTER TABLE IF EXISTS student06.tb_artist
    ADD COLUMN IF NOT EXISTS artist_id               BIGSERIAL,
    ADD COLUMN IF NOT EXISTS artist_name             VARCHAR;
COMMENT ON TABLE  student06.tb_artist                             IS 'Таблица исполнитель';
COMMENT ON COLUMN student06.tb_artist.artist_id                   IS 'Идентификатор исполнителя';
COMMENT ON COLUMN student06.tb_artist.artist_name                 IS 'Имя исполнителя';
DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_artist''
              and lower(table_schema) = ''student06''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student06.tb_artist ADD primary key (artist_id);
    END IF;
END ';


CREATE TABLE IF NOT EXISTS student06.tb_genres();
ALTER TABLE IF EXISTS student06.tb_genres
    ADD COLUMN IF NOT EXISTS genres_id               BIGSERIAL,
    ADD COLUMN IF NOT EXISTS genres_name             VARCHAR;
COMMENT ON TABLE  student06.tb_genres                             IS 'Таблица жанров';
COMMENT ON COLUMN student06.tb_genres.genres_id                   IS 'Идентификатор жанра';
COMMENT ON COLUMN student06.tb_genres.genres_name                 IS 'Название жанра';
DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_genres''
              and lower(table_schema) = ''student06''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student06.tb_genres ADD primary key (genres_id);
    END IF;
END ';


CREATE TABLE IF NOT EXISTS student06.tb_album();
ALTER TABLE IF EXISTS student06.tb_album
    ADD COLUMN IF NOT EXISTS album_id               BIGSERIAL,
    ADD COLUMN IF NOT EXISTS album_name             VARCHAR,
    ADD COLUMN IF NOT EXISTS artist_id              INT,
    ADD COLUMN IF NOT EXISTS release_year           INT,
    ADD COLUMN IF NOT EXISTS genre_id               INT;
COMMENT ON TABLE  student06.tb_album                             IS 'Таблица альбом';
COMMENT ON COLUMN student06.tb_album.album_id                    IS 'Идентификатор альбома';
COMMENT ON COLUMN student06.tb_album.album_name                  IS 'Название альбома';
COMMENT ON COLUMN student06.tb_album.artist_id                   IS 'Идентификатор исполнителя';
COMMENT ON COLUMN student06.tb_album.release_year                IS 'Год выпуска';
COMMENT ON COLUMN student06.tb_album.genre_id                    IS 'Идентификатор жанра';
DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_album''
              and lower(table_schema) = ''student06''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student06.tb_album ADD primary key (album_id);
        ALTER TABLE student06.tb_album ADD FOREIGN KEY (artist_id) REFERENCES tb_artist(artist_id);
        ALTER TABLE student06.tb_album ADD FOREIGN KEY (genre_id) REFERENCES tb_genres(genre_id);
    END IF;
END ';



CREATE TABLE IF NOT EXISTS student06.tb_track();
ALTER TABLE IF EXISTS student06.tb_track
    ADD COLUMN IF NOT EXISTS track_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS track_name                VARCHAR,
    ADD COLUMN IF NOT EXISTS album_id                  INT,
    ADD COLUMN IF NOT EXISTS genre_id                  INT,
    ADD COLUMN IF NOT EXISTS duration                  TIME,
    ADD COLUMN IF NOT EXISTS listen_count              INT,
    ADD COLUMN IF NOT EXISTS release_year              INT 
;
COMMENT ON TABLE  student06.tb_track                             IS 'Таблица Музыкальный Трек';
COMMENT ON COLUMN student06.tb_track.track_id                    IS 'Идентификатор трека';
COMMENT ON COLUMN student06.tb_track.track_name                  IS 'Имя трека';
COMMENT ON COLUMN student06.tb_track.album_id                    IS 'Идентификатор альбома';
COMMENT ON COLUMN student06.tb_track.genre_id                    IS 'Идентификатор жанра';
COMMENT ON COLUMN student06.tb_track.duration                    IS 'Продолжительность трека';
COMMENT ON COLUMN student06.tb_track.listen_count                IS 'Количесвто прослушиваний';
COMMENT ON COLUMN student06.tb_track.release_year                IS 'Год создания трека';
DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_track''
              and lower(table_schema) = ''student06''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student06.tb_track ADD primary key (track_id);
        ALTER TABLE student06.tb_track ADD FOREIGN KEY (album_id) REFERENCES tb_album(album_id);
        ALTER TABLE student06.tb_track ADD FOREIGN KEY (genre_id) REFERENCES tb_genres(genre_id);
    END IF;
END ';



CREATE TABLE IF NOT EXISTS student06.tb_track_artists();
ALTER TABLE IF EXISTS student06.tb_track_artists
    ADD COLUMN IF NOT EXISTS track_id              BIGSERIAL,
    ADD COLUMN IF NOT EXISTS artist_id             BIGSERIAL;
COMMENT ON TABLE  student06.tb_track_artists                             IS 'Промежуточная таблица для связи треков и исполнителей';
COMMENT ON COLUMN student06.tb_track_artists.track_id                    IS 'Идентификатор трека';
COMMENT ON COLUMN student06.tb_track_artists.artist_id                   IS 'Идентификатор исполнителя';
DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_track_artists''
              and lower(table_schema) = ''student06''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student06.tb_track_artists ADD primary key (track_id artist_id);
        ALTER TABLE student06.tb_track_artists ADD FOREIGN KEY (track_id) REFERENCES tb_track(track_id);
        ALTER TABLE student06.tb_track_artists ADD FOREIGN KEY (artist_id) REFERENCES tb_artist(artist_id);
    END IF;
END ';
