create database lab1;
create table users(
    id serial,
    firstname varchar(50),
    lastname varchar(50)
);

ALTER TABLE users ADD COLUMN isadmin INTEGER;
ALTER TABLE users ALTER isadmin TYPE bool USING isadmin::boolean; --changing type of column
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;
ALTER TABLE users ADD CONSTRAINT primaryKey_tmp PRIMARY KEY (id);


CREATE TABLE tasks(
  id     integer,
  name varchar(50),
  user_id integer
);

DROP TABLE tasks;
DROP DATABASE lab1;
