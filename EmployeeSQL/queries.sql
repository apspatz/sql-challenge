--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '1986%';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
select dept_no,
	(select dept_name from departments where departments.dept_no = dept_manager.dept_no),
	emp_no,
	(select first_name from employees where employees.emp_no = dept_manager.emp_no),
	(select last_name from employees where employees.emp_no = dept_manager.emp_no),
	from_date, to_date
from dept_manager;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp_no,
	(select first_name from employees where employees.emp_no = dept_emp.emp_no),
	(select last_name from employees where employees.emp_no = dept_emp.emp_no),
	(select dept_name from departments where departments.dept_no = dept_emp.dept_no)
from dept_emp
limit 50; --Slowed down computer, created limit to show completion of task.

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
create view depts as
select departments.dept_no, departments.dept_name, dept_emp.emp_no, dept_emp.from_date, dept_emp.to_date from departments
inner join dept_emp on
dept_emp.dept_no = departments.dept_no;

select emp_no,
	(select last_name from employees where employees.emp_no = depts.emp_no),
	(select first_name from employees where employees.emp_no = depts.emp_no),
	dept_name
from depts
where dept_name = 'Sales'
limit 20; --Slowed down computer, created limit to show completion of task.

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
select emp_no,
	(select last_name from employees where employees.emp_no = depts.emp_no),
	(select first_name from employees where employees.emp_no = depts.emp_no),
	dept_name
from depts
where dept_name = 'Sales' or dept_name = 'Development'
limit 20; --Slowed down computer, created limit to show completion of task.

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as total
from employees
group by last_name
order by total desc;



