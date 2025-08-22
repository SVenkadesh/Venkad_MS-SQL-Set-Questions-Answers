use set_1;


-- Question 1: Retrieve Employee Details
-- Retrieve all employees whose salary is greater than 60000.

-- Answer
	Select * from employees
    where salary > 60000;

-- Question 2: Find Total Sales Per Customer
-- Q Calculate the total sales amount for each customer from the sales table.

-- Answer
Select c.customer_name, s.amount from customers c inner join sales s
on c.customer_id=s.customer_id;

-- Question 3: Employee Salary in Finance Department
-- Q Retrieve the names and salaries of all employees working in the 'Finance' department.

-- Answer
select d.department_name, e.salary from departments d inner join employees e
on e.department_id = d.department_id
where d.department_name = 'Finance';

-- Question 4: Total Sales on a Specific Date
-- Q Find the total sales amount made on '2023-03-17'.

-- Answer
select * from sales where sale_date = '2023-03-17';

-- Question 5: High-Value Orders
-- Q Get the names of customers who have placed an order of more than 600.

-- Answer 
select customer_name from orders
where order_amount > 600;