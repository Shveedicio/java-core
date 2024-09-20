select ar
from student20.t1_artist ar
         join student20.t1_track tr
              on tr.artist_id = ar.id
                  and tr.genre_id = (select ge.id from student20.t1_genre ge where ge.name = 'Jazz');