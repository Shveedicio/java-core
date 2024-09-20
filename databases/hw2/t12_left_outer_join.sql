select ar.name, tr.name
from student20.t1_artist ar
         left outer join student20.t1_track tr on tr.artist_id = ar.id
group by ar.name, tr.name;