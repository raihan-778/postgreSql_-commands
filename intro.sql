-- Active: 1693892583935@@127.0.0.1@5432@test_01
--## Create A students TABLE
-- create TABLE students (
--  student_id INTEGER,
-- firsr_name VARCHAR(50),
-- last_name VARCHAR(50),
-- cgpa NUMERIC(1,2)
-- )

--## Rename a Tabel

ALTER TABLE students RENAME to learnears

--## Delete a Tabel
-- DROP TABLE learnears

--## Create a TABLE
-- create TABLE "user"(
-- user_id SERIAL PRIMARY KEY,
-- user_name VARCHAR(255) UNIQUE NOT NULL,
-- email VARCHAR(255) UNIQUE NOT NULL
-- )
create TABLE "user2"(
user_id SERIAL,
user_name VARCHAR(255) NOT NULL UNIQUE,
email VARCHAR(255) NOT NULL UNIQUE,
age int DEFAULT 18
)

insert into user2 values (1, 'abc', 'ab@gmail.com')

--multiple insert in a TABLE
insert into user1 values
(1,'raihan', 'raihan@gmail.com'),
(2, 'rajib', 'rajib@gmail.com');

--### Alter TABLE
-- Add a column, drop a column, change datatype in a COLUMN
-- rename a column, set default value for a COLUMN
-- add constrain to a column, drop CONSTRAINT for a COLUMN
-- table RENAME
-- command line -> (alter table table_name action(COMMAND FOR ADD RENAME DROP ETC))
--## example

--## add a column
alter table user1 
add column password VARCHAR(255) default 'admin123' not null

alter table user1 
add COLUMN age INT DEFAULT 23 not null;

--## delete a column
alter table user1
drop COLUMN age 
--## add a column
alter table user1
add COLUMN demu INT

--## change data type of a column
alter table user1
 alter COLUMN demu type text;

 --## set default value in a COLUMN
 alter TABLE user1
  alter column demu set default 'add_text';
 --## delete default value in a COLUMN
 alter TABLE user1
  alter column demu drop default;

  --## insert values in a table
  insert into user1 values(2, 'demu_2', 'demu_2');

--## rename column in a table
   alter TABLE user1
  RENAME column demu to country;

--## set CONSTRAINT in a table column
   alter TABLE user1
    alter country set NOT NULL;

    --## set unique CONSTRAINT in a table COLUMN
    alter table user1
    ADD Constraint unique_email UNIQUE(email);

     --## drop unique CONSTRAINT from a table COLUMN
    alter table user1
    DROP Constraint unique_email

    --##--
    create TABLE Department(
        deptId SERIAL PRIMARY KEY,
        deptName VARCHAR(50) NOT NULL
    );
    insert into Department VALUES(1, 'Chemistry');

    delete from Department where deptId=1

    create table Employee(
        empId SERIAL PRIMARY KEY,
        empName VARCHAR(50) NOT NULL,
        departmentId INT,
        constraint fk_constraint_dept 
        Foreign Key (departmentId)
        REFERENCES Department(deptId)
    );

    insert into Employee VALUES(1,'raihan', 1)

--## delete specific data from a table column
    delete from Employee where departmentId=1

    create table Courses(
      courseId serial PRIMARY KEY,
      course_name VARCHAR(50) NOT NULL,
      description VARCHAR(255),
      published_date DATE
    );