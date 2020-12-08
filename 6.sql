create view SUBD.USERS3 as select distinct userID, firstName, email
	from SUBD.USERS;
    
select * from SUBD.USERS1
	where userID >= 2 and userID <= 4;

select USERS1.userID, USERS1.firstName,SYNOPTIC2.synopticID, SYNOPTIC2.firstName 
	from SUBD.USERS1, SUBD.SYNOPTIC2
	where USERS1.userID = SYNOPTIC2.synopticID;
    
select USERS1.userID, USERS1.firstName,SYNOPTIC2.synopticID, SYNOPTIC2.firstName 
	from SUBD.USERS1, SUBD.SYNOPTIC2
	where USERS1.userID = SYNOPTIC2.synopticID and USERS1.firstName = SYNOPTIC2.firstName;