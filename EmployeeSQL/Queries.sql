

-- SELECT * FROM Employees
-- SELECT * FROM DEPARTMENTS
-- SELECT * FROM DEPT_EMP
-- SELECT * FROM DEPT_MANAGER
-- SELECT * FROM SALARIES
-- SELECT * FROM TITLES

--QUESTION 1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM Employees e, Salaries s
WHERE e.emp_no = s.emp_no

--QUESTION 2
SELECT e.emp_no, e.last_name, e.first_name, e.sex, e.hire_date
FROM Employees e
WHERE e.hire_date >= '1986-01-01' AND e.hire_date <= '1986-12-31'

--QUESTION 3
SELECT d.dept_name, d.dept_no,e.emp_no, e.last_name, e.first_name
FROM Employees e, Departments d, Dept_manager dm
WHERE e.emp_no = dm.emp_no
	AND dm.dept_no = d.dept_no

--QUESTION 4
SELECT e.emp_no, d.dept_no, e.last_name, e.first_name, d.dept_name
FROM Employees e, Departments d, Dept_emp dm
WHERE e.emp_no = dm.emp_no
	AND d.dept_no = dm.dept_no
	
--QUESTION 5
SELECT e.first_name, e.last_name, e.sex
FROM Employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'

--QUESTION 6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees e, Dept_emp de, Departments d
WHERE e.emp_no = de.emp_no
	AND d.dept_no = de.dept_no
	AND d.dept_name = 'Sales'

--QUESTION 7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees e, Dept_emp de, Departments d
WHERE e.emp_no = de.emp_no
	AND d.dept_no = de.dept_no
	AND d.dept_name IN ('Sales','Development')
	
--QUESTION 8
Select e.last_name, Count(e.last_name) as cnt
FROM Employees e
GROUP By e.last_name
Order By cnt desc