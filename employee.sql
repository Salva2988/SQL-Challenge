DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

DROP TABLE IF EXISTS departments;
CREATE TABLE departments
(
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp
(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date VARCHAR(30) NOT NULL,
	to_date VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager
(
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries
(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

DROP TABLE IF EXISTS titles;
CREATE TABLE titles
(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);



SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;




SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries 
INNER JOIN employees ON
employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;


SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

SELECT last_name,
COUNT(last_name) AS "frequency count"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
