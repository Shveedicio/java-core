select distinct ar.name, avg(tr.listen_count)
from student20.t1_track tr
         inner join student20.t1_artist ar on tr.artist_id = ar.id
group by ar.name
order by avg(tr.listen_count) desc;
