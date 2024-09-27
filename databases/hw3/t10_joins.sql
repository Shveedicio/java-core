insert into student20.t1_genre
values ('f654a763-dd57-4ea0-82b6-8acf3527fc32', 'Детектив'),
       ('b1050e27-aaa6-4fb6-9612-cdf075bb1d14', 'Фэнтези'),
       ('9e386289-7867-495e-810f-1204a0d4aedf', 'Биография');

select au.name, ge.name, b.name from student20.t1_book b
                                         inner join student20.t1_author au on b.author_id = au.id
                                         inner join student20.t1_genre ge on b.genre_id = ge.id;
select au.name, ge.name, b.name from student20.t1_book b
                                         left outer join student20.t1_author au on b.author_id = au.id
                                         left outer join student20.t1_genre ge on b.genre_id = ge.id;
select au.name, ge.name, b.name from student20.t1_book b
                                         right outer join student20.t1_author au on b.author_id = au.id
                                         right outer join student20.t1_genre ge on b.genre_id = ge.id;
select au.name, ge.name, b.name from student20.t1_book b
                                         full join student20.t1_author au on b.author_id = au.id
                                         full join student20.t1_genre ge on b.genre_id = ge.id;