# Table schemata for SQL challenge of Pewlett Hackard


# NB: 'not null' constraints have not been added to fields in 'employees' table. The 'emp_no' is a PK and by definition is not null.
# If a 'not null' constraint is added for every field that is not a PK, it is too rigid for real world examples.
# In the 'employees' table, if all of the fields other than emp_no (PK) are 'not null' that means that no record can be added without knowing values for all fields at time of record creation.
# Without the 'not null' contraint, one can add a record for a new employee whose details may not know at the time of record creation.
# This allows flexibility to create an initial record, and later add other data elements as they become available.

# Individual comments for below tables are unnecessary, as they are explained here:
# Character lengths have been set according to length of data elements. There are 7 characters in 'emp_no', even though there are currently only 5 or 6 characters. 7 allows for room to grow, wothout needing to alter table.



create table titles (
title_id varchar(5) primary key
, title varchar(50) not null
);



create table departments (
dept_no varchar(4) primary key
, dept_name varchar(50) not null
);



create table employees (
emp_no varchar(7) primary key
, emp_title_id varchar(5)
, birth_date date
, first_name varchar(100)
, last_name varchar(100)
, sex char(1)
, hire_date date
, foreign key (emp_title_id) references titles (title_id)
);



create table dept_emp (
emp_no varchar(7)
, dept_no varchar(4)
, primary key (emp_no, dept_no)
, foreign key (emp_no) references employees (emp_no)
, foreign key (dept_no) references departments (dept_no)
);



create table salaries (
emp_no varchar(7) primary key
, salary float # The salary may be unkown at the time of record creation
, foreign key (emp_no) references employees (emp_no)
);



create table dept_manager (
dept_no varchar(4) not null
, emp_no varchar(7) primary key
, foreign key (dept_no) references departments (dept_no)
);

# END OF SCRIPT