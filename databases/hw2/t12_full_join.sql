select tr.name, ar.name
from student20.t1_track tr
         full join student20.t1_artist ar on tr.artist_id = ar.id
group by ar.name, tr.name;