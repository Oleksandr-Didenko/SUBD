select SUBD.USERS.firstName, count(SUBD.LOCATION.locationID) as location
from (SUBD.USERS inner join SUBD.REQUESTS) inner join SUBD.LOCATION
on SUBD.USERS.userID = SUBD.REQUESTS.userID
and SUBD.REQUESTS.locationID = SUBD.LOCATION.locationID
group by SUBD.REQUESTS.versionID;

select SUBD.REQUESTS.requestID, count(SUBD.USERS.firstName) as users
from (SUBD.USERS inner join SUBD.REQUESTS) inner join SUBD.LOCATION
group by SUBD.REQUESTS.versionID with rollup;

select firstName as users, avg(char_length(USERS.password)) as AVGpassword
from SUBD.USERS
group by firstName;

select firstName as users, (max(char_length(USERS.password)) 
	- min(char_length(USERS.password))) as pass
from SUBD.USERS
group by firstName order by pass limit 1;