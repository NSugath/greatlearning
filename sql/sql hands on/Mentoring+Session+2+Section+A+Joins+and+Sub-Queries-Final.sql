-- Section A: Joins and Sub-Queries

-- •	Execute following basic commands to get started with the session

show databases;

use hr;

show tables;

-- •	Write a query in SQL to display those employees who contain a letter z to their first name and also display their last name, department, city, and state province. (3 rows)

select e.first_name, e.last_name, e.department_id, d.department_name, l.city,l.state_province 
from employees e inner join departments d
on e.department_id=d.department_id
inner join locations l
on d.location_id=l.location_id where e.first_name like "%z%";    

-- •	Write a query in SQL to display the job title, department id, full name (first and last name) of employee, starting date and end date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 2000. (8 rows)

select j.job_id,e.department_id,concat(e.first_name,' ',
e.last_name) full_name, j.start_date , j.end_date from
employees e join job_history j
on e.employee_id = j.employee_id
where j.start_date >='1993-01-01' and end_date<= '2000-08-31';		

-- •	Display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than the minimum salary of those employees whose job title is Programmer using subquery. (44 rows)

select e.employee_id, concat(e.first_name, ' ', e.last_name) as Name, 
j.job_title from employees as e left join jobs as j
on e.job_id = j.job_id
where e. salary< 
(select min(salary) from employees as k left join jobs as l
 on k.job_id=l.job_id
where l.job_title = "Programmer");	

-- •	Write a query in SQL to display the country name, city, and number of those departments where at least 2 employees are working. (5 rows)


select country_name,city, count(department_id)
from countries
join locations using (country_id)
join departments using (location_id)
where department_id in
  (select department_id
from employees
group by department_id
having COUNT(employee_id)>=2)
group by country_name,city;


-- •	Write a query to fetch the employee ID, First Name, Last Name, Salary and Department ID of those employees who draw a salary more than the average salary of their respective department. (38 rows)

select employee_id, concat(first_name,' ',last_name) Name,salary,department_id from employees o
where salary > (select avg(salary) from employees i where o.department_id = i.department_id);


-- •	Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn less than the average salary, and also work at the department where the employee Laura is working as a first name holder.(41 rows)

select * from employees where salary < (select avg(salary) from employees) and department_id like (select department_id from employees where first_name like "Laura");

-- •	Using HR Schema, write a Query to find the maximum salary of the most recent job that every employee holds.

select e.employee_id, e.hire_date,e.job_id,j.max_salary from employees e left join jobs j
on e.job_id= j.job_id;

-- •	Using HR Schema, write a Query to List the old designation and new designation of all the employees in the company where old designation is not null. (110 rows)

select distinct e.employee_id,e.first_name,e.last_name,e.job_id as current_job,j.job_id as old_job,jo.job_title as current
from employees as e inner join job_history as j on e.employee_id=j.employee_id
inner join jobs as jo on jo.job_id=e.job_id;
