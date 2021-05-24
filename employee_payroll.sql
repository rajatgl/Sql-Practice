show databases;
#UC1 
create database if not exists employee_payroll_service;
use employee_payroll_service;
select database();
#UC2
create table if not exists employee_payroll
(
	id INT unsigned NOT NULL AUTO_INCREMENT,
	name VARCHAR(150) NOT NULL,
    salary double NOT NULL ,
    start DATE NOT NULL,
    primary key (id)
);
describe employee_payroll;
#UC3
insert into employee_payroll (name,salary,start) values
	('Rajat',1000000.0,'2021-05-24'),
    ('Rakshit',2000000.0,'2021-07-19'),
    ('Prabha',50000.0,'2018-05-12');
#UC4
select*from employee_payroll;
#UC5
select*from employee_payroll where name="Rajat";
select*from employee_payroll where start between
 cast('2018-05-12'as date) and date(now());
 #UC6
 alter table employee_payroll add gender char(1) not null after name;
 #update gender column using condition statement
 update employee_payroll set gender = case when name like '%a' then 'F'
 else 'M' end;
 select*from employee_payroll;
 #UC7
 select sum(salary) from employee_payroll where gender='F';
 select salary,name from employee_payroll where gender='M' group by salary;
 select min(salary) as MINIMUM_SALARY from employee_payroll;
 select count(id) as HEAD_COUNT from employee_payroll;
 select max(salary) as MAXIMUM_SALARY from employee_payroll;
 select avg(salary) as AVERAGE_SALARY from employee_payroll;
 #UC8
 #Create table to store extended employee details
 create table if not exists employee_details
 (employee_id int unsigned,
 phone int(10) unique,
 residence varchar(10),
 foreign key(employee_id) references employee_payroll(id) on delete cascade);
 desc employee_details;
 insert into employee_details values(1,'849694248','Kolhapur'),
 (2,'897575511','Kolhapur'),
 (3,'898775511','Mumbai');
 select*from employee_details;
 #Create table to store department details
 create table if not exists department
 (id int unsigned not null auto_increment,
 dpt_name varchar(10) not null,
 primary key(id));
 desc department;
 insert into department(dpt_name) values
 ('solutions'),('design'),('marketing'),('sales');
 select*from department;
 #Create table for employee's department details
 create table if not exists department_registery
 (employee_id int unsigned not null,
 dpt_id int unsigned not null,
 foreign key(employee_id) references employee_payroll(id) on delete cascade,
 foreign key(dpt_id) references department(id) on delete cascade);
 
#Insert Terissa into employee table
insert into employee_payroll(name,gender,salary,start) value
 ('Terissa','F','30000',date(now()));
#Assigning her marketing and sales department
insert into department_registery values(4,3),(4,4);
insert into department_registery values(1,2),(2,3),(3,1);
select*from department_registery;
#Fetch departments assigned to her
select dpt_name from department inner join department_registery
 where  department_registery.employee_id='4' and department.id = department_registery.dpt_id;



 
 