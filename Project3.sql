--Project 3
--10/10/2019
--Ian Williams
--Insert 20 rows into artist
use disk_inventoryIW
go
delete from disk_has_borrower where borrower_id is not null
delete from artist_has_cd where CD_id is not null
delete from CD where CD_id is not null
delete from artist where artist_id is not null
delete from current_borrower where borrower_id is not null
delete from disk_type where type_id is not null
delete from genre where genre_id is not null
delete from disk_status where status_id is not null
go
----------------------------
begin
insert into artist
(artist_id, artist_fname, artist_lname, artist_type)
values
(0,'bethoven',null,0),
(1,'john','lenon',1),
(2,'paul','mcartney',1),
(3,'elvis','presley',0),
(4,'ed','sheeran',0),
(5,'wolfgang','mozart',0),
(6,'freddie','mercury',1),
(7,'michael','jackson',0),
(8,'taylor','swift',0),
(9,'riahnna',null,0),
(10,'matt','shultz',0),
(11,'bruno','mars',0),
(12,'lindsey','stirling',0),
(13,'brian','johnson',1),
(14,'avicii',null,1),
(15,'elton','john',1),
(16,'madonna',null,0),
(17,'david','bowie',0),
(18,'prince',null,0),
(19,'stevie','wonder',0),
(20,'T-pain',null,0);
end
insert into current_borrower
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
insert into  disk_type
(type_id,description)
values
(0,'cd'),
(1,'dvd'),
(2,'bluray');
go
insert into genre
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
insert into disk_status
(status_id, description)
values
(0,'availiable'),
(1,'checked out'),
(2,'out of order');
go
insert into CD
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
insert into artist_has_cd
(CD_id,artist_id)
values
(0,1),
(0,2),
(1,1),
(7,3),
(17,4),
(4,0),
(10,11),
--filler data below
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1),
(0,1);
go
insert into disk_has_borrower
(CD_id,borrower_id,borrowed_date,returned_date)
values
(0,11,convert(datetime,'10-5-19 10:34:09 AM',5),convert(datetime,'10-7-19 10:34:09 AM',5)),
(0,11,convert(datetime,'10-7-19 10:34:09 AM',5),convert(datetime,'10-9-19 10:34:09 AM',5)),
(0,12,convert(datetime,'10-9-19 10:34:09 AM',5),convert(datetime,'10-10-19 10:34:09 AM',5)),
(1,11,convert(datetime,'10-10-19 10:34:09 AM',5),null),
--filler data below
(3,3,convert(datetime,'10-11-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'9-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'8-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'7-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'6-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'5-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'4-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'3-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'2-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'1-9-19 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-18 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-17 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-16 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-15 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-14 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-13 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-12 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-11 10:34:09 AM',5),null),
(3,3,convert(datetime,'10-9-10 10:34:09 AM',5),null);
go
