create database lab8;

create table actors(id serial, first_name varchar, last_name varchar, age int, last_update timestamp);

INSERT INTO actors VALUES (default, 'John', 'Jonnaat', 50, default),
                         (default, 'Sammy', 'Nathan', 33, now()),
                         (default, 'Sunny', 'Huschle', 51, '2020-01-25 21:15:56'),
                         (default, 'Silly', 'Bosh', 26, '2012-01-23 19:40:14'),
                         (default, 'Andy', 'Kuku', 65, '2016-11-24 21:12:19'),
                         (default, 'Ziaak', 'Allko', 56, '2015-01-24 21:40:19'),
                         (default, 'Looji', 'Hatiko', 3, '2019-01-24 21:44:19'),
                         (default, 'Jay', 'Ziaa', 35, '2019-01-24 21:34:19'),
                         (default, 'Josh', 'Kokga', 25, '2019-01-24 11:40:19'),
                         (default, 'John', 'Winter', 25, '2019-01-27 01:40:19');

--task1--1. Create index for queries like below: SELECT * FROM actor WHERE first_name = ‘John’;
CREATE INDEX name_index ON actors(first_name);

--task2--2. Create index for queries like below: SELECT * FROM actor WHERE first_name = ‘RAY’ AND last_name =‘JOHANSSON’;
CREATE INDEX last_name_index ON actors(first_name, last_name);

--task3--3. Create unique index for queries like below SELECT * FROM actor WHERE last_update BETWEEN 2018.01.01 AND 2019.01.01 ;
CREATE UNIQUE INDEX date_index ON actors(last_update);

--task4--4. Create index for queries like below: SELECT * FROM actor WHERE substring(first_name from 1 for 4) = ‘NICK’;
CREATE INDEX fnamesubstr_index ON actors(substring(first_name, 1, 4));

--task5-5. Create index for queries like below: SELECT * FROM actor JOIN film_actor ON a.actor_id = f.actor_id WHERE a.last_update > “2019.09.31” AND e.last_update < “2016.12.12”;
CREATE INDEX indexx_by ON actors(last_update);
FROM pg_index GROUP BY indrelid,indkey HAVING COUNT(*) > 1;

--task6-6. Select indexes for tables whose name start with the letter A.
select * FROM pg_indexes where tablename like 'a%';

--task7-7. Indexes accumulate over time, and sometimes a new index may contain the same definition as one of the previous ones. How to find the same definitions.
ALTER TABLE pg_indexes add constraint unique (indexdef);
