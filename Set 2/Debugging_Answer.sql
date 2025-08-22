
-- 1. Retrieve Employees in Finance Department
-- Incorrect Code
SELECT name, salary 
FROM employees
WHERE department_id = 'Finance';

-- Answer: Department_id has number only
SELECT name, salary 
FROM employees
WHERE department_id = '101';

-- 2. Calculate Total Sales for Each Customer
-- Incorrect Code
SELECT customer_name, SUM(amount) AS total_sales
FROM sales
GROUP BY customer_name;

-- Answer: Sales table have customer_id not customer_name
SELECT customer_id, SUM(amount) AS total_sales
FROM sales
GROUP BY customer_id;
 
-- 3. Find Products Priced Over the Average Price
-- Incorrect Code
SELECT product_name, price
FROM products
WHERE price > AVG(price);

-- Answer: Should use subquery for this statement
SELECT product_name, price
FROM products
WHERE price > (select AVG(price) from products);

-- 4. Get Customers Who Have Placed Orders Over 1000
-- Incorrect Code
SELECT DISTINCT customer_name
FROM orders
WHERE order_amount = 1000;

-- Answer: Logical operator needed to be change from = to >
SELECT DISTINCT customer_name
FROM orders
WHERE order_amount > 1000;

-- 5. Find Total Sales for Each Customer
-- Incorrect Code
SELECT customer_id, SUM(amount) 
FROM sales;

-- Answer: should use Group by when using aggregation columns
SELECT customer_id, SUM(amount) 
FROM sales
GROUP BY customer_id;