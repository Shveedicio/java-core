select a.*
from student20.t1_artist a
         inner join student20.t1_album al
                    on a.id = al.artist_id
         inner join student20.t1_genre g
                    on al.genre_id = g.id
where g.name not like 'Jazz';