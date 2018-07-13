drop database if exists quizWebsite;
create database quizWebsite;
use quizWebsite;


drop table if exists matching_answers;
drop table if exists multiple_choice_answers;
drop table if exists open_ended_answers;
drop table if exists questions;
drop table if exists quizzes;
drop table if exists participations;
drop table if exists users;

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

create table users (
	id int unsigned auto_increment primary key,
	first_name varchar(20) not null,
	last_name varchar(50) not null,
    user_name varchar(20) not null,
    hash_password varchar(100) not null
    
);

create table participations(
	id int unsigned auto_increment primary key,
    quiz_id int unsigned not null,
    foreign key(quiz_id) references quizzes(quiz_id),
    user_id int unsigned not null,
    foreign key(user_id) references users(id),
    score int unsigned not null,
    participation_date datetime default now()
);


insert into users(first_name,last_name,user_name,hash_password)
  values('revaz', 'meishvili', 'admin', '6c7ca345f63f835cb353ff15bd6c5e052ec08e7a');
    
insert into quizzes(quiz_name,author_id,description) 
  values('First Ever Quiz',1,"This Is First EVer Quiz Description");

insert into questions(quiz_id,description,ind,question_type)
  values(1,"Answer This question",0,1);
    
insert into multiple_choice_answers(question_id,choice,correct)
  values (1,"Wrong choice",0);
insert into multiple_choice_answers(question_id,choice,correct)
  values (1,"Wrong choice",0);
insert into multiple_choice_answers(question_id,choice,correct)
  values (1,"Wrong choice",0);
insert into multiple_choice_answers(question_id,choice,correct)
  values (1,"correct choice",1);
    
    
insert into questions(quiz_id,description,ind,question_type)
  values(1,"Answer This question",1,1);
    
insert into multiple_choice_answers(question_id,choice,correct)
  values (2,"Wrong choice",0);
insert into multiple_choice_answers(question_id,choice,correct)
  values (2,"Wrong choice",0);
insert into multiple_choice_answers(question_id,choice,correct)
  values (2,"correct choice",1);
insert into multiple_choice_answers(question_id,choice,correct)
  values (2,"Wrong choice",0);

    
    
insert into questions(quiz_id,description,ind,question_type)
  values(1,"Answer This question",2,1);
    
insert into multiple_choice_answers(question_id,choice,correct)
  values (3,"Wrong choice",0);
insert into multiple_choice_answers(question_id,choice,correct)
  values (3,"correct choice",1);
insert into multiple_choice_answers(question_id,choice,correct)
  values (3,"Wrong choice",0);
insert into multiple_choice_answers(question_id,choice,correct)
  values (3,"Wrong choice",0);

    
insert into questions(quiz_id,description,ind,question_type)
  values(1,"What is Capital Of England",3,0);
    
insert into open_ended_answers(question_id,answer)
  values(4,'London');
    

insert into questions(quiz_id,description,ind,question_type)
  values(1,"What is 2*2",4,0);
    
insert into open_ended_answers(question_id,answer)
  values(5,'4');
    
    
insert into questions(quiz_id,description,ind,question_type)
  values(1,"What is oposite of good",5,0);
    
insert into open_ended_answers(question_id,answer)
  values(6,'bad');


insert into questions(quiz_id,description,ind,question_type)
  values(1,"match theese",6,2);

insert into matching_answers(question_id,match_key,match_value)
  values(7,'one','1');
insert into matching_answers(question_id,match_key,match_value)
  values(7,'two','2');
insert into matching_answers(question_id,match_key,match_value)
  values(7,'three','3');
insert into matching_answers(question_id,match_key,match_value)
  values(7,'four','4');



insert into quizzes(quiz_name,author_id,description) 
  values('matching quiz',1,"matching quiz description");

insert into questions(quiz_id,description,ind,question_type)
  values(2,"capital of london is ((England))",0,3);
    
insert into questions(quiz_id,description,ind,question_type)
  values(2,"capital of ((England)) is ((London))",1,3);
    
insert into questions(quiz_id,description,ind,question_type)
  values(2,"capital of ((England)) is ((London))",2,3);
    
insert into questions(quiz_id,description,ind,question_type)
  values(2,"((Capital)) of ((England)) is ((London))",3,3);

