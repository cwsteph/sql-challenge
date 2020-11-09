-- Create Tables
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR);
	
CREATE TABLE dept_emp (
	emp_no VARCHAR,
	dept_no VARCHAR);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no VARCHAR);	
	
DROP TABLE employeers
	
CREATE TABLE employeers (
	emp_no VARCHAR,
	emp_title VARCHAR,
	birth_date DATE, 
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE);
	
CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER);	
	
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR);	
	
	;		

-- SELECT STATEMENT
SELECT * FROM departments

-- Copy File Information into Database

SELECT * FROM dept_emp

-- DATA ANALYSIS
--1.
SELECT e.emp_no, last_name, first_name, sex, salary FROM employeers e
JOIN salaries s
ON e.emp_no = s.emp_no

-- 2.
SELECT first_name, last_name, hire_date FROM employeers
WHERE hire_date between '01/01/1986' AND '12/31/1986'


--3.
SELECT dm.dept_no, dept_name, e.emp_no, first_name, last_name FROM dept_manager dm
JOIN departments d
ON dm.dept_no = d.dept_no
JOIN employeers e
ON e.emp_no = dm.emp_no

-- 4.
SELECT e.emp_no, e.first_name, e.last_name, d. dept_name FROM employeers e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no

-- 5.
SELECT first_name, last_name, sex FROM employeers
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6.
SELECT e.emp_no, e.first_name, e.last_name, d. dept_name FROM employeers e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'

-- 7.
SELECT e.emp_no, e.first_name, e.last_name, d. dept_name FROM employeers e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--8. 
SELECT last_name, COUNT(last_name) FROM employeers
GROUP BY last_name
ORDER BY COUNT(last_name) DESC