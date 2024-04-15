create table Customers (
customer_id int Primary Key,
first_name varchar(20),
last_name varchar(20), 
DOB date, 
email varchar(30),
phone_number bigint,
address varchar(20))

Insert into Customers values(101, 'John', 'david','07-31-2003', 'david@gmail.com', 9683742987,'Vizag')
Insert into Customers values(102, 'John', 'Reddy','08-05-2002', 'john@gmail.com', 9683742978,'Hyderabad')
Insert into Customers values(103, 'David', 'Raj', '02-01-1997','raj@gmail.com', 9683742999,'delhi')
Insert into Customers values(104, 'Virat', 'Kohli','10-23-2010', 'virat@gmail.com', 9683745987,'Pune')
Insert into Customers values(105, 'MS', 'Dhoni', '10-04-2007','dhoni@gmail.com', 9683742947,'Delhi')
Insert into Customers values(106, 'Raj', 'Kumar', '09-04-2002','kumar@gmail.com', 9683742237,'Chennai')
Insert into Customers values(107, 'Sai', 'Ram', '08-02-2006','sai@gmail.com', 9683742984,'Chennai')
Insert into Customers values(108, 'Hema', 'Latha','12-12-2002','hema@gmail.com', 9683742287,'Vizag')
Insert into Customers values(109, 'Kalyan', 'Ram', '03-23-2004','ram@gmail.com', 9683742957,'Hyderabad')
Insert into Customers values(110, 'Nag', 'Ashwin', '12-03-2008','nag@gmail.com', 9683742917,'Vizag')

select * from Customers

create table Accounts (
account_id int primary key, 
customer_id int,
account_type varchar(20), 
balance int
foreign key (Customer_id) references customers(customer_id))

Insert into Accounts values(001, 101, 'savings', 70000)
Insert into Accounts values(002, 102, 'current', 700000)
Insert into Accounts values(003, 103, 'zero balance',970000)
Insert into Accounts values(004, 104, 'savings', 650000)
Insert into Accounts values(005, 105, 'current', 713000)
Insert into Accounts values(006, 106, 'zero balance', 4270000)
Insert into Accounts values(007, 107, 'current', 760000)
Insert into Accounts values(008, 108, 'zero balance', 3270000)
Insert into Accounts values(009, 109, 'savings', 470000)
Insert into Accounts values(010, 110, 'savings', 170000)
Insert into Accounts values(011, 104, 'current', 430000)
Insert into Accounts values(012, 105, 'zero balance', 324000)
Insert into Accounts values(013, 106, 'savings', 860000)
Insert into Accounts values(014, 101, 'savings', 0)

select * from Accounts

Create table Transactions(
transaction_id int,
Account_id int,
transaction_type varchar(10),
amount int,
transaction_date date
foreign key (Account_id) references Accounts(Account_id))

Insert into Transactions values(1000,001,'deposit',5000, '04-09-2024')
Insert into Transactions values(1001,002,'withdrawal',10000, '03-05-2024')
Insert into Transactions values(1002,003,'transfer',5420,'09-12-2023')
Insert into Transactions values(1003,004,'withdrawal',6500, '02-19-2024')
Insert into Transactions values(1004,005,'deposit', 34000,'11-29-2023')
Insert into Transactions values(1005,006,'transfer',1000,'10-02-2023')
Insert into Transactions values(1006,007,'withdrawal',35600, '01-15-2024')
Insert into Transactions values(1007,008,'deposit',2300 ,'02-19-2024')
Insert into Transactions values(1008,009,'deposit', 6000,'11-29-2023')
Insert into Transactions values(1009,0010,'withdrawal',1000, '10-02-2023')
Insert into Transactions values(1010,009,'transfer', 8000,'11-29-2023')
Insert into Transactions values(1011,0010,'withdrawal',1000, '10-02-2023')
select * from Transactions
--q2.1
select c.first_name, c.last_name, Accounts.account_type, c.email from Customers c
inner join Accounts on c.customer_id= Accounts.customer_id

--q2.2
select Customers.first_name,Customers.last_name, Transactions.transaction_type, Transactions.amount 
from Customers
inner join 
Accounts on Customers.customer_id=Accounts.customer_id
inner join
Transactions on Accounts.account_id= Transactions.Account_id

--q2.3
update Accounts set balance=balance+10000 where customer_id=106
select * from Accounts

--q2.4
select CONCAT(first_name,' ',last_name) as fullname from customers

--q2.5
delete from Accounts where account_type='savings' and balance=0

--q2.6
select * from Customers where address='vizag'

--q2.7
select sum(balance)as acc_balance from Accounts where account_type='savings'

--q2.8
select * from Accounts where account_type='current' and balance>1000

--q2.9
select * from Transactions where Account_id=10

--q2.10
SELECT account_id, amount * 1000 AS interest_accrued
FROM accounts;

--q2.11
SELECT account_id, balance
FROM accounts
WHERE balance < 200000;

--q2.12
select * from Customers
where address != 'vizag'

--q3.1
select AVG(balance)as avg_balance from Accounts

--q3.2
select top 10 * from  accounts order by balance desc 

--q3.3
SELECT c.customer_id, 
       c.first_name, 
       c.last_name, 
       SUM(t.amount) AS total_deposits
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'deposit'
  AND t.transaction_date = '04-09-2024'
GROUP BY c.customer_id, c.first_name, c.last_name;

--q3.4
select MIN(DOB) as oldest_cust, MAX(DoB) as latest_cust from Customers

--q3.5
select * from Accounts
select * from Transactions
select * from Customers

select Accounts.customer_id, Accounts.account_type,Transactions.transaction_type,Transactions.amount from Accounts
inner join 
Transactions on Accounts.account_id= Transactions.Account_id

--q3.6
select * , Accounts.account_type,Accounts.balance, Accounts.balance from Customers
inner join Accounts on
Customers.customer_id= Accounts.customer_id

--q3.7
select Customers.first_name, Customers.customer_id, Transactions.transaction_type, Transactions.amount
from Customers
inner join Accounts on Customers.customer_id= Accounts.customer_id
inner join Transactions on Accounts.account_id= Transactions.Account_id
where customers.customer_id=109


--q3.8
select *from customers where customer_id in(
select customer_id from(
select customer_id,count(customer_id) as no_of_accounts from accounts group by customer_id having count(customer_id)>1) as tempTable)

--q3.9
SELECT SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS difference
FROM Transactions
WHERE transaction_type IN ('deposit', 'withdrawal');

--q3.10
SELECT account_id ,AVG(balance) "Avg Daily Balance" FROM Accounts GROUP BY account_id;

--q3.11
SELECT 
    account_type,
    SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;

--q3.12
select account_id,count(account_id) as 
No_of_transactions from transactions
group by account_id order by no_of_transactions desc


--q3.13
select account_id,count(account_id) from transactions group by account_id having count(account_id)>1

--q3.14
SELECT * FROM Transactions WHERE account_id =
(SELECT account_id FROM Transactions
GROUP BY amount,transaction_date,account_id
HAVING COUNT(*)>1) AND
amount = 
(SELECT amount FROM Transactions
GROUP BY amount,transaction_date,account_id
HAVING COUNT(*)>1) AND 
transaction_date = 
(SELECT transaction_date FROM Transactions
GROUP BY amount,transaction_date,account_id
HAVING COUNT(*)>1);

--q4.1

select c.first_name,a.account_id,c.customer_id,c.dob,c.phone_number from customers c 
inner join 
accounts a on c.customer_id=a.customer_id where
balance in (select max(balance) from accounts )

--q4.2
select avg(balance) from accounts where customer_id=(
select customer_id from accounts group by customer_id having count(customer_id)>1)

--q4.3
select *from accounts where account_id in(
select account_id from transactions where amount>(
select avg(amount) as average_amount from transactions))

--q4.4
select *from customers where customer_id not in (select distinct customer_id from accounts)

--q4.5
select sum(balance) as Total_balance from accounts where account_id not in(select distinct account_id from transactions)

--q4.6
select *from transactions where account_id =(
select account_id from accounts where balance=(select min(balance) from accounts))

--q4.7
select *from customers where customer_id in(
select customer_id from accounts group by customer_id having count(customer_id)>1)

--q4.8
SELECT account_type,CONVERT(VARCHAR,(count(*) * 100) / (SELECT COUNT(*) FROM Accounts))+'%'  "Percentage" 
FROM Accounts
GROUP BY account_type;

--q4.9
select *from transactions where account_id=(
select account_id from accounts where customer_id=1)

--q4.10
SELECT account_type, 
(SELECT SUM(balance) FROM Accounts WHERE account_type =A.account_type) AS total_balance
FROM Accounts A
GROUP BY account_type;



