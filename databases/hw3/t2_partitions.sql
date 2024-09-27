create table if not exists student20.t1_book_0 partition of student20.t1_book
    for values from (0) to (1000);

create table if not exists student20.t1_book_1 partition of student20.t1_book
    for values from (1000) to (10000);

create table if not exists student20.t1_book_2 partition of student20.t1_book
    for values from (10000) to (10001);

create table if not exists student20.t1_book_default partition of student20.t1_book default;