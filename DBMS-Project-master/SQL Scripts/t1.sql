Create table customer_backup as select * from customer;
delimiter $$
CREATE TRIGGER Backup BEFORE DELETE ON customer 
FOR EACH ROW
BEGIN
INSERT INTO customer_backup
VALUES (OLD.cust_id, OLD.first_name, 
        OLD.last_name, OLD.phone_no, OLD.email, OLD.cust_address_state, OLD.cust_address_city, OLD.cust_address_pincode, OLD.pan_no, OLD.account_no);
END; 
$$


