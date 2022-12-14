-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY Key (dept_no),
	UNIQUE (dept_name));
	
--Creating table for Employees
CREATE TABLE employees (
	emp_no     INT NOT NULL,
	birth_date Date NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name  VARCHAR NOT NULL,
	gender     VARCHAR NOT NULL,
	hire_date  Date NOT NULL,
	PRIMARY KEY (emp_no));
	
	
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date Date not NULL,
	to_date Date,
	Primary key (emp_no,salary),
	FOREIGN key (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title  VARCHAR(40) NOT NULL,
	from_date Date not NULL,
	to_date date,
	Primary key (title,emp_no,from_date),
	FOREIGN key (emp_no) REFERENCES employees (emp_no)
);


