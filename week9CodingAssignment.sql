create database if not exists appDB;

use appDB;

drop table if exists comments;
drop table if exists posts;
drop table if exists user;


create table user (
username varchar(20) not null,
password varchar(20) not null,
email varchar(20) not null,
state char(2) not null,
zipcode int(5),
primary key (username)
);

create table posts (
post_id int(10) auto_increment,
username varchar(20) not null,
content varchar(255) not null,
date_posted datetime default current_timestamp,
primary key(post_id),
foreign key (username) references user(username)
);

create table comments (
post_id int(10),
username varchar(20) not null,
content varchar(255),
date_posted datetime default current_timestamp,
primary key(post_id, username),
foreign key(username) references user(username),
foreign key(post_id) references posts(post_id)
);
