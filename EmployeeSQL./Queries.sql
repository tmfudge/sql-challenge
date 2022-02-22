/*
1. List the following details of each employee: 
employee number, last name, first name, gender, and salary.
*/

SELECT e.emp_no,
	   e.last_name,
	   e.first_name,
	   de.from_date,
	   de.to_date
FROM employees AS e
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no;
  
/*
2. List employees who were hired in 1986.
*/
  
SELECT emp_no,
	   first_name,
	   last_name,
	   hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/*
3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, 
first name, and start and end employment dates.
*/

SELECT dm.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name,
	   dm.from_date,
	   dm.to_date
FROM dept_manager AS dm
Join departments AS d
  ON dm.dept_no = d.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no;
  
/*
4. List the department of each employee with the following information: 
employee number, last name, first name, and department name.
*/

SELECT de.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM dept_emp AS de
JOIN employees AS e
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
ORDER BY 1;

/*
5. List all employees whose first name is "Hercules" and last names begin 
with "B."
*/

SELECT emp_no,
	   first_name,
	   last_name
FROM employees
WHERE first_name = 'Hercules'
  AND last_name Like 'B%';

/*
6. List all employees in the Sales department, including their employee 
number, last name, first name, and department name.
*/

SELECT de.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM dept_emp AS de
JOIN employees AS e
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY 1;

/*
7. List all employees in the Sales and Development departments, including 
their employee number, last name, first name, and department name.
*/

SELECT de.emp_no,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM dept_emp AS de
JOIN employees AS e
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
   OR d.dept_name = 'Development'
ORDER BY 1;

/*
8. In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.
*/

SELECT last_name,
	   COUNT(last_name) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;