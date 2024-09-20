select distinct ar.name, count(tr)
from student20.t1_track tr
         inner join student20.t1_artist ar on tr.artist_id = ar.id
group by ar.name;