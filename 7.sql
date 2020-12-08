select aes_encrypt(password, 'key')
	from SUBD.USERS where userID=2;
    
select SUBD.USERS.userID, SUBD.USERS.firstName, SUBD.USERS.email,
	SUBD.REQUESTS.locationID
from SUBD.USERS left join SUBD.REQUESTS on
	SUBD.USERS.userID = SUBD.REQUESTS.userID;
    
select SUBD.USERS.email, SUBD.REQUESTS.locationID
from SUBD.USERS inner join SUBD.REQUESTS on
	SUBD.USERS.userID = SUBD.REQUESTS.userID
where SUBD.REQUESTS.versionID = 1;

select SUBD.USERS.firstName, SUBD.USERS.email, SUBD.LOCATION.longitude
from (SUBD.USERS inner join SUBD.REQUESTS) inner join SUBD.LOCATION
on SUBD.USERS.userID = SUBD.REQUESTS.userID
and SUBD.REQUESTS.locationID = SUBD.LOCATION.locationID
where SUBD.REQUESTS.versionID = 1;

select SUBD.USERS.userID, SUBD.USERS.firstName, SUBD.USERS.email
from SUBD.USERS inner join SUBD.REQUESTS
on SUBD.USERS.userID = SUBD.REQUESTS.userID
where SUBD.REQUESTS.locationID in (select SUBD.LOCATION.locationID from SUBD.LOCATION
	where SUBD.LOCATION.locationID = SUBD.REQUESTS.locationID)
order by SUBD.USERS.userID limit 3;

select SUBD.USERS.email from SUBD.USERS
where not exists (select * from SUBD.REQUESTS where SUBD.REQUESTS.userID = SUBD.USERS.userID);

select email, aes_encrypt(password, 'key-key') as pass
from SUBD.USERS
where char_length(aes_encrypt(password, 'key-key'))<8 OR
aes_encrypt(password, 'key-key') NOT REGEXP '[0-9]';