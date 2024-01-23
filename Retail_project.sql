#     Retail Data Analysis


#schema

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    department_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary_amount DECIMAL(10, 2),
    effective_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

SELECT * FROM Employees WHERE department_id = 1;

#highest-paid employee

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    Employees
ORDER BY
    salary DESC
LIMIT 1;


#average salary  department

SELECT
    department_id,
    department_name,
    AVG(salary) AS average_salary
FROM
    Departments
JOIN
    Employees ON Departments.department_id = Employees.department_id
GROUP BY
    department_id, department_name;
	
#salary increase

SELECT
    employee_id,
    first_name,
    last_name,
    salary_amount,
    effective_date
FROM
    Employees
JOIN
    Salaries ON Employees.employee_id = Salaries.employee_id
WHERE
    EXTRACT(MONTH FROM effective_date) = 6;  -- Assuming June

#number employees

SELECT
    department_id,
    department_name,
    COUNT(employee_id) AS employee_count
FROM
    Departments
LEFT JOIN
    Employees ON Departments.department_id = Employees.department_id
GROUP BY
    department_id, department_name;

#employees hired

SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    Employees
WHERE
    hire_date BETWEEN '2023-10-01' AND '2023-12-31';

