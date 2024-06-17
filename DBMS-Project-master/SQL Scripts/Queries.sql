# Limit can be used in each of the queries. 

# Q1
SELECT  EXTRACT(YEAR FROM dob) AS year,
        EXTRACT(QUARTER FROM dob) AS quarter,
        COUNT(cust_id) AS number_of_customers
FROM Customer
GROUP BY EXTRACT(YEAR FROM dob), EXTRACT(QUARTER FROM dob)
ORDER BY EXTRACT(YEAR FROM dob) ASC, EXTRACT(QUARTER FROM dob);


#2

SELECT customer.first_name, customer.last_name
FROM customer
WHERE EXISTS (SELECT account_branch.date_of_opening from account_branch where account_branch.account_no = customer.account_no and customer.account_no > 600000 );


#3

SELECT emp_id, first_name, last_name
       , salary
FROM Employee
WHERE first_name in (SELECT DISTINCT first_name 
               FROM Employee 
               WHERE emp_dob >  1995-01-01
                     AND emp_address_city = "Delhi" OR emp_address_city = "Agartala" OR emp_address_city="Ranchi")
      AND salary >= (SELECT AVG(salary)
                     FROM Employee
                     WHERE mgr_ID >10)
Limit 100;

#4

SELECT COUNT(cust_id), customer.cust_address_city
FROM customer
GROUP BY customer.cust_address_city
HAVING COUNT(cust_id) > 1;



#5
DROP VIEW IF EXISTS loans10;
CREATE VIEW loans10 AS
SELECT Customer.cust_id, customer.first_name, Customer.account_no, loans.amount as Loan_Amount
FROM (loans  
	INNER JOIN customer ON loans.account_no=customer.account_no
    )
WHERE loans.amount  > 10000 ;


#6

SELECT cust_address_city, COUNT(*) AS number_customers 
FROM Customer 
WHERE cust_address_city LIKE 'H%'
GROUP BY cust_address_city
HAVING count(*) >= 2;

#7

SELECT emp_branch.date_of_joining, employee.first_name, branch.branch_email
from ((emp_branch
inner join employee on emp_branch.emp_id = employee.emp_id)
inner join branch on branch.branch_id = emp_branch.branch_id);

#8

SELECT first_name, last_name, cust_id AS 'Cust_id'
FROM Customer c
LEFT JOIN credit_card o
ON c.account_no = o.account_no
WHERE o.account_no IS NULL;

#9

Select temp.*
FROM Employee e
join (select emp_id, first_name,emp_type,salary,
	min(salary) over (partition by emp_type) as SALARY_MIN,
	max(salary) over (partition by emp_type) as SALARY_MAX
	from employee) temp
on e.emp_id = temp.emp_id
and (e.salary = temp.SALARY_MIN or e.salary = temp.SALARY_MAX)
order by temp.emp_type, temp.salary;

#10

# Second Highest salary for employees.
Select Distinct(t1.salary), t1.emp_id, t1.first_name from Employee t1 
Where 3 = 
(
Select count(Distinct (t2.salary)) FROM Employee t2 
Where t1.salary < t2.salary
);
# General:


Select Distinct(t1.salary) from Employee t1 
Where M-1 = 
(
Select count(Distinct (t2.salary)) FROM Employee t2 
Where t1.salary < t2.salary
)


