--Create Database
create database Assignment01_Kushal;

--Sql query for the table creation 
create table emp_department(
DPT_CODE int primary key not null, 
DPT_NAME varchar(15) not null,       
DPT_ALLOTMENT int not null
);

create table emp_details (
EMP_IDNO int primary key not null,
EMP_FNAME varchar(12) not null,
EMP_LNAME varchar(12) not null,
EMP_DEPT int foreign key REFERENCES emp_department(DPT_CODE)
);

create table company_mast(
COM_ID int primary key not null,
COM_NAME varchar(20) not null
);

create table item_mast(
PRO_ID int primary key not null,
PRO_NAME varchar(20) not null,
PRO_PRICE int not null,
PRO_COM int foreign key references company_mast(COM_ID)
);

create table salesman(
	salesman_id int primary key not null,   
	name varchar(15) not null,
	city varchar(12) not null,
	commission float not null
);

create table customer (
customer_id int primary key not null,
cust_name varchar(15) not null,
city varchar(15) not null,
grade int ,
salesman_id int foreign key references salesman(salesman_id)  
);

create table orders(
ord_no int primary key not null,
purch_amt float not null,
ord_date date not null,
customer_id int foreign key references customer(customer_id),
salesman_id int foreign key references salesman(salesman_id)
);

insert into emp_department values (57,'IT',65000),
(63,'Finance',15000),
(47,'HR',240000),
(27,'RD',55000),
(89,'QC',75000);

insert into emp_details values(127323,'Michale','Robbin',57),
(526689,'Carlos','Snares',63),
(843795,'Enric','Dosio',57),
(328717,'Jhon','Snares',63),
(444527,'Joseph','Dosni',47),
(659831,'Zanifer','Emily',47),
(847674,'Kuleswar','Sitaraman',57),
(748681,'Henrey','Gabriel',47),
(555935,'Alex','Manuel',57),
(539569,'George','Mardy',27),
(733843,'Mario','Saule',63),
(631548,'Alan','Snappy',27),
(839139,'Maria','Foster',57);

insert into company_mast values(11,'Samsung'),
(12,'iBall'),
(13,'Epsion'),
(14,'Zebronics'),
(15,'Asus'),
(16,'Frontech');

insert into item_mast values (101,'Mother Board',3200,15),
(102,'Key Board',450,16),
(103,'ZIP drive',250,14),
(104,'Speaker',550,16),
(105,'Monitor',5000,11),
(106,'DVD drive',900,12),
(107,'CD drive',800,12),
(108,'Printer',2600,13),
(109,'Refill cartridge',350,13),
(110,'Mouse',250,12);

insert into salesman values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

insert into customer values(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad Guzan','London',NUll,5005);

insert into orders values (70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001);


--(1) Write a SQL statement to find the total purchase amount of all orders.
select sum(purch_amt) as total_purchase_amount from orders; 

--(2) Write a SQL statement to find the average purchase amount of all orders.
select avg(purch_amt) as average_purchase_amount from orders; 

--(3) Write a SQL statement to find the number of salesmen currently listing for all of their customers
select count(distinct salesman_id) as number_of_salesmen from customer;

--(4) Write a SQL statement to know how many customer have listed their names.
select count(customer_id) as Listed_Customers from customer;

--(5) Write a SQL statement find the number of customers who gets at least a gradation for his/her performance
select count(grade) as Gradation_gets from customer;

--(6) Write a SQL statement to get the maximum purchase amount of all the orders
select max(purch_amt) as Maximum_Purchase_Amount from orders;

--(7) Write a SQL statement to get the minimum purchase amount of all the orders
select min(purch_amt) as Minimum_Purchase_Amount from orders;

--(8) Write a SQL statement which selects the highest grade for each of the cities of the customers.   
select city, max(grade)as Grade from customer group by city;

--(9) Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount. 
select customer_id, max(purch_amt) as Highest_Purch_Amt  from orders group by customer_id;

--(10) Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount. 
select customer_id,ord_date,max(purch_amt) as Highest_Purch_Amt from orders group by customer_id, ord_date;

--(11) Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.
select salesman_id, max(purch_amt) as Highest_Purch_Amt from orders where ord_date = '2012-08-17' group by salesman_id ;

--(12) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000.  
select customer_id, ord_date, max(purch_amt) as Highest_Purch_amt from orders group by customer_id,ord_date having max(purch_amt)>2000;

--(13) Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000
select customer_id, ord_date, max(purch_amt) as Highest_Purch_amt from orders group by customer_id,ord_date having max(purch_amt) between 2000 and 6000 ;

--(14) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.  
select customer_id, ord_date, max(purch_amt) as Highest_Purch_amt from orders group by customer_id,ord_date having max(purch_amt) in (2000,3000,5760,6000);

--(15) Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007.
select customer_id, max(purch_amt) as Highest_Purch_amt from orders group by customer_id having customer_id between 3002 and 3007;

--(16) Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000.  
select customer_id,purch_amt from orders where customer_id between 3002 and 3007  group by customer_id,purch_amt having max(purch_amt) > 1000;
select customer_id,max(purch_amt) from orders where customer_id between 3002 and 3007  group by customer_id having max(purch_amt) > 1000;

--(17) Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008. 
select salesman_id,max(purch_amt) from orders where salesman_id between 5003 and 5008 group by salesman_id;

--(18) Write a SQL statement that counts all orders for a date August 17th, 2012.   
select count(ord_no) from orders where ord_date='2012-08-17';

--(19) Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified.   
select count(salesman_id), city from salesman group by city;
select count(*) from salesman where city is not null; 

--(20) Write a query that counts the number of salesmen with their order date and ID registering orders for each day.
select ord_date,salesman_id,count(salesman_id) from orders group by ord_date,salesman_id;
select ord_date,count(salesman_id) from orders group by ord_date;

--(21) Write a SQL query to calculate the average price of all the products. 
select avg(PRO_PRICE) as Avg_Price from item_mast ;

--(22) Write a SQL query to find the number of products with a price more than or equal to Rs.350.
select count(*) from item_mast where PRO_PRICE >= 350;

--(23) Write a SQL query to display the average price of each company's products, along with their code.
select PRO_COM,avg(PRO_PRICE) from item_mast group by PRO_COM;

select company_mast.COM_NAME,item_mast.PRO_COM ,avg(item_mast.PRO_PRICE) from item_mast inner join company_mast on item_mast.PRO_COM = company_mast.COM_ID group by item_mast.PRO_COM,company_mast.COM_NAME;

--(24) Write a query in SQL to find the sum of the allotment amount of all departments. 
select sum(DPT_ALLOTMENT) from emp_department;

--(25) Write a query in SQL to find the number of employees in each department along with the department code.
select count(EMP_IDNO) as No_Of_Employees,EMP_DEPT as Department_code from emp_details group by EMP_DEPT;


