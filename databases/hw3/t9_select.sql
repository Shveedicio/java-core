select au.name, count(b) from student20.t1_book b join student20.t1_author au on au.id = b.author_id
group by au.name, author_id;