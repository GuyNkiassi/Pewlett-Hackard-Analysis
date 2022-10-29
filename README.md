# Pewlett-Hackard-Analysis


Overview of Project

The report is to summarize and to perform analysis to help prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

Deliverable 1: The Number of Retiring Employees by Title
Deliverable 2: The Employees Eligible for the Mentorship Program
Deliverable 3: A written report on the employee database analysis README.md.

Resources and Before Start Notes:
Data Source: Employee_Database_challenge.sql
Data Tools: PostgreSQL, pgAdmin


Database Keys

Database keys identify records from tables and establish relationships between tables. There are numerous types of keys. For our purposes, we will focus on primary keys and foreign keys.

Primary Key
The departments.csv file has a dept_no column with unique identifiers for each row (one department number per department). For example, d001 will always reference the Marketing department, across other worksheets. This unique identifier is known as a primary key.

Primary keys are an important part of database design. When a database is being created, each table added must include a primary key in the architecture. Primary keys serve as a link between these tables.


Foreign Keys

Foreign keys are just as important as primary keys. While primary keys contain unique identifiers for their dataset, a foreign key references another dataset's primary key.



Table Structure

When working in Excel and Visual Basic for Applications (VBA), we're working directly with worksheets with data. In SQL, the same worksheets we have been exploring are organized into tables instead. They are similar to DataFrames in that they have headers and indexes, with data in columns and rows. 

Entity Relationship Diagrams (ERDs)

An entity relationship diagram (ERD) is a type of flowchart that highlights different tables and their relationships to each other. The ERD does not include any actual data, but it does capture the following pertinent information from each CSV file:

Primary keys
Foreign keys
Data types for each column
The ERD also shows the flow of information from one table to another

When creating a diagram, we need to fully understand all of the data being inserted. Database components include tables, known as entities, with data, known as attributes.


Data types include Booleans, integers, and varying characters (i.e., within a string).

There are three types of ERDs: conceptual, logical, and physical. Each one builds upon the other—you need the conceptual ERD to build a logical ERD to build a physical ERD. We'll learn how to create ERDs later in this module.


It's simple because we're creating just the concept of the diagram. By covering only the basics, it's easier to capture the main points. If we tried to capture everything at once (data types, location of the primary and foreign keys, etc.), we're more likely to overlook a crucial item.



Deliverable 1: The Number of Retiring Employees by Titles

Code 

-- Follow the instructions below to complete Deliverable 1.
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;
name-of-you-image

The Retirement Titles table is exported as retirement_titles.csv
Exported retirement_titles.csv Image below.


Code 

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;
name-of-you-image

The Unique Titles table is exported as unique_titles.csv
Exported unique_titles.csv Image below.

Code 

A query is written and executed to create a Retiring Titles.

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;
name-of-you-image

The Retiring Titles table is exported as retiring_titles.csv
Exported retiring_titles.csv Image below.

Code and Image

name-of-you-image

Deliverable 2: The Employees Eligible for the Mentorship Program

A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
Code

-- Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_emp as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
name-of-you-image

Code 

Deliverable 3: A written report on the employee database analysis

Results

Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed:

From the finding of the eligible retirees, High Percentage of the workforce could retire at any given time.
From the job titles of the eligible retirees, the breakdown is below.
32,452 Staff
29,415 Senior Engineer
14,221 Engineer
8,047 Senior Staff
4,502 Technique Leader
1,761 Assistant Engineer

Summary

Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami.":

1) How many roles will need to be filled as the "silver tsunami" begins to make an impact?.

90,398 roles are in urgent need to be filled out as soon as the workforce starts retiring at any given time.

2) Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

No, we have 1,940 employees who are eligible to participate in a mentorship program

Pewlett Hackard Analysis Completed 