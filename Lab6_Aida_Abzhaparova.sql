
create database lab6;

create table Employees(
    Employee_id serial  PRIMARY KEY,
    First_name varchar(50) NOT NULL,
    Last_name varchar(50),
    Email varchar(100) CHECK (Email = '%@%.%'),
    Phone_number varchar(20) NOT NULL,
    Hire_date date,
    Job_id varchar(10) ,
    Salary int,
    Commission_pct float,
    Manager_id numeric,
    Department_id serial references Departments);

create table Departments(
    Department_id serial PRIMARY KEY,
    Department_name varchar(20),
    Email varchar(40) UNIQUE DEFAULT 'example@gmail.com',
    Phone_number varchar(12),
    Min_salary int CONSTRAINT const_salary CHECK (Min_salary <= Max_salary),
    Max_salary int
);

alter table Departments add constraint const_ph_no check(phone_number like '+7%');

alter table Employees add constraint  fk foreign key (EMPLOYEE_ID) references Departments(Department_id);

insert into Departments values(default, 'DataScience', 'dsa@mail.ru', '87777777777', 70000, 60000);

alter table Employees add column bonus integer ;

alter table Employees add constraint bonusChecking check(bonus>0.1 * SALARY);

select * from pg_catalog.pg_constraints;

alter table Employees drop constraint  const_ph_no;