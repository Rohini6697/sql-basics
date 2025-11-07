create database Practical;
use Practical;

create table departments(
dept_id int primary key,
dept_name varchar(50)
);

insert into departments(dept_id,dept_name) values(1,'HR'),(2,'IT'),(3,'Finance');

create table employees(
emp_id int primary key,
emp_name varchar(50),
salary int,
dept_id int,
join_date date,
foreign key(dept_id) references departments(dept_id)
);

insert into employees(emp_id,emp_name,salary,dept_id,join_date) values(101,'Alice',75000,2,'2022-04-10'),(102,'Bob',60000,1,'2019-12-20'),(103,'Charlie',82000,3,'2021-06-15'),(104,'David',55000,2,'2020-08-05'),(105,'Eva',90000,3,'2023-02-25');

-- 5.  Display all employee names and their salaries.
select emp_name,salary
from employees;


-- 6. Select employees with a salary greater than 60000.
select *
from employees
where salary>60000;

-- 7. Show employees who joined after 1st January 2021.
select *
from employees
where join_date > '2021-01-01';

-- 8. Retrieve employee details where department ID is 2.
select *
from employees e
inner join departments d on e.dept_id = d.dept_id
where d.dept_id = 2;

-- 9. Display employees whose name starts with 'A'.
select *
from employees
where UPPER(emp_name) like 'A%';

-- 10. Update the salary of employees in the 'HR' department by 10%.
update employees e
inner join departments d on d.dept_id = e.dept_id
set salary = salary*1.10
where dept_name = 'HR';

select * 
from employees e
join departments d on d.dept_id = e.dept_id;

-- 11. Change the department of employee 'Bob' to department ID 3.
update employees set dept_id = 3 where emp_name = 'Bob';

-- 12. Delete records of employees who joined before 2020.
delete from employees where join_date< '2020-01-01';

-- 13. Delete an employee with emp_id = 104.
delete from employees where emp_id = 104;

-- 14. Increase salary by 5000 for employees in department ID 1.
update employees
set salary = salary+5000 
where dept_id = 1;

-- 15. Find the total salary expense of all employees.
select sum(salary) as salary_expense
from employees;

-- 16. Calculate the average salary in each department
select d.dept_name,avg(e.salary) as avg_salary
from employees e
inner join departments d on e.dept_id = d.dept_id
group by d.dept_name;

-- 17. Display the highest salary in the employee table.
select max(salary)
from employees;

-- 18. Count the total number of employees.
select count(*)
from employees;

-- 19. Find the minimum salary in department ID 2.
select min(salary)
from employees
where dept_id=2;

-- 20. Show the number of employees in each department.
select dept_id,count(emp_id)
from employees
group by dept_id; 

-- 21. Write a query to display employee names along with their department names.
select e.emp_name as employee_name,d.dept_name as department_name
from employees e
left join departments d on d.dept_id = e.dept_id;


-- 22. Use LEFT JOIN to show all departments and any employees.
select *
from departments d
left join employees e on d.dept_id = e.dept_id;

-- 23. Use RIGHT JOIN to show all employees and their department names.
select e.emp_name as employee_name,d.dept_name as department_name
from departments d
right join employees e on d.dept_id = e.dept_id;

-- 24. Perform a FULL OUTER JOIN on Employees and Departments tables.
select e.emp_name as employee_name,d.dept_name as department_name
from employees e
left join departments d on d.dept_id = e.dept_id
union
select e.emp_name as employee_name,d.dept_name as department_name
from departments d
right join employees e on d.dept_id = e.dept_id;

-- 25. Show all departments that have no employees assigned (using JOIN).
select d.dept_name as department_name
from departments d
right join employees e on d.dept_id = e.dept_id
where e.emp_id is null;

-- 26. Find employees who earn more than the average salary.
select emp_name as employee_name
from employees
where salary > (select avg(salary)
				from employees);
                
-- 27. Select employees whose salary equals the maximum salary in their department.
select *
from employees e
where salary = (select max(salary)
				from employees
                where dept_id = e.dept_id);
                
-- 28. List employees who work in the 'IT' or 'HR' department using a subquery.
select *
from employees e
inner join departments d on d.dept_id = e.dept_id
where dept_name in (select dept_name
					from departments
                    where dept_name = 'HR' or dept_name = 'IT');
                    
-- 29. Display employee names where department name is 'Finance' using subquery.
select *
from employees e
inner join departments d on d.dept_id = e.dept_id
where dept_name = (select dept_name
					from departments
                    where dept_name = 'Finance');
                    
-- 30. Show departments where the maximum salary exceeds 60000 (using correlated subquery).
select *
from employees e
inner join departments d on d.dept_id = e.dept_id
where 60000<  (select max(salary)
					from employees
                    where dept_id = e.dept_id);
                    