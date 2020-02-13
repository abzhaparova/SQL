
create database lab5;

CREATE Table Employees(EMPLOYEE_ID serial primary key, FIRST_NAME varchar(50), LAST_NAME varchar(50), EMAIL varchar(100), PHONE_NUMBER varchar(20), HIRE_DATE date,
 JOB_ID varchar(10), SALARY int, COMMISSION_PCT float, MANAGER_ID numeric, DEPARTMENT_ID numeric);

INSERT INTO Employees VALUES
(default,'Steven','King','SKING','515.123.4567','1987-06-17','AD_PRES', 24000.00, 0.00, 0, 90),
(default,'Neena','Kochhar','NKOCHHAR','515.123.4568','1987-06-18','AD_VP', 17000.00, 0.00,100,90),
(default,'Lex','De Haan','LDEHAAN' ,'515.123.4569','1987-06-19','AD_VP', 17000.00, 0.00,100,90),
(default,'Alexander','Hunold','AHUNOLD','590.423.4567','1987-06-20','IT_PROG', 9000.00, 0.00, 102, 60),
(default,'Bruce', 'Ernst','BERNST','590.423.4568','1987-06-21','IT_PROG', 6000.00, 0.00, 103, 60 ),
(default,'David','Austin','DAUSTIN','590.423.4569','1987-06-22','IT_PROG' , 4800.00, 0.00, 103, 60),
(default,'Valli','Pataballa','VPATABAL','590.423.4560','1987-06-23','IT_PROG', 4800.00, 0.00, 103, 60),
(default,'Diana','Lorentz','DLORENTZ','590.423.5567','1987-06-24','IT_PROG', 4200.00, 0.00, 103, 60),
(default,'Nancy','Greenberg','NGREENBE','515.124.4569','1987-06-25','FI_MGR', 12000.00, 0.00, 101, 100),
(default,'Daniel','Faviet','DFAVIET','515.124.4169','1987-06-26','FI_ACCOUNT', 9000.00, 0.00, 108, 100),
(default,'John','Chen','JCHEN','515.124.4269','1987-06-27','FI_ACCOUNT', 8200.00, 0.00, 108, 100),
(default,'Ismael','Sciarra','ISCIARRA','515.124.4369','1987-06-28','FI_ACCOUNT', 7700.00, 0.00, 108, 100),
(default,'Jose Manuel','Urman','JMURMAN','515.124.4469','1987-06-29','FI_ACCOUNT', 7800.00, 0.00, 108, 100),
(default,'Luis','Popp','LPOPP','515.124.4567','1987-06-30','FI_ACCOUNT' , 6900.00, 0.00, 108 ,100 ),
(default,'Karen','Colmenares','KCOLMENA','515.127.4566','1987-07-06','PU_CLERK', 2500.00, 0.00, 114, 30),
(default,'Matthew','Weiss','MWEISS','650.123.1234','1987-07-07','ST_MAN', 8000.00, 0.00,  100, 50),
(default,'Adam','Fripp','AFRIPP','650.123.2234','1987-07-08','ST_MAN', 8200.00, 0.00, 100, 50),
(default,'Payam','Kaufling','PKAUFLIN','650.123.3234','1987-07-09','ST_MAN', 7900.00,  0.00,  100, 50),
(default,'Shanta','Vollman','SVOLLMAN','650.123.4234','1987-07-10','ST_MAN', 6500.00,  0.00,  100, 50),
(default,'Kevin','Mourgos','KMOURGOS' ,'650.123.5234','1987-07-11','ST_MAN', 5800.00,  0.00,  100, 50),
(default,'Britney','Everett','BEVERETT','650.501.2876','1987-09-18','SH_CLERK', 3900.00,  0.00, 123, 50),
(default,'Samuel','McCain','SMCCAIN','650.501.3876','1987-09-19','SH_CLERK', 3200.00, 0.00, 123, 50 ),
(default,'Michael','Hartstein','MHARTSTE','515.123.5555','1987-09-26','MK_MAN', 1300.00, 0.00, 100, 20),
(default,'Pat','Fay','PFAY','603.123.6666','1987-09-27','MK_REP', 6000.00, 0.00, 201, 20 ),
(default,'Susan','Mavris','SMAVRIS','515.123.7777','1987-09-28','HR_REP' , 6500.00, 0.00, 101, 40 ),
(default,'Hermann','Baer','HBAER','515.123.8888','1987-09-29','PR_REP', 10000.00, 0.00, 101, 70),
(default,'Shelley','Higgins','SHIGGINS','515.123.8080','1987-09-30','AC_MGR' , 12000.00, 0.00, 101, 110),
(default,'William','Gietz','WGIETZ','515.123.8181','1987-10-01','AC_ACCOUNT' , 8300.00, 0.00, 205, 110 );

SELECT DISTINCT DEPARTMENT_ID FROM Employees;

UPDATE employees SET phone_number = REPLACE(phone_number, '124', '999') WHERE phone_number LIKE '%124%';

SELECT * FROM Employees WHERE FIRST_NAME LIKE '________%';

SELECT * FROM employees  WHERE LENGTH(first_name) >= 8;

SELECT upper(FIRST_NAME) FROM Employees;

UPDATE Employees SET EMAIL = concat(EMAIL, '@example.com');

SELECT EMPLOYEE_ID, FIRST_NAME, EXTRACT(MONTH FROM HIRE_DATE) FROM Employees;

SELECT substr(PHONE_NUMBER, 9,4) FROM Employees;

SELECT RIGHT(PHONE_NUMBER, 4) FROM employees;

SELECT FIRST_NAME AS Name, length(FIRST_NAME) AS "Length of the name" FROM Employees WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'J%' OR FIRST_NAME LIKE 'M%';

SELECT MAX(SALARY) FROM Employees WHERE JOB_ID = 'IT_PROG';

SELECT MAX(SALARY) - MIN(SALARY) FROM Employees;

SELECT MANAGER_ID, min(SALARY) FROM Employees GROUP BY MANAGER_ID;

SELECT FIRST_NAME, LAST_NAME, SALARY FROM Employees WHERE SALARY BETWEEN  10000 AND 50000;

SELECT LAST_NAME, JOB_ID, SALARY FROM Employees WHERE JOB_ID != 'IT_PROG' AND JOB_ID != 'SH_CLERK' AND SALARY != 4500 AND SALARY != 10000 AND SALARY != 15000;

SELECT * FROM Employees ORDER BY EMPLOYEE_ID LIMIT 10;

SELECT LAST_NAME FROM Employees WHERE LAST_NAME LIKE '__e%';