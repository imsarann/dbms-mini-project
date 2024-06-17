delimiter $$
CREATE TRIGGER  cc_pos  
BEFORE INSERT ON credit_card 
FOR EACH ROW
BEGIN
IF new.cc_limit <= 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'cc limit should always > 0';
END IF;
END;;
$$ 

INSERT INTO `credit_card` (`cc_limit`,`cc_number`,`cc_cvv`,`cc_expirydate`,`account_no`) VALUES   (-1,12247594,901,"2023-12-06",87334373)	;