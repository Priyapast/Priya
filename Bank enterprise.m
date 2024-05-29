create table branch(branch_name varchar(10),branch_city varchar(10),assets int,primary 
key(branch_name)); 

create table account(accno int,branch_name varchar(10),balance int,primary key(accno),foreign 
key(branch_name) references branch(branch_name));

create table customer(customer_name varchar(10),customer_street varchar(10),customer_city 
varchar(10),primary key(customer_name));

create table depositor(customer_name varchar(10),accno int,primary 
key(customer_name,accno),foreign key(customer_name) references 
customer(customer_name),foreign key(accno) references account(accno) on delete cascade);

create table loan(loan_number int,branch_name varchar(10),amount int,primary 
key(loan_number),foreign key(branch_name) references branch(branch_name));

create table borrower(customer_name varchar(10),loan_number int,primary 
key(customer_name,loan_number),foreign key(customer_name) references 
customer(customer_name),foreign key(loan_number) references loan(loan_number)); 

create table employee(emp_name varchar(20),branch_name varchar(10), salary int, primary 
key(emp_name,branch_name), foreign key(branch_name) references branch(branch_name)); 

insert into branch values(‘Jadavpur’,’Kolkata’,170000); 
insert into customer values(‘Abhilash’,’RTNagar’,’Bangalore’); 
insert into account values(1000,’Jadavpur’,50000); 
insert into depositor values(‘Abhilash’,1000); 
insert into loan values(111,’Jasola’,800000); 
insert into borrower values(‘Amit’,111); 
insert into employee values(‘Ajay’,’Jadavpur’,150000);

1.Find the names of all customers. 
select customer_name from customer;

2. Find the names of all branches in the loan relation, don’t display the duplicate values. 
select distinct branch_name from loan; 

3. Display the entire branch table. 
select * from branch; 

4. Find the account number for all accounts where the balance is greater than $700. 
select accno, balance from account where balance>700; 
5. Find the account number and balance for all the accounts from Brighton where the balance 
is greater than $800. 
select * from account where branch_name='Brighton' and balance>800; 

6. Display the branch name and assets from all branches in thousands of dollars and rename 
the assets column to ‘assets in thousands’. 
select branch_name,assets as 'assets in thousands' from branch; 

7. Find the name of all branches with assets between one and four million dollars. 
select branch_name, assets from branch where assets between '1000000' and '4000000';

8. Find the name, account number and balance of all customers who have an account. 
select c.customer_name,a.accno,a.balance from customer c, account a,depositor d where 
c.customer_name=d.customer_name and a.accno=d.accno;

9. Find the name, account number and balance of all customers who have an account with a 
balance of $400 or less. 
select c.customer_name,a.accno,a.balance from customer c, account a,depositor d where 
c.customer_name=d.customer_name and a.accno=d.accno and a.balance<400;
