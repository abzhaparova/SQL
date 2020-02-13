create database lab4;

create table Worker(WORKER_ID serial not null primary key,
FIRST_NAME varchar(25),
LAST_NAME varchar(25),
SALARY int,
JOINING_DATE date,
DEPARTMENT char(25));

insert into Worker(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
values
(default, 'Moni', 'Kerma', 100000, '02-17-19', 'Programmer'),
(default, 'Monika', 'Arora', 100000, '02-14-20', 'HR'),
(default, 'Niharika', 'Verma', 80000, '06-14-11', 'Admin'),
(default, 'Vishal', 'Singhal', 300000, '02-14-20', 'HR'),
(default, 'Amitabh', 'Singh', 500000, '02-14-20', 'Admin'),
(default, 'Vivek', 'Bhati', 500000, '06-14-11', 'Admin'),
(default, 'Vipul', 'Diwan', 200000, '06-14-11', 'Account'),
(default, 'Satish', 'Kumar', 75000, '01-14-20', 'Account'),
(default, 'Geetika', 'Chauhan', 90000, '04-14-11', 'Admin');


select FIRST_NAME as worker_name from Worker;

select * from Worker
Order by FIRST_NAME ASC;


select * from Worker
where FIRST_NAME = 'Vipul' AND FIRST_NAME = 'Satish';

select * from Worker
where DEPARTMENT = 'Admin';

select DEPARTMENT, count(*) from Worker
group by DEPARTMENT
order by DEPARTMENT DESC ;


select DEPARTMENT, count(*) from Worker
group by DEPARTMENT having DEPARTMENT = 'Account';

select max(SALARY) from Worker
where SALARY < (select max(SALARY) from Worker)
group by  DEPARTMENT = 'Admin';

select distinct DEPARTMENT from Worker
order by DEPARTMENT DESC;



select distinct DEPARTMENT from Worker
order by DEPARTMENT ASC;

select count(*), sum(SALARY) from Worker;

select sum(SALARY) from Worker
where JOINING_DATE ='06-14-11';

select DEPARTMENT from Worker
group by DEPARTMENT
having count(*) > 2;


select count(*), min(SALARY), max(SALARY) from Worker
group by JOINING_DATE
order by JOINING_DATE ASC;
