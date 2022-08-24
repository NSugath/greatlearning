-- Mentoring Session Week 1

-- Pl. ensure that “hr” database is created or downloaded from MYSQL sample databases before getting started with this exercise.

-- Once MySQL workbench is launched, spend couple of minutes in familiarising participants with MYSQL Workbench options as video has details of SQL lite and hence there is every chance that participants are not familiar with MYSQL Workbench.

-- 1 Execute following basic commands to get started with the session

show databases;
use hr;
show tables;

-- 2 Fetch all the records for Employees Table.

select * from employees;

-- 3 Show all the emp_id, first_name, last_name from employee Table.

select employee_id,first_name,last_name from employees ;

-- 4 Write a query in SQL to display the first_name and last_name,  department_id and salary from employees Table who earn more than 20000.( 'Steven', 'King', '90', '24000.00')

select first_name,last_name,department_id,salary from employees where salary > 20000;

-- 5 Write a query in SQL to display the first_name and last_name, email, salary and manager_ID for those employees  whose managers_ID  is 120, 103 or 145.(18 rows)

select FIRST_NAME,last_name,email,salary,manager_id FROM employees where manager_id in (120,103,145);

-- 6 Write a query in SQL to display the first_name and  last_name,department_id and salary from employees Table   who earn more than 8000 And whose managers_ID  is 120, 103      or 145.(3 rows)

select FIRST_NAME,last_name,email,salary, manager_id FROM employees
where manager_id in (120,103,145) AND salary > 8000;

-- 7 Write a query to display all the locations (id, city) which do not have any state province mentioned.  (6 rows) [NOTE: LOCATION TABLE]

select location_id,city from locations where state_province is null;


-- 8 Write a query to display job_id, job titles, min_salary, max_salary whose maximum salary is greater than 10000. (9 rows) [NOTE: JOBS TABLE]

select JOB_TITLE, job_id, min_salary,max_salary from jobs WHERE MAX_SALARY > 10000;

-- 9 Write a query to display department_id,department_name, Manager_id whose manager_id is greater than  200 and   location_id is 2400.(1 row) [NOTE : DEPARTMENTS TABLE]

select department_id,department_name,manager_id from departments where manager_id > 200   and location_id = 2400;

-- 10 Write a query to display the job title whose minimum  salary is greater than 8000 and max salary less than 20000 (3 rows).[NOTE : JOBS TABLE]

select job_title from jobs where min_salary >8000 and max_salary < 20000;

-- 11 Write a query to retrieve all the records of departments with managers for the location id 1700. (5 rows) [NOTE : DEPARTMENTS TABLE]

select * from departments  where manager_id is not null and location_id=1700;

-- 12 List all departments starting with “P” where there are managers.(2 rows)[NOTE:DEPARTMENT TABLE]

Select department_id,department_name,manager_id,location_id   from departments where department_name like "p%" and  manager_id is not null;	


-- 13	Print a bonafide certificate for an employee (say for emp. id 123) as below:
-- o	#"This is to certify that <full name> with employee id <emp. id> is working as <job id> in dept. <dept ID>. (1 ROW)  [NOTE : EMPLOYEES table].
select concat("This is to certify that ",first_name," ",last_name," with employee id ",employee_id," working as ",job_id, " in "," dept. ",department_id) from employees 
where employee_id=123;

-- • Write a  query to display the  employee id, salary & salary range of employees as 'Tier1', 'Tier2' or 'Tier3' as per the range <5000, 5000-10000, >10000 respectively,ordering the output by those tiers.(107 ROWS)[NOTE :EMPLOYEES TABLE]

select  employee_id,salary,
CASE WHEN salary < 5000 THEN 'tier 1'
WHEN salary between 5000 and 10000 THEN 'teir 2'
ELSE 'teir 3'
END AS Tier
from employees
order by salary;

-- 14 Write a query to display the department-wise and job-id-wise  total  salaries of employees whose salary is more than 25000.(8 rows) [NOTE : EMPLOYEES TABLE]

select job_id,department_id,sum(salary) from employees group by department_id, job_id having sum(salary)>25000;

-- 15 Write a query to display names of employees whose first name as well as last name ends with vowels.  (vowels : aeiou ) (5 rows) [NOTE : EMPLOYEES TABLE]

select first_name , last_name from employees where (first_name like '%a' or first_name like '%e' or first_name like '%i' or first_name like '%o' or first_name like '%u') and (last_name like '%a' or  last_name like '%e' or  last_name like '%i' or  last_name like '%o' or  last_name like '%u');

-- 16 What is the average salary range (diff. between min & max salary) of all types 'Manager's and 'Clerk's. (9 rows)[NOTE : JOBS TABLE]

select avg(max_salary-min_salary)as diff_avg,job_title,job_id  from jobs where job_title like '% Manager%' or job_title like '% Clerk%' group by job_title;
	
-- 17 Write a query to list the names of all people who report to the same person in department Accounting (i.e.2).

select concat(first_name," ", last_name)
from employees e, departments d 
where d.department_id=e.department_id and department_name="Accounting"
group by e.manager_id;


-- 18 Write a query in SQL to display the first name, last name, department number, and department name for each employee.(106 rows)

select * from departments;
select * from employees;
select e.first_name,e.last_name,e.department_id,d.department_name
from employees e, departments d
where e.department_id=d.department_id;

-- 19 Write a query in SQL to display the name of the department, average salary and number of employees working in that department who got commission.

select d.department_name,avg(e.salary),count(e.employee_id)
from employees e, departments d
where e.department_id = d.department_id and 
commission_pct>0 and e.department_id is not null
group by e.department_id;

-- 20 Display the first name where commission percentage is not provided.(72 rows)

select first_name from employees where commission_pct is null;

-- 21 Display first_name ,commission and where commission is null print 'Its Null' otherwise print 'It’s not null'.(107 rows)
select first_name,case when commission_pct is Null then "It's Null"
else "It is not null"
end Null_or_Not_Null 
from employees;


