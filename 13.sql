show index from SUBD.REQUESTS;
show index from SUBD.USERS;

create index userINDX on SUBD.USERS (userID, firstName);
show index from SUBD.USERS;

explain select  firstName, longitude, versionID from (SUBD.USERS inner join SUBD.REQUESTS)
straight_join SUBD.LOCATION
on SUBD.USERS.userID = SUBD.REQUESTS.userID
and SUBD.REQUESTS.locationID = SUBD.LOCATION.locationID
group by longitude;

explain select SUBD.USERS.userID, SUBD.USERS.firstName, SUBD.USERS.email
from SUBD.USERS inner join SUBD.REQUESTS
on SUBD.USERS.userID = SUBD.REQUESTS.userID
where SUBD.REQUESTS.locationID in (select SUBD.LOCATION.locationID from SUBD.LOCATION
	where SUBD.LOCATION.locationID = SUBD.REQUESTS.locationID)
order by SUBD.USERS.userID limit 3;