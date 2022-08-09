alter table employees ADD column contact INT(10);
select * from employees;
alter table employees Rename column contact to phonenumber;
drop table employees ;