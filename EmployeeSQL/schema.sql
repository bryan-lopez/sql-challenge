/* This schema file creates the tables for:
  - Department
  - Department Employees and Manager
  - All Employees including Salaries and Job Titles

@TODO: Drop, if Exists
@TODO: Create Tables
*/

if exists drop table departments end if;
if exists drop table employees end if;
if exists drop table dept_emply end if;
if exists drop table dept_man end if;
if exists drop table salaries end if;
if exists drop table titles end if;



-- Departments Table
create table departments (
  dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(25)
);

-- Department Employees Table
create table dept_emply (
  emp_no INTEGER,
  dept_no VARCHAR(5),
  from_date VARCHAR(10),
  to_date VARCHAR(10),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Department Manager Table
create table dept_man (
  dept_no VARCHAR(5),
  emp_no INTEGER,
  from_date VARCHAR(10),
  to_date VARCHAR(10),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Employees Table
create table employees (
  emp_no INTEGER PRIMARY KEY,
  birthdate VARCHAR(10),
  first_name VARCHAR,
  last_name VARCHAR,
  gender VARCHAR(1),
  hire_date VARCHAR(10)
);

-- Salaries Table
create table salaries (
  emp_no INTEGER,
  salary INTEGER,
  from_date VARCHAR(10),
  to_date VARCHAR(10),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Titles Table
create table titles (
  emp_no INTEGER,
  title VARCHAR,
  from_date VARCHAR(10),
  to_date VARCHAR(10),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
