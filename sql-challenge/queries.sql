



-- ANALYSIS (Numbers shown in the query is the same as the numbers in the assignment )
-- 1. 
-- select(SELECT) the requred columns from the tables, choosing Employees(FROM) as source table, INNERjoining
-- ON the condition, that is emp_no each table is the same. 
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

-- 2. 

-- select(SELECT) the requred columns from the table FROM Employees. Then filtering EXTRACT from the requred YEAR(1986)
-- from hire_date
SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--3. 

-- SELECT the column from the table, keeping source table Departments. INNER JOIN ON two conditions as specified.

SELECT
    Departments.dept_no,
    Departments.dept_name,
    Employees.emp_no,
    Employees.last_name,
    Employees.first_name
FROM
    Departments
INNER JOIN
    Department_Manager ON Departments.dept_no = Department_Manager.dept_no
INNER JOIN
    Employees ON Department_Manager.emp_no = Employees.emp_no;

--4.
-- SELECT the column from the table, keeping source table Employees. INNER JOIN ON two conditions as specified.
SELECT
    Employees.emp_no,
    Employees.last_name,
    Employees.first_name,
    Departments.dept_no,
    Departments.dept_name
FROM
    Employees
INNER JOIN
    Department_Employee ON Employees.emp_no = Department_Employee.emp_no
INNER JOIN
    Departments ON Department_Employee.dept_no = Departments.dept_no;

--5.
-- SELECT FROM Employees table the required columns filtering on two conditions (WHERE) as specified 
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.
--SELECT the ccolumns FROM the source table Employees, INNER JOIN ON the two conditions then filter (WHERE) as specified
SELECT Employees.emp_no, Employees.last_name, Employees.first_name
FROM Employees
INNER JOIN Department_Employee ON Employees.emp_no = Department_Employee.emp_no
INNER JOIN Departments ON Department_Employee.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales';

--7.
--SELECT the columns FROM the source table Employees, INNER JOIN ON the two condtiopns, filtering (WHERE) on dept_name
--matching IN either of the departments as specified.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Department_Employee ON Employees.emp_no = Department_Employee.emp_no
INNER JOIN Departments ON Department_Employee.dept_no = Departments.dept_no
WHERE Departments.dept_name IN ('Sales', 'Development');


--8.
-- SELECT the last_name column FROM the table Employees COUNT the unique last name occurances, the result of each 
-- different last count to a single row (ORDER BY) and show the result in descending order (DESC)
SELECT last_name, COUNT(*)
FROM Employees
GROUP BY last_name
ORDER BY COUNT(*) DESC, last_name;






	


