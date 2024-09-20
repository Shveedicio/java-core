select a.*
from student20.t1_artist a
         inner join student20.t1_track tr on a.id = tr.artist_id
         inner join student20.t1_genre g on tr.genre_id = g.id
where g.name = 'Jazz'
group by a.id
having avg(listen_count) > 20000000;