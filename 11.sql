start transaction;
	insert into SUBD.REQUESTS value (null, 6, 4, null, 1);
	rollback;
	insert into SUBD.REQUESTS value (null, 1, 2, null, 2);
    insert into SUBD.REQUESTS value (null, 1, 2, null, 2);
	insert into SUBD.REQUESTS value (null, 1, 4, 5, 2);
commit;

start transaction;
	insert into SUBD.REQUESTS value (null, 6, 4, null, 1);
	insert into SUBD.REQUESTS value (null, 1, 5, null, 2);
    insert into SUBD.REQUESTS value (null, 1, 6, null, 2);
	insert into SUBD.REQUESTS value (null, 5, 6, null, 1);
commit;