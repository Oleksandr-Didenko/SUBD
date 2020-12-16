create trigger version_delete before delete
	on SUBD.LOCATION for each row
	update SUBD.REQUESTS set locationID=4 where locationID=OLD.locationID;

delete from SUBD.LOCATION where locationID = 7;
select * from SUBD.REQUESTS;

create trigger users_password before insert
	on SUBD.USERS for each row
	set NEW.password = aes_encrypt(NEW.password, 'key-key');
    
insert into SUBD.USERS value(null, 'Trigger', 'Trigger', 'triggerx2@gmail.com', 'mypass123');
select * from SUBD.USERS;

alter table SUBD.USERS
add column lastseen date default null;

alter table SUBD.REQUESTS
add column lastseen date default null;

create trigger user_lastseen after insert
	on SUBD.USERS for each row
	update SUBD.REQUESTS set REQUESTS.lastseen=date(NEW.lastseen)
	where SUBD.REQUESTS.userID=NEW.userID;
    
insert into SUBD.USERS value (null, 'Ddue', 'Dude', 'dudex2@gmail.com', 'dudespass123', '2009-05-09');
select * from SUBD.USERS;