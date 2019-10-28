-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary from
	employees e join salaries s on (e.emp_no = s.emp_no)
	order by e.emp_no;

-- 2. List employees who were hired in 1986.
create view converted_date as
	select emp_no, to_date(hire_date, 'YYYY-MM-DD') as d_date from employees;

select * from converted_date
	where extract(year from d_date) = 1986;

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
	from dept_man m
	join employees e on e.emp_no = m.emp_no
	join departments d on d.dept_no = m.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select demp.emp_no, e.last_name, e.first_name, d.dept_name
	from dept_emply demp
	join employees e on e.emp_no = demp.emp_no
	join departments d on d.dept_no = demp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from employees
	where first_name = 'Hercules'
		AND substring(last_name, 1,1) = 'B';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select demp.emp_no, e.last_name, e.first_name, d.dept_name
	from dept_emply demp
	join employees e on e.emp_no = demp.emp_no
	join departments d on d.dept_no = demp.dept_no
	where d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name,
-- first name, and department name.
select demp.emp_no, e.last_name, e.first_name, d.dept_name
	from dept_emply demp
	join employees e on e.emp_no = demp.emp_no
	join departments d on d.dept_no = demp.dept_no
	where d.dept_name = 'Sales'
		OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as frequency
	from employees
	group by last_name
	order by frequency desc;
