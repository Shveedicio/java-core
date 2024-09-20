-- Java Middle Developer. Домашнее задание №2.
-- Автор: Шведков Иван Олегович

insert into student20.t1_genre (id, name, description)
values ('5e4ab76e-e404-4133-aee8-7ee779035b76',
        'Jazz',
        'Relaxing music born in USA at XX century.' ||
        ' The quintessence of rhythm, improvisation and synchronisation'),
       ('d8f43031-15a3-4792-9ea4-28c6d60925d1',
        'Rap',
        'Modern genre represented by rhyming, freestyling and emceeing covered by bit.');

insert into student20.t1_artist (id, name, country)
values ('e493e36d-d7d7-4401-b1a6-2ff0aa7bc325', 'Eminem', 'USA'),
       ('cc27d759-db82-4dc9-a8b1-137a739e74a3', 'Louis Armstrong', 'USA');

insert into student20.t1_album (id, name, release_date, artist_id, genre_id)
values ('045d0394-db15-45b7-928f-86e10c41aabc',
        'The Marshall Mathers LP',
        '05-23-2000 00:00:00.000',
        'e493e36d-d7d7-4401-b1a6-2ff0aa7bc325',
        'd8f43031-15a3-4792-9ea4-28c6d60925d1'),
       ('424c7500-440a-4305-aa87-6faf37a02b6d',
        'What a Wonderful World',
        '09-01-1967 00:00:00.000',
        'cc27d759-db82-4dc9-a8b1-137a739e74a3',
        '5e4ab76e-e404-4133-aee8-7ee779035b76');

insert into student20.t1_track (id, name, artist_id, album_id, release_date, duration_seconds, listen_count, genre_id)
values ('8c6a24cd-44e3-4e31-973c-71193d579960',
        'Stan',
        'e493e36d-d7d7-4401-b1a6-2ff0aa7bc325',
        '045d0394-db15-45b7-928f-86e10c41aabc',
        '05-23-2000 00:00:00.000',
        405,
        53943688,
        'd8f43031-15a3-4792-9ea4-28c6d60925d1'),
       ('eb3c29e4-c466-4498-8e54-e03cc3446866',
        'What a Wonderful World',
        'cc27d759-db82-4dc9-a8b1-137a739e74a3',
        '424c7500-440a-4305-aa87-6faf37a02b6d',
        '09-01-1967 00:00:00.000',
        182,
        93756279,
        '5e4ab76e-e404-4133-aee8-7ee779035b76');