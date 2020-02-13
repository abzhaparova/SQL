create database labka2;
CREATE TABLE Faculties (id serial, name varchar(100), number_of_students integer);
ALTER TABLE Faculties ADD description text;
ALTER TABLE Faculties ALTER COLUMN name  TYPE varchar(150);
ALTER TABLE Faculties ADD PRIMARY KEY(id);

CREATE TABLE Students (id serial, first_name varchar(150),
last_name varchar(150), gender varchar(10),faculty_id int,
FOREIGN KEY (faculty_id) REFERENCES Faculties(id), is_finished boolean);

ALTER TABLE Students ALTER COLUMN is_finished SET DEFAULT FALSE;
DROP TABLE Faculties RESTRICT;
DROP TABLE Faculties CASCADE;
DROP database labka2;