create database quizWebsite;
use quizWebsite;


drop table if exists matching_answers;
drop table if exists multiple_choice_answers;
drop table if exists open_ended_answers;
drop table if exists questions;
drop table if exists quizzes;

create table quizzes(

	quiz_id int unsigned auto_increment primary key,
	quiz_name varchar(50) not null,
	author_id int unsigned not null,
  description text
);


create table questions(

	id int unsigned auto_increment primary key,
    quiz_id int unsigned not null,
    foreign key (quiz_id) references quizzes(quiz_id),
    description text,
    ind int unsigned not null,
    question_type int

);

create table open_ended_answers(

	id int unsigned auto_increment primary key,
    question_id int unsigned not null,
    foreign key(question_id) references questions(id),
	answer varchar(30)
);

create table multiple_choice_answers(

	id int unsigned auto_increment primary key,
    question_id int unsigned not null,
    foreign key(question_id) references questions(id),
	choice varchar(30),
    correct int
);




create table matching_answers(

	id int unsigned auto_increment primary key,
    question_id int unsigned not null,
    foreign key(question_id) references questions(id),
	match_key varchar(30),
    match_value varchar(30)
);
