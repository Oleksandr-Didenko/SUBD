create table SUBD.USERS1
as select userID, firstName, email from SUBD.USERS
	where userID > 1;

create table SUBD.USERS2
as select userID, firstName, email from SUBD.USERS
	where userID < 3;
    
select * from SUBD.USERS1
union select * from SUBD.USERS2;

select * from SUBD.USERS1
where userID in (select userID from SUBD.USERS2);

select * from SUBD.USERS2
where userID not in (select userID from SUBD.USERS1);

select * from SUBD.USERS1, SUBD.USERS2;