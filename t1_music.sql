-- Java Middle Developer. Домашнее задание №1.
-- Автор: Шведков Иван Олегович

--Таблица ARTIST - Исполнитель

create table if not exists student20.t1_artist
(
);

alter table if exists student20.t1_artist
    add column if not exists id      bigserial
        constraint pl_t1_artist primary key,
    add column if not exists name    varchar(128),
    add column if not exists country varchar(128);

comment on table student20.t1_artist is 'Исполнитель';
comment on column student20.t1_artist.id is 'Уникальный идентификатор исполнителя (PK)';
comment on column student20.t1_artist.name is 'Имя исполнителя';
comment on column student20.t1_artist.country is 'Страна исполнителя';

--Таблица ALBUM - Альбом

create table if not exists student20.t1_album
(
);

alter table student20.t1_artist
    owner to student20;

alter table if exists student20.t1_album
    add column if not exists id           bigserial
        constraint pk_t1_album primary key,
    add column if not exists artist_id    bigserial references student20.t1_artist (id),
    add column if not exists release_date timestamp,
    add column if not exists genre        varchar(64);

comment on table student20.t1_album is 'Альбом';
comment on column student20.t1_album.id is 'Уникальный идентификатор альбома (PK)';
comment on column student20.t1_album.artist_id is 'Идентификатор исполнителя (FK)';
comment on column student20.t1_album.release_date is 'Дата выхода альбома';
comment on column student20.t1_album.genre is 'Жанр альбома';

--Таблица TRACK - Музыкальная композиция

create table if not exists student20.t1_track
(
);

alter table if exists student20.t1_track
    add column if not exists id               bigserial
        constraint pk_t1_track primary key,
    add column if not exists artist_id        bigserial references student20.t1_artist (id),
    add column if not exists album_id         bigserial references student20.t1_album (id),
    add column if not exists release_date     timestamp,
    add column if not exists duration_seconds smallint,
    add column if not exists listen_count     bigint default 0,
    add column if not exists genre            varchar(64);

comment on table student20.t1_track is 'Музыкальная композиция';
comment on column student20.t1_track.id is 'Уникальный идентификатор композиции (PK)';
comment on column student20.t1_track.artist_id is 'Уникальный идентификатор автора (FK)';
comment on column student20.t1_track.album_id is 'Уникальный идентификатор альбома (FK)';
comment on column student20.t1_track.release_date is 'Дата релиза композиции (год)';
comment on column student20.t1_track.duration_seconds is 'Длительность композиции в секундах';
comment on column student20.t1_track.listen_count is 'Количество прослушиваний';
comment on column student20.t1_track.genre is 'Жанр композиции';

-- В данной структуре используются следующие связи:
-- Один-ко-многим - сущность artist относится к сущности album как одни ко многим, поскольку у одного исполнителя
-- может быть много альбомов.
-- Один-ко-многим (или многие-к-одному) - сущность track относится к сущностям album и artist как многие к одному,
-- поскольку много музыкальных композиций относятся к одному альбому, равно как несколько альбомов к одному исполнителю.

-- Первичные ключи: t1_artist.id, t1_album.id, t1_track.id
-- Внешние ключи: t1_album.artist_id, t1_track.artist_id, t1_track.album_id

-- Таблицы выстроены в следующей иерархии (от родительских к дочерним): t1_artist -> t1_album -> t1_track
