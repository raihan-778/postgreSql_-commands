-- Active: 1694014328483@@127.0.0.1@5432@university_management@public
 create table Courses(
      courseId serial PRIMARY KEY,
      course_name VARCHAR(50) NOT NULL,
      description VARCHAR(255),
      published_date DATE
    );-- Active: 1693892583935@@127.0.0.1@5432@test_01
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

    SELECT * FROM Courses;
    insert into Courses(course_name, description, published_date) VALUES
    ('PostgreSQL', 'PostgreSQL for beginers', '2020-03-25'),
        ('PostgreSQL Advanced Topic', 'PostgreSQL with in dapth', '2020-05-20'),
        ('Postgre High performance', NULL, NULL),
        ('Mastering PostgreSql', 'Mastering PostgreSql in 2 month', '2012-03-15' );

select * from Courses;
--#update database table row
-- update table_name
-- set 
-- column1=value,
-- column1=value
-- WHERE condition
update courses
set 
course_name='PostgreSQL for developer',
description='PostgreSQL in 21 days'

where courseId=1

select * from Courses;

create TABLE if NOT exists Departments(
deptID SERIAL PRIMARY KEY,
deptName TEXT NOT NULL
);


CREATE TABLE if NOT exists Employees(
  empId SERIAL PRIMARY KEY,
  empName TEXT NOT NULL,
  email TEXT NOT NULL,
  salary INTEGER NOT NULL,
  joining_date DATE NOT NULL,
  deptID INTEGER NOT NULL,
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
('Dorothy Harris', 'dorothy.harris@example.com', 64000.00, '2027-12-18', 2),
('Kenneth Martinez', 'kenneth.martinez@example.com', 68000.00, '2028-01-25', 4),
('Shirley Adams', 'shirley.adams@example.com', 55000.00, '2028-02-01', 1),
('Betty Allen', 'betty.allen@example.com', 74000.00, '2028-03-08', 4),
('Edward White', 'edward.white@example.com', 63000.00, '2028-04-15', 3),
('Deborah Davis', 'deborah.davis@example.com', 70000.00, '2028-05-22', 2),
('Paul Garcia', 'paul.garcia@example.com', 61000.00, '2028-06-29', 4),
('Carol Clark', 'carol.clark@example.com', 75000.00, '2028-07-06', 3),
('Margaret Turner', 'margaret.turner@example.com', 57000.00, '2028-08-13', 2),
('Donald Smith', 'donald.smith@example.com', 69000.00, '2028-09-20', 1),
('Joseph Lee', 'joseph.lee@example.com', 72000.00, '2028-10-27', 4),
('Susan Taylor', 'susan.taylor@example.com', 56000.00, '2028-11-03', 3),
('Richard Anderson', 'richard.anderson@example.com', 68000.00, '2028-12-10', 1),
('Nancy Jackson', 'nancy.jackson@example.com', 63000.00, '2029-01-17', 4),
('Karen Lewis', 'karen.lewis@example.com', 71000.00, '2029-02-24', 2),
('Frank Brown', 'frank.brown@example.com', 59000.00, '2029-03-03', 1),
('Lisa Hall', 'lisa.hall@example.com', 60000.00, '2029-04-10', 3),
('Mark Davis', 'mark.davis@example.com', 73000.00, '2029-05-17', 4),
('Linda Thomas', 'linda.thomas@example.com', 55000.00, '2029-06-24', 1),
('David Allen', 'david.allen@example.com', 72000.00, '2029-07-01', 3),
('Mary Wilson', 'mary.wilson@example.com', 66000.00, '2029-08-08', 2),
('James Clark', 'james.clark@example.com', 69000.00, '2029-09-15', 1),
('Helen Scott', 'helen.scott@example.com', 64000.00, '2029-10-22', 4),
('George Martin', 'george.martin@example.com', 71000.00, '2029-11-29', 2),
('Carol Garcia', 'carol.garcia@example.com', 61000.00, '2029-12-06', 3),
('Daniel Turner', 'daniel.turner@example.com', 73000.00, '2030-01-13', 4),
('Jennifer Young', 'jennifer.young@example.com', 57000.00, '2030-02-20', 2),
('Christopher Davis', 'christopher.davis@example.com', 65000.00, '2030-03-27', 1),
('Karen Allen', 'karen.allen@example.com', 74000.00, '2030-04-03', 4),
('Gary Adams', 'gary.adams@example.com', 67000.00, '2030-05-10', 3),
('Donna Harris', 'donna.harris@example.com', 60000.00, '2030-06-17', 1),
('Matthew Jackson', 'matthew.jackson@example.com', 72000.00, '2030-07-24', 2),
('Elizabeth White', 'elizabeth.white@example.com', 59000.00, '2030-08-31', 4),
('Brian Martin', 'brian.martin@example.com', 68000.00, '2030-09-07', 3),
('Susan Rodriguez', 'susan.rodriguez@example.com', 66000.00, '2030-10-14', 1),
('Paul Wilson', 'paul.wilson@example.com', 70000.00, '2030-11-21', 2),
('Nancy Turner', 'nancy.turner@example.com', 61000.00, '2030-12-28', 3)
;


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
select * from Employees where empName like 'M%n';  -- here "M%n" find the name includes "M" as first CHARACTER & "n" as last in  a name.other CHARACTER between M & n is UNKNOWN.

--## concept of joining of one table with another table using REFERENCES key.

create TABLE if NOT exists Department(
  department_id INTEGER PRIMARY KEY,
  department_name VARCHAR(100)
);

INSERT INTO Department(department_id, department_name)
values
(1, 'Executive'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Development'),
(5, 'Support'),
(6, 'Research');

select * from Department

CREATE TABLE if NOT exists Employee(
  empId SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  department_id INT,
  job_role VARCHAR(100),
  manager_id INT,
  FOREIGN KEY(department_id)
    REFERENCES Department(department_id)
);
INSERT INTO Employee(empId, full_name, department_id, job_role, manager_id)
VALUES
  (DEFAULT, 'John Doe', 1, 'Front-end Development', 2),
  (DEFAULT, 'Jane Smith', 3, 'Back-end Development', 4),
  (DEFAULT, 'Michael Johnson', 2, 'Sales Person', 5),
  (DEFAULT, 'Emily Williams', 6, 'Support', 7),
  (DEFAULT, 'Robert Brown', 4, 'Front-end Development', 8),
  (DEFAULT, 'Linda Jones', 1, 'Back-end Development', 9),
  (DEFAULT, 'William Davis', 5, 'Sales Person', 10),
  (DEFAULT, 'Sarah Lee', 2, 'Support', 11),
  (DEFAULT, 'James Anderson', 3, 'Front-end Development', 12),
  (DEFAULT, 'Susan Clark', 6, 'Back-end Development', 13),
  (DEFAULT, 'Richard Wilson', 1, 'Sales Person', 14),
  (DEFAULT, 'Patricia Taylor', 4, 'Support', 15),
  (DEFAULT, 'David Moore', 3, 'Front-end Development', 16),
  (DEFAULT, 'Jennifer Hall', 5, 'Back-end Development', 17),
  (DEFAULT, 'Joseph Martin', 2, 'Sales Person', 18),
  (DEFAULT, 'Mary White', 6, 'Support', 19),
  (DEFAULT, 'Charles Young', 1, 'Front-end Development', 20),
  (DEFAULT, 'Nancy Harris', 4, 'Back-end Development', 1),
  (DEFAULT, 'Thomas Allen', 5, 'Sales Person', 2),
  (DEFAULT, 'Karen Turner', 2, 'Support', 3);

select * from employee

select * from department

-- join 2 table using reference id
select * FROM employee
INNER JOIN department ON department.department_id=employee.department_id
--left join


select * FROM employee
LEFT JOIN department ON department.department_id=employee.department_id

--right join
select * FROM employee
RIGHT JOIN department ON department.department_id=employee.department_id

--full join
select * FROM employee
FULL JOIN department ON department.department_id=employee.department_id
--natural join

select * FROM employee
NATURAL JOIN department;

--cross join
select * FROM employee
CROSS JOIN department;