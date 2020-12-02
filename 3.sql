alter table SUBD.REQUESTS
	drop foreign key request_user,
	drop index request_user;

alter table SUBD.LOCATION
	drop column country,
	modify column latitude varchar(40) null;

alter table SUBD.REQUESTS
	modify requestID int(32) unsigned not null,
	add column versionID tinyint(8) not null 
after identifierID,
	add constraint unique UQ_Requests_version(requestID,
versionID);