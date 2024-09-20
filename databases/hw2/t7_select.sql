select sum(tr.listen_count)
from student20.t1_track tr
         inner join student20.t1_genre ge on ge.id = tr.genre_id
where ge.name = 'Rap';