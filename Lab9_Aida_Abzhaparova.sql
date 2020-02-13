create database lab9;

--1. Create table Employees:
CREATE TABLE Employees(
    id serial PRIMARY KEY,
    name varchar(255),
    age int,
    address varchar(255),
    salary real,
    department_id int
);

--2. Create View Address_view which contains only name and address from Employee table
CREATE VIEW Address_view AS SELECT name, address FROM Employees;

--3. Rename a view Address_view .
ALTER VIEW address_view RENAME TO new_address_view;

--4. Create a view which stores only the address of David from view Address_view.
CREATE VIEW david_address AS SELECT address FROM new_address_view WHERE name LIKE 'David';

--5. Drop view Address_view.
DROP VIEW new_address_view CASCADE;

--6. Create a role (without a password) that can log in.
CREATE ROLE person WITH LOGIN;

--7. Create a role with a password that is valid until the end of 2019. After first january in 2020, the password is no longer valid.
CREATE ROLE person_password WITH PASSWORD 'F@pqvj2019' VALID UNTIL '01-01-2020';

--8. Create a role that can create databases and manage roles.
CREATE ROLE manager CREATEDB CREATEROLE;

--9. Change a role's password 'dsa8tyu75'; Remove a role's password.
ALTER ROLE person_password PASSWORD 'dsa8tyu75';
ALTER ROLE person_password PASSWORD NULL;

--10. Change a password expiration date, specifying that the password should expire at midday on 1th May 2020 using the time zone which is one hour ahead of UTC.
ALTER ROLE person_password VALID UNTIL '01-05-2020 12:00:00';

--11. Make a password valid forever.
ALTER ROLE person_password VALID UNTIL 'infinity';

--12. Give a role a non-default setting of the maintenance_work_mem parameter.
ALTER ROLE person_password SET maintenance_work_mem = 546511;

--13. Create a materialized view with no data which contains all employees with salary greater than 20000.
CREATE MATERIALIZED VIEW salary AS SELECT * FROM Employees
WHERE salary > 20000
WITH NO DATA;

--14. Create a view 'emp_view' taking records (for employee_id, name, salary columns) of
--employees table if those records contain the value 50 for department_id column.
CREATE VIEW emp_view AS SELECT id, name, salary FROM Employees
WHERE department_id = 50;

--15. Drop view from task 14 (use CASCADE).
DROP VIEW emp_view Cascade;

--16. Ñreate a materialized view 'emp_mview' taking all the records of employees table, if
--(A)first_name of the employee starts with any of the characters from 'A' through 'H' and (B)
--salaries are any of the following 10000,20000,15000.
CREATE MATERIALIZED VIEW emp_mview AS SELECT * FROM Employees
WHERE name >= 'A%' AND name <= 'H%' AND salary IN (10000, 20000, 15000);