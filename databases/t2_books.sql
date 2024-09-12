-- Java Middle Developer. Домашнее задание №2.
-- Автор: Шведков Иван Олегович

--Таблица AUTHOR - Писатель (автор книги)

create table if not exists student20.t2_author
(
);

alter table if exists student20.t2_author
    add column if not exists id         bigserial
        constraint pl_t2_author primary key,
    add column if not exists name       varchar(128),
    add column if not exists country    varchar(128),
    add column if not exists birth_date timestamp;

comment on table student20.t2_author is 'Писатель';
comment on column student20.t2_author.id is 'Уникальный идентификатор писателя (PK)';
comment on column student20.t2_author.name is 'Имя писателя';
comment on column student20.t2_author.country is 'Страна писателя';
comment on column student20.t2_author.birth_date is 'Дата рождения писателя';

--Таблица CLIENT - Клиент сервиса покупки электронных книг

create table if not exists student20.t2_client
(
);

alter table if exists student20.t2_client
    add column if not exists id                bigserial
        constraint pl_t2_client primary key,
    add column if not exists name              varchar(128),
    add column if not exists email             varchar(128),
    add column if not exists password          varchar(128),
    add column if not exists country           varchar(128),
    add column if not exists registration_date timestamp,
    add column if not exists balance           numeric;

comment on table student20.t2_client is 'Клиент сервиса';
comment on column student20.t2_client.id is 'Уникальный идентификатор клиента сервиса (PK)';
comment on column student20.t2_client.name is 'ФИО клиента';
comment on column student20.t2_client.email is 'Почтовый адрес';
comment on column student20.t2_client.password is 'Пароль';
comment on column student20.t2_client.country is 'Страна';
comment on column student20.t2_client.registration_date is 'Дата регистрации в сервисе';
comment on column student20.t2_client.balance is 'Баланс электронного кошелька';

--Таблица BOOK - Электронная книга

create table if not exists student20.t2_book
(
);

alter table if exists student20.t2_book
    add column if not exists id               bigserial
        constraint pl_t2_book primary key,
    add column if not exists name             varchar(128),
    add column if not exists description      varchar(128),
    add column if not exists publication_date timestamp,
    add column if not exists publishing       varchar(128),
    add column if not exists price            numeric,
    add column if not exists language         varchar(32),
    add column if not exists author_id        bigserial references student20.t2_author (id);

comment on table student20.t2_book is 'Электронная книга';
comment on column student20.t2_book.id is 'Уникальный идентификатор электронной книги (PK)';
comment on column student20.t2_book.name is 'Название книги';
comment on column student20.t2_book.description is 'Описание книги';
comment on column student20.t2_book.publication_date is 'Дата издания книги';
comment on column student20.t2_book.publishing is 'Название издательства';
comment on column student20.t2_book.price is 'Цена';
comment on column student20.t2_book.language is 'Язык перевода';
comment on column student20.t2_book.author_id is 'Уникальный идентификатор автора книги (FK)';

--Таблица TRANSACTION - Транзакция операции

create table if not exists student20.t2_transaction
(
);

alter table if exists student20.t2_transaction
    add column if not exists id               bigserial
        constraint pl_t2_transaction primary key,
    add column if not exists client_id        bigserial references student20.t2_client (id),
    add column if not exists book_id          bigserial references student20.t2_book (id),
    add column if not exists transaction_date timestamp default current_timestamp,
    add column if not exists price            numeric,
    add column if not exists fees             numeric   default 0;

comment on table student20.t2_transaction is 'Транзакция операции';
comment on column student20.t2_transaction.id is 'Уникальный идентификатор транзакции (PK)';
comment on column student20.t2_transaction.client_id is 'Уникальный идентификатор клиента (FK)';
comment on column student20.t2_transaction.book_id is 'Уникальный идентификатор книги (FK)';
comment on column student20.t2_transaction.transaction_date is 'Дата выполнения траназакции';
comment on column student20.t2_transaction.price is 'Цена';
comment on column student20.t2_transaction.fees is 'Комиссия';

--Таблица PAYMENT - Оплата покупки

create table if not exists student20.t2_payment
(
);

alter table if exists student20.t2_payment
    add column if not exists id             bigserial
        constraint pl_t2_payment primary key,
    add column if not exists client_id      bigserial references student20.t2_client (id),
    add column if not exists transaction_id bigserial references student20.t2_transaction (id),
    add column if not exists payment_system varchar(64),
    add column if not exists payment_date   timestamp,
    add column if not exists price          numeric,
    add column if not exists fees           numeric;

comment on table student20.t2_payment is 'Оплата опкупки';
comment on column student20.t2_payment.id is 'Уникальный идентификатор оплаты (PK)';
comment on column student20.t2_payment.client_id is 'Уникальный идентификатор клиента (FK)';
comment on column student20.t2_payment.transaction_id is 'Уникальный идентификатор транзакции (FK)';
comment on column student20.t2_payment.payment_date is 'Дата выполнения оплаты';
comment on column student20.t2_payment.price is 'Цена';
comment on column student20.t2_payment.fees is 'Комиссия';

-- В данной структуре используются следующие связи:
-- Один-ко-многим (многие-к-одному) - t2_book -> t2_author, t2_transaction -> t2_client, t2_payment -> t2_client,
-- t2_transaction -> t2_book
-- Один-к-одному - t2_payment -> t2_transaction

-- Все первичные и внешние ключи указаны в описаниях полей таблиц

-- Перечисление родительских таблиц в формате "родительская -> дочерняя":
-- t2_author -> t2_book, t2_client -> t2_transaction, t2_transaction -> t2_payment, t2_client -> t2_payment,
-- t2_transaction -> t2_book

