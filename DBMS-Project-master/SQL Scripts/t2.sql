DROP TRIGGER IF EXISTS check_emp_age;
delimiter $$
CREATE TRIGGER  check_emp_age  
BEFORE INSERT ON employee 
FOR EACH ROW
BEGIN
IF NEW.emp_dob > "2002-01-01" THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Age should be greater than 20 to apply';
END IF;
END;;
$$ 
# Check trigger 1
INSERT INTO `employee` VALUES (109239394,'Barclay','Mathis',156835,'IT','2003-04-18',9616311711,'228-281 Consequat Rd.','Ranchi',152565,1);







		
