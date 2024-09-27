select ge.name, sum(b.downloads) from student20.t1_book b join student20.t1_genre ge on ge.id = b.genre_id
group by ge.name, genre_id;