Create Database SET_1;
USE SET_1;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary INT,
    department_id INT
);

INSERT INTO employees (employee_id, name, age, salary, department_id) VALUES
(1, 'John', 30, 60000, 101),
(2, 'Emily', 25, 48000, 102),
(3, 'Michael', 40, 75000, 103),
(4, 'Sara', 35, 56000, 101),
(5, 'David', 28, 49000, 102);

select * from employees;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 1000),
(2, 'Mobile', 500),
(3, 'Tablet', 300),
(4, 'Headphones', 100),
(5, 'Smartwatch', 200);

SELECT * FROM products;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

-- Insert Sample Data
INSERT INTO customers (customer_id, customer_name) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Alice Johnson'),
(104, NULL),
(105, 'Robert Brown');

SELECT * FROM customers;

-- Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    sale_date DATE
);

-- Insert sample data
INSERT INTO sales (sale_id, customer_id, amount, sale_date) VALUES
(1, 101, 4500.00, '2023-03-15'),
(2, 102, 5500.00, '2023-03-16'),
(3, 103, 7000.00, '2023-03-17'),
(4, 104, 3000.00, '2023-03-18'),
(5, 105, 6000.00, '2023-03-19');

SELECT * FROM sales;


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing');

SELECT * FROM departments;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_amount INT
);

INSERT INTO orders (order_id, customer_name, order_date, order_amount) VALUES
(1, 'John', '2023-05-01', 500),
(2, 'Emily', '2023-05-02', 700),
(3, 'Michael', '2023-05-03', 1200),
(4, 'Sara', '2023-05-04', 450),
(5, 'David', '2023-05-05', 900);

SELECT * FROM orders;

--   Syntax Error Identification
SELECT name age FROM employees WHERE salary >= 50000;

-- Answer: Adding , missed between name & age
SELECT name, age FROM employees WHERE salary >= 50000;

--  Logical Error Detection
SELECT * FROM orders WHERE order_date = '2023-05-01' AND order_date = '2023-05-02';

-- Answer: Here the Order Date might be May 1 or May 2 so we can use OR else Between
SELECT * FROM orders WHERE order_date between '2023-05-01' AND '2023-05-02';
SELECT * FROM orders WHERE order_date = '2023-05-01' OR '2023-05-02';

-- Performance Optimization
SELECT * FROM sales WHERE amount > 5000;

-- Answer: Creating an Index to get fast Performance
CREATE INDEX salamount ON sales(amount);
SELECT * FROM sales WHERE amount > 5000;

-- Data Type Mismatch
SELECT * FROM products WHERE price = '100';

-- Incorrect Join Condition
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_name;

-- Answer
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

--  Incorrect NULL Handling
SELECT * FROM customers WHERE customer_name != NULL;

-- Answer: Using IS NOT NULL
SELECT * FROM customers WHERE customer_name IS NOT NULL;

-- Incorrect Use of Aggregate Functions
SELECT customer_id, SUM(amount)
FROM sales;

-- Answer: Must use Group By when doing Aggrigation
SELECT customer_id, SUM(amount)
FROM sales
GROUP BY customer_id;

-- Incorrect Column Selection
SELECT order_id, customer_address
FROM orders;

-- Answer: customer_address column is not available in DB, We should use existing columns only
SELECT order_id, customer_name
FROM orders;


