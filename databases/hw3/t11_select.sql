insert into student20.t1_author values ('fbd497bd-df48-4dfb-aa00-5fe1eefc1631', 'Борис Пастернак');
insert into student20.t1_book
values ('32a91be8-1063-4b92-ae76-42e33650562c', 'Доктор Живаго', 1955, 20300, 660,
        'fbd497bd-df48-4dfb-aa00-5fe1eefc1631', null);

select ge from student20.t1_genre ge
where ge.id not in
      (select distinct bo.genre_id from student20.t1_book bo where bo.genre_id is not null);