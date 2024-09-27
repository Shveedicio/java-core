-- Java Middle Developer. Домашнее задание №2.
-- Автор: Шведков Иван Олегович

--Таблица AUTHOR - Писатель (автор книги)

create table if not exists student20.t1_author
(
);

alter table if exists student20.t1_author
    add column if not exists id   uuid
        constraint pk_t1_author primary key,
    add column if not exists name varchar(128);

comment on table student20.t1_author is 'Писатель';
comment on column student20.t1_author.id is 'Уникальный идентификатор писателя (PK)';
comment on column student20.t1_author.name is 'Имя писателя';

--Таблица GENRE - Жанр книги
create table if not exists student20.t1_genre
(
);

alter table if exists student20.t1_genre
    add column if not exists id   uuid
        constraint pk_t1_genre primary key,
    add column if not exists name varchar(128);

comment on table student20.t1_genre is 'Жанр';
comment on column student20.t1_genre.id is 'Уникальный идентификатор жанра (PK)';
comment on column student20.t1_genre.name is 'Название жанра';

--Таблица BOOK - Электронная книга

create table if not exists student20.t1_book
(
    id               uuid    not null,
    name             varchar(128),
    publication_year int,
    downloads        integer not null,
    pages            integer,
    author_id        uuid references student20.t1_author (id),
    genre_id         uuid references student20.t1_genre (id)
) partition by range (downloads);

comment on table student20.t1_book is 'Электронная книга';
comment on column student20.t1_book.id is 'Уникальный идентификатор электронной книги (PK)';
comment on column student20.t1_book.name is 'Название книги';
comment on column student20.t1_book.publication_year is 'Дата издания книги';
comment on column student20.t1_book.downloads is 'Количество скачиваний';
comment on column student20.t1_book.pages is 'Количество страниц в книге';
comment on column student20.t1_book.author_id is 'Уникальный идентификатор автора книги (FK)';
comment on column student20.t1_book.genre_id is 'Уникальный идентификатор жанра (FK)';

create table if not exists student20.t1_book_0 partition of student20.t1_book
    for values from (0) to (1000);

create table if not exists student20.t1_book_1 partition of student20.t1_book
    for values from (1000) to (10000);

create table if not exists student20.t1_book_2 partition of student20.t1_book
    for values from (10000) to (10001);

create table if not exists student20.t1_book_default partition of student20.t1_book default;





