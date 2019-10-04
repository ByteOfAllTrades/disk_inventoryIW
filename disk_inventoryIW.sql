----------------------------------------------
--|Created By: Ian Williams|Date: 10/4/2019|--
--|Last Modification: 10/4/2019|           |--
--|Modification Notes: Initial creation    |--
----------------------------------------------
use master
go
drop database if exists disk_inventoryIW -- Drop DB to allow a recreation of the database
go
create database disk_inventoryIW --Create/recreate DB
go
use disk_inventoryIW
go
create table disk_status --Creates lookup table for disk status
(
status_id int primary key, -- disk is either 0 - availiable, 1 - loaned out, 2 - overdue, 3 - broken 
description varchar(20) not null
);
go
create table genre --Creates lookup table for genre
(
genre_id int primary key,
description varchar(20) not null
);
go
create table disk_type --Creates lookup table for disk type
(
type_id int primary key, -- disk is either 0 - CD, 1 - DVD, 2 - Bluray, 3 - Custom
description varchar(20) not null
);
go
create table CD -- Creates table for the CD
(
CD_id int primary key,
CD_name varchar(10) not null,
status_id int,
genre_id int,
type_id int,
foreign key (status_id) references disk_status(status_id),
foreign key (genre_id) references genre(genre_id),
foreign key (type_id) references disk_type(type_id)
);
go
create table artist -- Creates table for the artist
(
artist_id int primary key,
artist_fname varchar(20) not null,
artist_lname varchar(20),
artist_type int not null --Group or lone artist
);
go
create table current_borrower --Creates table for the current borrower
(
borrower_id int primary key,
borrower_fname varchar(20) not null,
borrower_lname varchar(20) not null,
borrower_phone_number int not null
);
go
create table disk_has_borrower --Creates an intersection table for current_borrower and CD
(
borrowed_date datetime primary key,
CD_id int,
borrower_id int,
returned_date datetime, --Time at which the CD is returned, can be null
foreign key (CD_id) references CD(CD_id),
foreign key (borrower_id) references current_borrower(borrower_id),
);
go
create table artisit_has_cd --Creates an intersection table for artist and CD
(
CD_id int,
artist_id int,
foreign key (CD_id) references CD(CD_id),
foreign key (artist_id) references artist(artist_id)
);
go
if SUSER_ID('diskUserIW') is null
create login diskUserIW with password = 'MSPress#1',
	default_database = disk_inventoryIW;
go
if user_id('diskUserIW') is null
	create user diskUserIW;
go
alter role db_datareader add member diskUserIW;
go