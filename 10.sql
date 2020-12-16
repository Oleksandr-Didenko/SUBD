create function my_encode (pass char(48))
returns tinyblob
return aes_encrypt(pass, 'key-key');

create function my_decode (pass tinyblob)
returns char(48)
return aes_decrypt(pass, 'key-key');

delimiter // 
create procedure my_procedure(in name char(20))
begin
	create table if not exists SUBD.PROCEDURE1(version int unsigned, count int unsigned);
    insert into SUBD.PROCEDURE1 select SUBD.REQUESTS.versionID as version, count(SUBD.USERS.userID) as count
    from SUBD.USERS inner join SUBD.REQUESTS
    on SUBD.USERS.userID = SUBD.REQUESTS.userID
    group by version;
end;
end if;
end//
delimiter ;

select firstName, my_decode(my_encode(USERS.password)) from USERS;

call my_procedure("name");
SELECT * FROM SUBD.PROCEDURE1;