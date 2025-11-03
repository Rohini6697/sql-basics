CREATE DATABASE mydatabase;
USE mydatabase;
CREATE TABLE employees(
id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
position VARCHAR(50) NOT NULL,
salary VARCHAR(50) NOT NULL
);
CREATE TABLE products(
product_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
price DECIMAL(10,2) NOT NULL,
stock_quantity INT NOT NULL
);


ALTER TABLE employees add email VARCHAR(50);
ALTER TABLE employees DROP COLUMN position;

ALTER TABLE employees add position VARCHAR(50);
INSERT INTO employees (id,name,position,salary) VALUES(1,'Jhone Doe','Manager',60000);
INSERT INTO employees (id,name,position,salary) VALUES(2,'Kiff','HR',50000),(3,'Barry','Intern',20000),(4,'Lilly','Assistant',40000);

UPDATE employees SET salary = 700000 WHERE id = 1;
UPDATE employees SET position = 'senior staff' WHERE salary>50000;


DELETE FROM employee WHERE name = 'Jhone Doe';
DELETE FROM products WHERE stock_quantity = 0;

SELECT * FROM employees;
SELECT name,salary FROM employees WHERE salary>50000;
SELECT COUNT(*) FROM products WHERE price >20;


DROP TABLE employees;
ALTER TABLE products DROP COLUMN price; 






