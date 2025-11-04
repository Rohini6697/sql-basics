create database LibraryDB;
use LibraryDB;

create table Books(
book_id int primary key auto_increment,
title varchar(100),
author varchar(50),
category varchar(30),
stock INT,
price decimal(8,2)
);

create table Members(
member_id int primary key auto_increment,
name varchar(50),
city varchar(40),
email varchar(60),
join_date date
);


create table Borrow(
borrow_id int primary key auto_increment,
member_id int,
book_id int,
borrow_date date,
return_date date,
quantity int,
foreign key(member_id) references Members(member_id),
foreign key(book_id) references Books(book_id)
);

insert into Books(title,author,category,stock,price) values('Harry Potter and the Sorcerer’s Stone','J.K. Rowling','Fantasy',14,163),('The Catcher in the Rye','J.D. Salinger','Fiction',5,200),('The Hobbit','J.R.R. Tolkien','Fantasy',23,250),('The Diary of a Young Girl','Anne Frank','Autobiography',24,300),('The Kite Runner','Khaled Hosseini','Drama',55,180);
insert into Members(name,city,email,join_date) values('Vigneswar','Kozhikode','v@gamil.com','2025-11-06'),('Lakshmi','Kannur','l@gmail.com','2022-03-27'),('Krishna','Malappuram','k@gmail.com','2021-01-11'),('Murugan','Wayanad','m@gmail.com','2024-04-07'),('Parvathi','Kasaragod','p@gmail.com','2025-03-15');
insert into Borrow(member_id,book_id,return_date,quantity) values(1,5,'2025-12-01',1),(2,4,'2025-12-02',2),(3,3,'2025-12-03',3),(4,2,'2025-12-04',4),(5,1,'2025-12-05',5);

select * from Books;
select name,city from Members;
select * from Borrow;

select Members.name as Name,Books.title as Book_Name
from Borrow
join Books on Books.book_id = Borrow.book_id
join Members on Members.member_id = Borrow.member_id;

select * from Books where category = 'Fiction';
select * from Books where stock<10;
select * from Borrow;
update Borrow set borrow_date = '2020-09-01' where borrow_id = 1;
update Borrow set borrow_date = '2021-010-02' where borrow_id = 2;
update Borrow set borrow_date = '2022-11-03' where borrow_id = 3;
update Borrow set borrow_date = '2023-12-04' where borrow_id = 4;
update Borrow set borrow_date = '2025-12-05' where borrow_id = 5;

select * from Borrow where borrow_date>'2025-11-01';

select Members.name as Name,sum(Borrow.quantity) as total_book
from Borrow
join Members on Members.member_id = Borrow.borrow_id
group by Members.name;

select avg(Borrow.quantity) as avg
from Borrow;

select name from Members where city = 'Kasaragod';


select Members.name as Name,sum(Borrow.quantity*Books.price) as Amount
from Borrow
join Members on Members.member_id = Borrow.member_id
join Books on Books.book_id = Borrow.member_id
group by Members.name;