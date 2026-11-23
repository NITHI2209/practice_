/*23/11/2026*/
create database retail_sales
use retail_sales

/*creating 5 tables */
create table customers(
customerID int,
customer_name varchar(255),
city varchar(255),
age int ,
gender varchar(255))

create table products(
product_id int,
product_name varchar(255),
category varchar(255),
price int,
stock int)


create table orders(
orderid int,
customer_id int,
order_date date,
payment_status varchar(255))

create table order_details(
order_detail_id int,
order_id int,
product_id int,
quantity int)

create table employees(
employee_id int,
employee_name varchar(255),
department varchar(255),
salary int,
manager_id int)

/*inserting values*/
insert into customers(customerID ,customer_name,city,age,gender) values 
(101, 'Arun', 'Chennai', 25, 'Male'),
(102, 'Priya', 'Bangalore', 28, 'Female'),
(103, 'Karthik', 'Chennai', 32, 'Male'),
(104, 'Divya', 'Hyderabad', 24, 'Female'),
(105, 'Rahul', 'Mumbai', 30, 'Male'),
(106, 'Sneha', 'Bangalore', 27, 'Female'),
(107, 'Vignesh', 'Coimbatore', 35, 'Male'),
(108, 'Meena', 'Chennai', 29, 'Female')


INSERT INTO products
(product_id, product_name, category, price, stock)
VALUES
(201, 'Laptop', 'Electronics', 55000, 10),
(202, 'Mobile', 'Electronics', 25000, 20),
(203, 'Headphones', 'Accessories', 1500, 50),
(204, 'Keyboard', 'Accessories', 800, 30),
(205, 'Monitor', 'Electronics', 12000, 15),
(206, 'Mouse', 'Accessories', 500, 40),
(207, 'Printer', 'Electronics', 8500, 8),
(208, 'Webcam', 'Accessories', 2200, 25);

INSERT INTO orders
(orderid, customer_id, order_date, payment_status)
VALUES
(301, 101, '2026-01-05', 'Paid'),
(302, 102, '2026-01-08', 'Paid'),
(303, 103, '2026-01-10', 'Pending'),
(304, 101, '2026-01-15', 'Paid'),
(305, 104, '2026-02-02', 'Paid'),
(306, 105, '2026-02-05', 'Cancelled'),
(307, 106, '2026-02-10', 'Paid'),
(308, 102, '2026-02-15', 'Pending'),
(309, 107, '2026-03-01', 'Paid')

INSERT INTO order_details
(order_detail_id, order_id, product_id, quantity)
VALUES
(401, 301, 201, 1),
(402, 301, 203, 2),
(403, 302, 202, 1),
(404, 302, 206, 2),
(405, 303, 204, 3),
(406, 304, 205, 1),
(407, 304, 206, 1),
(408, 305, 207, 1),
(409, 307, 203, 2),
(410, 307, 208, 1),
(411, 308, 201, 1),
(412, 309, 202, 2)

INSERT INTO employees
(employee_id, employee_name, department, salary, manager_id)
VALUES
(501, 'Suresh', 'Sales', 35000, NULL),
(502, 'Anitha', 'HR', 40000, 501),
(503, 'Manoj', 'Sales', 45000, 501),
(504, 'Kavya', 'IT', 55000, 501),
(505, 'Ramesh', 'Finance', 38000, 502),
(506, 'Lakshmi', 'IT', 60000, 504)

/* SELECT - data query language (DQL)*/
select * from customers
select * from products
select * from orders
select * from order_details
select * from products

/*Level 1: Database, Tables and Basic SQL*/
/*1) Display all records from the customers table.*/
select * from customers

/*2) Display only customer names and cities.*/
select customer_name , city from customers

/*3) Display all products from the products table.*/
select * from products

/*4) Create a new database named Practice_DB*/
create database Practice_DB

/*5) Create a table named Departments with department ID and department name.*/
create table departments(
department_id int,
department_name varchar(255))

/*6) Insert 3 records into the Departments table.*/
insert into departments(department_id,department_name)
Values (1,'HR') ,(2,'DS'),(3,'Finance')

/*7)Add a column named email to the customers table.*/
alter table customers add email varchar(255)

/*8) Change the data type of the customer name column to VARCHAR(100)*/
alter table customers 
alter column customer_name varchar(100)

/*9)Create a copy of the customers table with all its data.*/
select * into custo from customers
select * from custo

/*10)Create an empty copy of the products table.*/
select * into produ from products
where 1 = 0  /* always false ,no row is inserted */
select * from produ

/*11) Rename the copied customers table */
sp_rename 'custo','customer_new'

select * from customer_new

/*12)Delete the copied table using DROP.*/
drop table customer_new

/*13) Delete all records from a temporary table using TRUNCATE*/
truncate table produ
select * from produ

/*Level 2: SELECT, DISTINCT and Operators*/
/*14) Display all unique cities from the customers table*/
select distinct city from customers

/*15)Display all unique product categories.*/
select distinct category from products

/*16)Find customers whose age is greater than 28.*/
select customer_name , age from customers where age > 28

/*17)Find products with a price greater than ₹10,000.*/
select product_name , price from products 
where price > 10000

/*18) Find products whose stock is less than 20.*/
select product_name , stock from products where stock < 20

/*19) Find customers who are from Chennai AND older than 25.*/
select customer_name , city, age from customers 
where city = 'chennai' and age > 25

/*20) Find customers who are from Chennai OR Bangalore */
select customer_name,city,age from customers
where city = 'chennai' or city = 'Bangalore'

/*21) Find customers who are NOT from Chennai.*/
select * from customers
where city not in ('chennai')

/*22) Find customers whose names start with 'A'*/
select customer_name ,age , city from customers
where customer_name like 'a%'

/*23) Find products belonging to Electronics or Accessories using IN.*/
select * from products
where category  = 'Electronics' or category = 'Accessories'

/*24) Display employees in descending order of salary.*/
select * from employees 
order by salary DESC

/*25) Find the average, maximum and minimum product price.*/
select avg(price) as average_price ,
max(price) as max_price , 
min(price) as min_price from products

/*GROUP BY and HAVING*/
/* 26)Count the number of customers in each city*/
select city , count(customerid) as total_customers
from customers
group by city

/*27) Find the average salary in each department.*/
select avg(salary) as avg_sal , department from employees
group by department

/*28) Find departments having more than one employee.*/
select department , count(employee_id) as total_employee from employees
group by department 
having count(employee_id) > 1

/*29)Find product categories whose average price is greater than ₹5,000.*/
select avg(price) , category from products
group by category
having avg(price) > 5000

/*Joins*/

/*30) Display customer names along with their order IDs */

 

