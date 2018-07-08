use quizWebsite;

drop table if exists participations;
drop table if exists users;

create table users (
	id int unsigned auto_increment primary key,
    user_name varchar(20) not null,
    hash_password varchar(100) not null
);

create table participations(
	id int unsigned auto_increment primary key,
    quiz_id int unsigned not null,
    foreign key(quiz_id) references quizzes(quiz_id),
    user_id int unsigned not null,
    foreign key(user_id) references users(id),
    score int unsigned not null
);