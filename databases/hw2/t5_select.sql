select tr
from student20.t1_track tr
         inner join student20.t1_genre ge on ge.id = tr.genre_id and ge.name = 'Rap'
where tr.listen_count > 30000;