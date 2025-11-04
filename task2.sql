CREATE DATABASE GroceryStore;
USE GroceryStore;

CREATE TABLE Products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50),
category VARCHAR(30),
price DECIMAL(6,2),
stock INT
);

CREATE TABLE Customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
city VARCHAR(50),
phone VARCHAR(15)
);


CREATE TABLE Orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE,
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY(product_id) REFERENCES Products(product_id)
);


INSERT INTO Products(product_name,category,price,stock)VALUES('Milk','Dairy',30,30),('Tomato','Vegitable',25,80),('Bread','Backery',30,40),('cheese','Dairy',80,20),('Soap','Household',35,10);
INSERT INTO Customers(name,city,phone) VALUES('Vigneswar','Kozhokode','1234567890'),('Raman','Malappuram','2345167890'),('lakshmi','Kannur','345678190'),('Badra','Kasaragod','45671890234'),('SAraswathi','Wayanad','5678123490');
INSERT INTO Orders(customer_id,product_id,quantity,order_date) VALUES(1,1,2,'2025-11-11'),(2,2,1,'2025-10-03'),(3,4,1,'2025-12-11'),(5,3,5,'2025-09-02'),(4,5,3,'2025-11-05');

select * from Products;
select name,city from Customers;
select * from Orders;

select Customers.name as customer,Products.product_name as product 
from Orders 
join Products on Products.product_id = Orders.product_id
join Customers on Customers.customer_id = Orders.customer_id;

select * from Products where category = 'Dairy';
select * from Products where stock<50;
select * from Orders where order_date>'2025-11-01';

select Customers.name as customer_name,count(Orders.order_id) as count
from Orders
join Customers on Customers.customer_id = Orders.customer_id
group by Customers.name;

select products.product_name as product,avg(Orders.quantity) as Average
from Orders
join Products on Products.product_id = Orders.product_id
group by Products.product_name;


select name
from Customers
where city = 'Malappuram';

select Customers.name as name,SUM(Orders.quantity*Products.price) as Amount
from Orders
join Products on Products.product_id = Orders.product_id
join Customers on Customers.customer_id = Orders.customer_id
group by Customers.name