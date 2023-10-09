
--TABLE SCHEMATA

-- Create the table: Titles
CREATE TABLE Titles (
    title_id VARCHAR PRIMARY KEY,
    title CHAR(100)
);
-- Check the columns in the tables
SELECT * FROM Titles;

-- Create the table: Employees, ensuring no null values is included by 'NOT NULL'
--Primary key(PK), and Foreign key(FK) are defined. REFERENCES specifies the where FK came from
CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

-- Check the columns in the tables
SELECT * FROM Employees;

-- Create the table: Salaries,ensuring no null values is included by 'NOT NULL' 
--Primary key(PK), and Foreign key(FK) are defined. REFERENCES specifies the where FK came from
CREATE TABLE Salaries (
    emp_no INT NOT NULL,
    salary DECIMAL NOT NULL,
    PRIMARY KEY (emp_no)  ,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
-- Check the columns in the tables
SELECT * FROM Salaries;

-- Create the table: Departments,ensuring no null values is included by 'NOT NULL' 
--Primary key(PK) defines as dept_no, and letting dept_name free to change(not choosing as primary key)
-- Maximum value chosen(255), UNIQUE ensures the no same contain in different columns
CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255) UNIQUE
	
);
-- Check the columns in the tables
SELECT * FROM Departments;

-- Create the table: Department_Emp,ensuring no null values is included by 'NOT NULL' 
--Primary key(PK), and Foreign key(FK) are defined. REFERENCES specifies the where FK came from

CREATE TABLE Department_Emp
	emp_no INT NOT NULL,
	dept_no VARCHAR,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Check the columns in the tables
SELECT * FROM Department_Employee;

-- Create the table: Department Manager,ensuring no null values is included by 'NOT NULL' 
--Primary key(PK), and Foreign key(FK) are defined. REFERENCES specifies the where FK came from, 
-- composite primary key defines by including two columns as in Department_Manager both columns
-- are part of primary key
CREATE TABLE Department_Manager (
    dept_no VARCHAR,
	emp_no INT NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);


-- Check the columns in the tables
SELECT * FROM Department_Manager;


