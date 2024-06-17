use OnlineBankingSystem;

select d.debit_number, d.debit_expirydate, c.cust_id, c.email, c.account_no
from customer c, debit_card d
where c.account_no = d.account_no;

SELECT *
FROM customer
WHERE cust_id BETWEEN 3 AND 9;

SELECT * FROM employee
LIMIT 6;

select *
from employee e
where e.first_name like 'a%';

SELECT * FROM customer WHERE customer.cust_address_city IN ('Delhi', 'Chandigarh', 'Lahore')
union all
SELECT * FROM customer WHERE customer.cust_address_city IN ('Imphal', 'Daman', 'Aizwal');

SELECT emp_branch.date_of_joining, employee.first_name, branch.branch_email
from ((emp_branch
inner join employee on emp_branch.emp_id = employee.emp_id)
inner join branch on branch.branch_id = emp_branch.branch_id);

SELECT COUNT(cust_id), customer.cust_address_city
FROM customer
GROUP BY customer.cust_address_city
HAVING COUNT(cust_id) > 1;

SELECT customer.first_name, loans.loan_id
FROM customer, loans
where loans.account_no = customer.account_no
ORDER BY customer.first_name;

CREATE VIEW vname as 
SELECT payment.payment_id, payment.payment_duedate, credit_card.cc_number, credit_card.cc_expirydate
FROM payment, credit_card
WHERE payment.account_no = credit_card.account_no;
SELECT * FROM vname;
drop view vname;

SELECT customer.first_name, customer.last_name
FROM customer
WHERE EXISTS (SELECT account_branch.date_of_opening from account_branch where account_branch.account_no = customer.account_no and customer.account_no > 600000 );

SELECT credit_card.cc_number, debit_card.debit_number, customer.cust_id
FROM credit_card, debit_card, customer
WHERE customer.account_no = debit_card.account_no and debit_card.account_no = credit_card.account_no;

SELECT insurance.Insurance_no, insurance.issuing_company, insurance.type , request.loan_id
from insurance, request
where insurance.cust_id = request.cust_id;