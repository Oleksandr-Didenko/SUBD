insert into SUBD.USERS values(1,'John', 'Black', 'johnblack@gmail.com');

insert into SUBD.USERS
values (null,'John', 'White', 'johnwhite@gmail.com'),
		(null,'Black', 'White', 'blackwhite@gmail.com');
        
update SUBD.USERS set lastName='Newlast'
	where userID=2;

update SUBD.USERS set email='newemail@gmail.com'
	where userID=1;

delete from SUBD.USERS
	where (userID>1 && userID<3)