select distinct ge.name, sum(tr.listen_count)
from student20.t1_track tr
         inner join student20.t1_genre ge on tr.genre_id = ge.id
group by ge.name, tr.listen_count
order by sum(tr.listen_count);