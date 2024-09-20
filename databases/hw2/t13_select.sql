select g
from student20.t1_genre g
where g.id not in
      (select ge.id
       from student20.t1_genre ge
                join student20.t1_track tr on tr.genre_id = ge.id
       group by ge.id);