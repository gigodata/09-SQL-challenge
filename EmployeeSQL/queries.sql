# List the employee number, last name, first name, sex, and salary of each employee.

select a.emp_no
, a.last_name
, a.first_name
, a.sex
, b.salary
from employees a
, salaries b
where a.emp_no = b.emp_no
;

#############################################

# List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name
, last_name
, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
;

#############################################

# List the manager of each department along with their department number, department name, employee number, last name, and first name.

select a.dept_no
, b.dept_name
, a.emp_no
, c.last_name mgr_last_name
, c.first_name mgr_first_name
from dept_manager a
, departments b
, employees c
where a.dept_no = b.dept_no
and a.emp_no = c.emp_no
order by 1
, 4
, 5
;

#############################################

# List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
# NB: 'birth_date' was added to 'select' statement to differentiate between people with the same first & last names.
# 'birth_date' is a more definitive way of differentiation than emp_no. 
# Looking solely at 'emp_no' to does not clearly indicate that records are not duplicated.

select b.dept_no
, a.emp_no
, a.last_name
, a.first_name
, a.birth_date
, c.dept_name
from employees a
, dept_emp b
, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
order by 1
, 3
, 4
;

#############################################

# List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name
, last_name
, sex
from employees
where upper(first_name) = 'HERCULES'
and upper(last_name) like 'B%'
order by 2
;

#############################################

# List each employee in the Sales department, including their employee number, last name, and first name.

select a.emp_no
, a.last_name
, a.first_name
, c.dept_name
from employees a
, dept_emp b
, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
and c.dept_name = 'Sales'
order by 2
, 3
;

#############################################

# List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
# NB: 'birth_date' was added to 'select' statement to differentiate between people with the same first & last names.
# 'birth_date' is a more definitive way of differentiation than emp_no. 
# Looking solely at 'emp_no' does not clearly indicate that records are not duplicated.

select a.emp_no
, a.last_name
, a.first_name
, a.birth_date
, c.dept_name
from employees a
, dept_emp b
, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
and (c.dept_name = 'Sales' or c.dept_name = 'Marketing')
order by 5
, 2
, 3
;

#############################################

# List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name
, count(last_name) nbr_employees
from employees
group by last_name
order by 2 desc
, 1
;

##########    END SCRIPT   ##################
