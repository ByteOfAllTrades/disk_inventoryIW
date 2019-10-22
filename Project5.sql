--Project 4
--10/10/2019
--Ian Williams
----------------------------------------------------
--Modification Log
--10/22/2019
--Structure Changes:
--Added Project 5 code to the document
----------------------------------------------------
-- Modification Log
--10/18/2019
--Structure changes:
--Added Project 4 code to the document
----------------------------------------------------
--10/18/2019
--Structure changes:
--added more returned dates and diversified borrower data to allow for more accurate testing
-----------------------------------------------------
--10/17/2019 - 2
--Structure changes: 
--changed a few single artists into band names in the artist table,
--cahnged artist_has_cd to accomodate, removed filler data from artist_has_cd as well(replaced with actual data)
--I changed the values directly, but here is some sql that would do the same thing
--WARNING: The changes have been in the create code, so these statements will not affect any rows, it is purley for refrence
--code for artist table:
--update artist set artist_lname = null where artist_fname = 'paul' or 'brian' or 'matt' or 'freddie'
--update artist set artist_fname = beatles where artist_fname = 'paul'
--update artist set artist_fname = ACDC where artist_fname = 'brian'
--update artist set artist_fname = Cage the Elephant where artist_fname = 'matt'
--update artist set artist_fname = queen where artist_fname = 'freddie'
--explanation for artist_has_cd:
--I removed the filler data an replaced it with more semantic date(artists and songs)
--this was done by hand, no update or insert statements.
-----------------------------------------------------
--10/17/2019 - 1 - Initial creation of file, 
--using sources from previous projects
-----------------------------------------------------
--Project 2 Code. Drop and Re-Create table------------------------------------------------------------------
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
create table artist_has_cd --Creates an intersection table for artist and CD
(
CD_id int,
artist_id int,
foreign key (CD_id) references CD(CD_id),
foreign key (artist_id) references artist(artist_id)
);
go
--Project 3 Code. Re-Add Values-------------------------------------------------------------
use disk_inventoryIW --using the newly created database
go
--These statemnts were only needed to run the standalone version of project 3
--delete from disk_has_borrower where borrower_id is not null
--delete from artist_has_cd where CD_id is not null
--delete from CD where CD_id is not null
--delete from artist where artist_id is not null
--delete from current_borrower where borrower_id is not null
--delete from disk_type where type_id is not null
--delete from genre where genre_id is not null
--delete from disk_status where status_id is not null
--go

begin
insert into artist --inserts artist values
(artist_id, artist_fname, artist_lname, artist_type)
values
(0,'bethoven',null,0),
(1,'john','lenon',0),
(2,'beatles',null,1),
(3,'elvis','presley',0),
(4,'ed','sheeran',0),
(5,'wolfgang','mozart',0),
(6,'queen',null,1),
(7,'michael','jackson',0),
(8,'taylor','swift',0),
(9,'riahnna',null,0),
(10,'Cage the Elephant',null,1),
(11,'bruno','mars',0),
(12,'lindsey','stirling',0),
(13,'ACDC',null,1),
(14,'avicii',null,0),
(15,'elton','john',0),
(16,'madonna',null,0),
(17,'david','bowie',0),
(18,'prince',null,0),
(19,'stevie','wonder',0),
(20,'T-pain',null,0);
end
go
insert into current_borrower --inserts borrower names and phone numbers
(borrower_id, borrower_fname, borrower_lname, borrower_phone_number)
values
(0,'jonahthan','wick',2088888888),
(1,'john','doe',2088888888),
(2,'john','smith',2088888888),
(3,'john','johnson',2088888888),
(4,'john','hamel',2088888888),
(5,'john','marks',2088888888),
(6,'john','davidson',2088888888),
(7,'john','williams',2088888888),
(8,'john','manson',2088888888),
(9,'john','wilcox',2088888888),
(10,'john','connery',2088888888),
(11,'jane','doe',2088888888),
(12,'jane','saraiah',2088888888),
(13,'jane','duhamel',2088888888),
(14,'mark','edwards',2088888888),
(15,'carmen','sandiego',2088888888),
(16,'james','bond',2088888888),
(17,'luke','skywalker',2088888888),
(18,'sarah','wilkinson',2088888888),
(19,'joeseph','seed',2088888888),
(20,'mark','dent',2088888888);
go
delete from current_borrower -- deletes joeseph, poor joeseph
where borrower_fname = 'joeseph'
insert into  disk_type -- inserts disk typs(cd,dvd,bluray)
(type_id,description)
values
(0,'cd'),
(1,'dvd'),
(2,'bluray');
go
insert into genre --inserts genres
(genre_id, description)
values
(0,'rock'),
(1,'pop'),
(2,'classical'),
(3,'country'),
(4,'rap'),
(5,'alt'),
(6,'fusion');
go
insert into disk_status --inserts disk status options
(status_id, description)
values
(0,'availiable'),
(1,'checked out'),
(2,'out of order');
go
insert into CD -- inserts cd inventory
(CD_id, CD_name, status_id,genre_id,type_id)
values
(0,'ys',1,1,0),
(1,'cyi',1,1,0),
(2,'bib',1,0,0),
(3,'paroi',1,1,0),
(4,'5th',1,2,0),
(5,'autumn',1,2,0),
(6,'wakeup',1,5,0),
(7,'blueswede',1,0,0),
(8,'darkforr',1,6,0),
(9,'labrynth',0,0,0),
(10,'uptownfunk',0,1,0),
(11,'beatit',0,1,0),
(12,'eai',0,6,0),
(13,'bohemian',0,0,0),
(14,'badblood',0,1,0),
(15,'manison',0,4,0),
(16,'itg',0,1,0),
(17,'foundalove',2,3,0),
(18,'norest',2,5,0),
(19,'beautiful',2,1,0),
(20,'shook me',2,0,0);
go
update CD
set CD_name = 'updated' -- updates a cd name for testing purposes
where CD_name = 'eai'
insert into artist_has_cd
(CD_id,artist_id)
values
(0,2),
(5,5),
(1,1),
(7,3),
(17,4),
(4,0),
(10,11),
(6,14),
(8,12),
(9,17),
(11,7),
(13,6),
(20,13),
(15,20),
(17,4),
(18,10),
(19,18),
(14,8),
(2,13),
(3,9),
(12,16)
go
insert into disk_has_borrower --correlates borrowers to disks and asscociated borrow and return times
(CD_id,borrower_id,borrowed_date,returned_date)
values
(0,11,convert(datetime,'10-5-19 10:34:09 AM',5),convert(datetime,'10-7-19 10:34:09 AM',5)),
(0,11,convert(datetime,'10-7-19 10:34:09 AM',5),convert(datetime,'10-9-19 10:34:09 AM',5)),
(0,12,convert(datetime,'10-9-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(1,11,convert(datetime,'10-10-19 10:34:09 AM',5),null),
--filler data below
(3,4,convert(datetime,'10-11-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(4,3,convert(datetime,'9-9-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(13,1,convert(datetime,'8-9-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(12,2,convert(datetime,'7-9-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(16,0,convert(datetime,'6-9-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(3,5,convert(datetime,'5-9-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(5,6,convert(datetime,'4-9-19 10:34:09 AM',5),convert(datetime,'10-9-19 10:34:09 AM',5)),
(7,7,convert(datetime,'3-9-19 10:34:09 AM',5),convert(datetime,'10-9-19 10:34:09 AM',5)),
(8,8,convert(datetime,'2-9-19 10:34:09 AM',5),convert(datetime,'10-9-19 10:34:09 AM',5)),
(10,9,convert(datetime,'1-9-19 10:34:09 AM',5),null),
(20,10,convert(datetime,'10-9-18 10:34:09 AM',5),null),
(19,11,convert(datetime,'10-9-17 10:34:09 AM',5),null),
(18,12,convert(datetime,'10-9-16 10:34:09 AM',5),null),
(3,13,convert(datetime,'10-9-15 10:34:09 AM',5),null),
(3,14,convert(datetime,'10-9-14 10:34:09 AM',5),null),
(9,15,convert(datetime,'10-9-13 10:34:09 AM',5),null),
(6,16,convert(datetime,'10-9-12 10:34:09 AM',5),null),
(15,17,convert(datetime,'10-9-11 10:34:09 AM',5),null),
(17,18,convert(datetime,'10-9-10 10:34:09 AM',5),null);
go
--Project 3 Loancheck
select * from disk_has_borrower where returned_date is null
--Project 4 Code--------------------------------------------------------
--3 Shows the disks in my database and any associated Individual artists only. Sort by Artist Last Name, First Name & Disk Name.
select CD_name as DiskName, artist_fname as ArtistFirstName, ISNULL(artist_lname, ' ') as ArtistLastName
from CD
join artist_has_cd
on artist_has_cd.CD_id = CD.CD_id
join artist
on artist.artist_id = artist_has_cd.artist_id
where artist_type = 0
order by ArtistLastName,ArtistFirstName,DiskName
go
--4 Create a view called View_Individual_Artist that shows the artists’ names and not group names. Include the artist id in the view definition but do not display the id in your output.
drop view if exists View_Individual_Artist
	
go
create view View_Individual_Artist
as
select artist_id,artist_fname, artist_lname
from artist
where artist_type = 0
go
select artist_fname as FirstName, artist_lname as LastName
from View_Individual_Artist
go
--5 Show the disks in your database and any associated Group artists only. Use the View_Individual_Artist view. Sort by Group Name & Disk Name.
select CD_name as DiskName, artist_fname as GroupName
from CD
join artist_has_cd 
on CD.CD_id = artist_has_cd.CD_id
join artist on artist.artist_id = artist_has_cd.artist_id
where artist_has_cd.artist_id not in
(
select artist_id
from View_Individual_Artist
)
order by GroupName,DiskName
--6 Show which disks have been borrowed and who borrowed them. Sort by Borrower’s Last Name, then First Name, then Disk Name, then Borrowed Date, then Returned Date.
select borrower_fname as FirstName, borrower_lname as LastName, CD_name as DiskName, 
cast(borrowed_date as date) as BorrowedDate, cast(returned_date as date) as ReturnedDate
from current_borrower
join disk_has_borrower 
on current_borrower.borrower_id = disk_has_borrower.borrower_id
join CD
on CD.CD_id = disk_has_borrower.CD_id
order by LastName, FirstName, DiskName, BorrowedDate, ReturnedDate
--7 In disk_id order, show the number of times each disk has been borrowed.
select CD.CD_id as ID ,CD_name as DiskName, count(disk_has_borrower.CD_id) as TimesBorrowed
from disk_has_borrower
join CD
on CD.CD_id = disk_has_borrower.CD_id
group by CD.CD_id,CD_name
--8 Show the disks outstanding or on-loan and who has each disk. Sort by disk name.
select CD_name as DiskName, cast(borrowed_date as date) as Borrowed, cast(returned_date as date) as Returned, borrower_lname as LastName
from disk_has_borrower
join CD
on CD.CD_id = disk_has_borrower.CD_id
join current_borrower
on current_borrower.borrower_id = disk_has_borrower.borrower_id
where returned_date is null
--Project 5 Code---------------------------------------------------------

--insert artist proc
drop proc if exists sp_InsArtist;-- Drops process to allow for multiple runthroughs
go
create proc sp_InsArtist --creates process
	@artist_id int,
	@fname varchar(100),
	@artist_type_id int,
	@lname varchar(100) = null
as
begin try
	insert into [dbo].[artist]
	([artist_id],
	[artist_fname],
	[artist_lname],
	[artist_type])
	values
	(@artist_id,
	@fname,
	@lname,
	@artist_type_id)
end try
begin catch
print 'an error has occured. while calling insert artist';
print 'error #: ' + convert(varchar(200), error_number()); 
print 'error msg: ' +convert(varchar(200), error_message()); 
end catch
go
exec sp_InsArtist 27, 'epicLloyd', 0
go

--update artist proc
drop proc if exists sp_UpdArtist;-- Drops process to allow for multiple runthroughs
go
create proc sp_UpdArtist--creates process
	@artist_id int,
	@fname varchar(100),
	@artist_type_id int,
	@lname varchar(100) = null
as
begin try
	update [dbo].[artist]
	set [artist_fname] = @fname, 
		[artist_lname] = @lname,
		[artist_type] = @artist_type_id
	where @artist_id = artist_id
end try
begin catch
print 'an error has occured. while calling update artist';
print 'error #: ' + convert(varchar(200), error_number()); 
print 'error msg: ' +convert(varchar(200), error_message()); 
end catch
go
exec sp_UpdArtist 27, 'Bruno', 1, 'mars'
go

--delete artist proc
drop proc if exists sp_DelArtist-- Drops process to allow for multiple runthroughs
go
create proc sp_DelArtist --creates process
	@artist_id int
as
begin try
	delete from [dbo].[artist]
	where @artist_id = artist_id
end try
begin catch
print 'an error has occured. while calling delete artist';
print 'error #: ' + convert(varchar(200), error_number()); 
print 'error msg: ' +convert(varchar(200), error_message()); 
end catch
go

exec sp_DelArtist 27


--------------------------------

--insert borrower proc
drop proc if exists sp_InsBorrower; -- Drops process to allow for multiple runthroughs
go
create proc sp_InsBorrower --creates process
	@borrower_id int,
	@fname varchar(100),
	@borrower_phone int,
	@lname varchar(100)
as
begin try
	insert into [dbo].[current_borrower]
	([borrower_id],
	[borrower_fname],
	[borrower_lname],
	[borrower_phone_number])
	values
	(@borrower_id,
	@fname,
	@lname,
	@borrower_phone)
end try
begin catch
print 'an error has occured. while calling insert borrower';
print 'error #: ' + convert(varchar(200), error_number()); 
print 'error msg: ' +convert(varchar(200), error_message()); 
end catch
go
exec sp_InsBorrower 27, 'epicLloyd', 2088888888, 'nicePeter'
go

--update borrower proc
drop proc if exists sp_UpdBorrower;-- Drops process to allow for multiple runthroughs
go
create proc sp_UpdBorrower --creates process
	@borrower_id int,
	@fname varchar(100),
	@borrower_phone int,
	@lname varchar(100)
as
begin try
	update [dbo].[current_borrower]
	set [borrower_fname] = @fname, 
		[borrower_lname] = @lname,
		[borrower_phone_number] = @borrower_phone
	where @borrower_id = borrower_id
end try
begin catch
print 'an error has occured. while calling update borrower';
print 'error #: ' + convert(varchar(200), error_number()); 
print 'error msg: ' +convert(varchar(200), error_message()); 
end catch
go
exec sp_UpdBorrower 27, 'Lloyd', 1, 'Peter'
go

--delete borrower proc
drop proc if exists sp_DelBorrower-- Drops process to allow for multiple runthroughs
go
create proc sp_DelBorrower --creates process
	@borrower_id int
as
begin try
	delete from [dbo].[current_borrower]
	where @borrower_id = borrower_id
end try
begin catch
print 'an error has occured. while calling delete borrower';
print 'error #: ' + convert(varchar(200), error_number()); 
print 'error msg: ' +convert(varchar(200), error_message()); 
end catch
go

exec sp_DelBorrower 27



