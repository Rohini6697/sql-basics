create database Learn;
use Learn;

create table employees(
emp_id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references departments(dept_id)
);

insert into employees(emp_id,name,dept_id) values(1,'Alice',101),(2,'Bob',102),(3,'Charlie',103),(4,'David',null),(5,'Eva',101);


create table departments(
dept_id int primary key,
dept_name varchar(50)
);

insert into departments(dept_id,dept_name) values(101,'HR'),(102,'IT'),(103,'Marketing'),(105,'Finance');

select e.name,d.dept_name
from employees e
inner join departments d on e.dept_id = d.dept_id;

select e.*,d.*
from departments d
left join employees e on e.dept_id = d.dept_id;

select e.*,d.*
from departments d
left join employees e on e.dept_id = d.dept_id
union
select e.*,d.*
from departments d
right join employees e on e.dept_id = d.dept_id;

select e.name,d.dept_name
from employees e
cross join departments d;

select e1.name as e1name,e2.name as e2name,e1.dept_id
from employees e1
inner join employees e2 on e1.dept_id = e2.dept_id and e1.emp_id<e2.emp_id;

select e.name
from employees e
inner join departments d on e.dept_id = d.dept_id
where dept_name = 'HR';

select e.name,d.dept_name
from departments d
left join employees e on e.dept_id = d.dept_id
order by dept_name;

select d.dept_name,count(e.name)
from employees e
inner join departments d on e.dept_id = d.dept_id
group by d.dept_name;
