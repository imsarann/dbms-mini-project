create view Employee_view as
Select e.emp_id,e.first_name,e.emp_type,em.branch_id,acc.account_no,c.cust_id
from customer as c,account_branch as acc,emp_branch as em, employee as e
where e.emp_id=em.emp_id and em.branch_id=acc.branch_id and acc.account_no=c.account_no;

create view customer_view as
Select c.cust_id,c.first_name,c.account_no,acc.branch_id,br.bank_ssn,b.bank_name
from customer as c,account_branch as acc,branches as br,bank as b
where c.account_no=acc.account_no and acc.branch_id=br.branch_id and br.bank_ssn=b.bank_ssn;


CREATE VIEW Bank_view as 
SELECT b.bank_name,b.bank_ssn,br.branch_id,emp.emp_id,e.first_name,emp.date_of_joining
from employee as e,branches as br,bank as b,emp_branch as emp
where b.bank_ssn=br.bank_ssn and br.branch_id=emp.branch_id and emp.emp_id=e.emp_id;
SELECT * FROM Bank_view;
drop view Bank_view;