select userID, firstName from SUBD.USERS
	where firstName like '%name%'
order by firstName;

select firstName, userID from SUBD.USERS
	order by userID desc limit 4;
    
select  firstName, longitude, versionID from (SUBD.USERS inner join SUBD.REQUESTS)
	inner join SUBD.LOCATION
on SUBD.USERS.userID = SUBD.REQUESTS.userID
and SUBD.REQUESTS.locationID = SUBD.LOCATION.locationID
group by longitude;