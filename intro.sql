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

insert into Courses(course_name, description, published_date)
VALUES
  ('Basic posgreSql', 'basic sql for beginers', '2014-5-24'),
  ('Advanced PostgreSql', 'Advanced topic of Sql', '2010-5-19'),
  ('PostgreSQL', 'Advanced topic of Sql with project', '2018-5-19' );
  
update Courses
set 
  course_name='Introduction to postgreSQL',
  published_date='2017-05-19'
  where courseId >1 or courseId <4

select * from Courses

--## delete Rows in a TABLE

delete FROM Courses
where courseId=1

create TABLE if NOT exists Departments(
deptID SERIAL PRIMARY KEY,
deptName TEXT NOT NULL
);


CREATE TABLE if NOT exists Employees(
  empId SERIAL PRIMARY KEY,
  empName TEXT NOT NULL,
  email TEXT NOT NULL,
  salary int NOT NULL,
  joining_date DATE NOT NULL,
  deptID  NOT NULL,
  constraint fk_deptID
    FOREIGN KEY(deptID)
    REFERENCES Departments(deptID)
);


insert into Departments values
(1, 'Accounts'),
(2, 'Finance'),
(3,'Development'),
(4, 'Testing');

select * from Departments

select * from Employees;

insert into Employees (empName, email, salary, joining_date, deptID)
VALUES
('Ruth Turner', 'ruth.turner@example.com', 67000.00, '2027-08-20', 2),
('Larry Martin', 'larry.martin@example.com', 60000.00, '2027-09-27', 4),
('Angela Smith', 'angela.smith@example.com', 71000.00, '2027-10-04', 3),
('Ronald Lewis', 'ronald.lewis@example.com', 59000.00, '2027-11-11', 1),
('Dorothy Harris', 'dorothy.harris@example.com', 64000.00, '2027-12-18', 2);


--## filter one or more specific field from a table
select empID, empName from Employees


--## data shorting using multiple condition
select * from Employees
WHERE empName <> 'Gary Lee' AND salary>74000 or empName='Sandra Lee'


--## data shorting by asc or desc order
select * from Employees
ORDER BY salary DESC;

select * from Employees
ORDER BY empName DESC LIMIT 10 OFFSET 0

--Sorting highest or lowest salary payer employee
select * from Employees where salary=(select MIN(salary) from Employees)

SELECT * FROM (
  SELECT emp_name, emp_salary, DENSE_RANK() OVER (ORDER BY emp_salary DESC) AS r
  FROM emp
) AS subquery
WHERE r = 3;

select distinct(salary) as salary from Employees order by salary desc offset 2 limit 1

select distinct(salary) as salary from Employees order by salary desc offset 2 limit 1

--## IN, NOT IN, BETWEEN, LIKE query TYPE
select * from Employees where empId in (53,80,127)

select * from Employees where empId NOT in (53,80,127)


select * from Employees where salary BETWEEN 52000 AND 60000


select * from Employees where empName like 'B%'--here "b%" find the name starts with b.

select * from Employees where empName like '%e'  -- here "e%" find the name ends with e.

select * from Employees where empName like '%ame%'  -- here "%am%" find the name includes "am" in the middle of a name.

select * from Employees where empName like '_ame%'  -- here "_ame%" find the name includes "ame" after 1 character of a name.

select * from Employees where empName like '__i_________';  -- here "__i_______%" find the name includes "a" after 2 character and 7 character after i of a name.

