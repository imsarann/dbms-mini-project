CREATE DATABASE OnlineBankingSystem;
use OnlineBankingSystem;


DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `acc_no` int NOT NULL,
  `overdraft` varchar(20) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `account` WRITE;
INSERT INTO `account` VALUES (329668,'1',997757),(486558,'1',998189),(620886,'1',1000550),(647360,'1',999773),(674275,'1',999730),(765420,'1',999637),(767522,'1',997776),(777259,'1',999052),(873373,'1',999786),(883489,'1',999027);
UNLOCK TABLES;



DROP TABLE IF EXISTS `account_branch`;

CREATE TABLE `account_branch` (
  `branch_id` int NOT NULL,
  `account_no` int NOT NULL,
  `date_of_opening` date DEFAULT NULL,
  PRIMARY KEY (`branch_id`,`account_no`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `account_branch_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE,
  CONSTRAINT `account_branch_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `account_branch` WRITE;

INSERT INTO `account_branch` VALUES (1,767522,'2023-01-23'),(2,620886,'2021-01-04'),(3,329668,'2018-01-21'),(3,647360,'2021-03-11'),(4,486558,'2021-08-24'),(5,873373,'2019-12-15'),(6,777259,'2016-10-26'),(7,674275,'2018-10-17'),(8,883489,'2019-09-11'),(9,765420,'2019-05-13');

UNLOCK TABLES;


DROP TABLE IF EXISTS `account_type`;

CREATE TABLE `account_type` (
  `account_no` int NOT NULL,
  `deposit_ammount` int DEFAULT NULL,
  `transaction_limit` int DEFAULT NULL,
  `withdraw_limit` int DEFAULT NULL,
  `interest_rate` int DEFAULT NULL,
  PRIMARY KEY (`account_no`),
  CONSTRAINT `account_type_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `account_type` WRITE;

INSERT INTO `account_type` VALUES (329668,500,200000,200000,5),(486558,5000,200000,100000,5),(620886,1500,300000,100000,6),(647360,1500,123000,200000,8),(674275,990,500000,200000,6),(765420,2000,100000,100000,5),(767522,2500,200000,200000,7),(777259,1600,100000,300000,8),(873373,1000,200000,100000,5),(883489,800,500000,300000,7);

UNLOCK TABLES;



DROP TABLE IF EXISTS `assistance`;

CREATE TABLE `assistance` (
  `cust_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `date_of_assistance` date DEFAULT NULL,
  PRIMARY KEY (`cust_id`,`emp_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `assistance_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE,
  CONSTRAINT `assistance_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `assistance` WRITE;
INSERT INTO `assistance` VALUES (2,1002,'2017-05-06'),(2,1005,'2016-12-10'),(5,1000,'2019-11-03'),(5,1007,'2019-06-15'),(5,1008,'2019-08-12'),(6,1008,'2016-05-19'),(7,1004,'2019-04-03'),(8,1001,'2017-10-01'),(9,1005,'2021-01-24'),(10,1004,'2017-04-22');
UNLOCK TABLES;



DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `bank_ssn` int NOT NULL,
  `bank_name` varchar(20) DEFAULT NULL,
  `HO_email` varchar(250) DEFAULT NULL,
  `HO_address_state` varchar(50) DEFAULT NULL,
  `HO_address_city` varchar(50) DEFAULT NULL,
  `HO_address_pincode` int DEFAULT NULL,
  PRIMARY KEY (`bank_ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `bank` WRITE;
INSERT INTO `bank` VALUES (1000,'Levine Bank','penatibus.et@google.org','Rajasthan','Wals-Siezenheim',161143),(1001,'Bishop Bank','augue@protonmail.org','Chhattisgarh','Surat',162820),(1002,'Moon Bank','gravida@hotmail.com','Uttar Pradesh','Minitonas',132669),(1003,'Bond Bank','donec@yahoo.com','Sikkim','Unecha',821634),(1004,'Griffin Bank','nec@aol.edu','Punjab','Opole',265256);
UNLOCK TABLES;


DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL,
  `branch_email` varchar(250) DEFAULT NULL,
  `branch_address_state` varchar(50) DEFAULT NULL,
  `branch_address_city` varchar(50) DEFAULT NULL,
  `branch_address_pincode` int DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `branch` WRITE;
INSERT INTO `branch` VALUES (1,'natoque@hotmail.org','Rajasthan','Mosjøen',485953),(2,'sociis.natoque@hotmail.ca','Assam','Chitral',612397),(3,'dignissim.magna.a@hotmail.com','Meghalaya','Banda Aceh',713618),(4,'elit.etiam@aol.couk','Delhi','Zaria',258159),(5,'mauris@aol.org','Arunachal Pradesh','Gwangju',697866),(6,'a.scelerisque@outlook.com','Daman and Diu','Palmerston',819859),(7,'imperdiet@icloud.couk','Nagaland','Whitehorse',451685),(8,'volutpat@yahoo.org','Uttar Pradesh','Belfast',729939),(9,'aliquam.fringilla@hotmail.net','Daman and Diu','Palma de Mallorca',553708),(10,'suscipit.nonummy@aol.com','Rajasthan','Huesca',348635);
UNLOCK TABLES;


DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `date_of_opening` date DEFAULT NULL,
  `bank_ssn` int DEFAULT NULL,
  `branch_id` int NOT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `bank_ssn` (`bank_ssn`),
  CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`bank_ssn`) REFERENCES `bank` (`bank_ssn`) ON DELETE SET NULL,
  CONSTRAINT `branches_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `branches` WRITE;
INSERT INTO `branches` VALUES ('2020-10-28',1004,1),('2019-04-25',1009,2),('2018-10-29',1006,3),('2015-06-13',1000,4),('2018-10-07',1005,5),('2018-10-30',1005,6),('2018-10-08',1003,7),('2015-03-07',1003,8),('2015-08-01',1002,9),('2021-01-19',1003,10);
UNLOCK TABLES;


DROP TABLE IF EXISTS `credit_card`;
CREATE TABLE `credit_card` (
  `cc_limit` int DEFAULT NULL,
  `cc_number` int NOT NULL,
  `cc_cvv` int DEFAULT NULL,
  `cc_expirydate` date DEFAULT NULL,
  `account_no` int NOT NULL,
  PRIMARY KEY (`cc_number`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `credit_card_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `credit_card` WRITE;
INSERT INTO `credit_card` VALUES (54563,11655571,248,'2023-10-25',777259),(23670,12247594,901,'2023-12-06',873373),(62066,12546778,410,'2023-06-17',674275),(14134,12890436,213,'2023-10-13',883489),(34119,13221224,570,'2024-02-12',486558),(96119,13246683,308,'2023-10-23',329668),(10611,14286801,744,'2023-12-31',647360),(81671,14336466,127,'2023-04-16',767522),(82284,18548205,848,'2023-05-04',765420),(60265,18781485,829,'2023-08-28',620886);
UNLOCK TABLES;


DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cust_id` int NOT NULL,
  `dob` date DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone_no` bigint NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `cust_address_state` varchar(50) DEFAULT NULL,
  `cust_address_city` varchar(50) DEFAULT NULL,
  `cust_address_pincode` int DEFAULT NULL,
  `pan_no` bigint NOT NULL,
  `account_no` int NOT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `customer` WRITE;
INSERT INTO `customer` VALUES (1,'2020-07-05','Benedict','Harper',934652121,'ac.mattis@protonmail.net','736-8863 Mauris Avenue','Kavaratti',787644,161582657,873373),(2,'2008-02-09','Joshua','Boone',933750467,'vitae.sodales@yahoo.com','P.O. Box 382, 3355 Tempor Road','Aizwal',451352,667818422,486558),(3,'2009-08-31','Jesse','Harvey',921984594,'mauris.ut@protonmail.edu','P.O. Box 521, 1498 Lectus Rd.','Imphal',415676,504181748,329668),(4,'2014-01-06','Quail','Morris',936233275,'lectus.quis@outlook.org','P.O. Box 274, 699 Cum Street','Delhi',219127,353491334,674275),(5,'1998-12-29','Bryar','Schultz',973216943,'phasellus@google.ca','695-4527 Donec Av.','Silvassa',491024,660912167,883489),(6,'2006-11-19','Chase','Hart',973655286,'neque@outlook.org','1954 Non Rd.','Port Blair',967196,484372827,777259),(7,'2008-03-02','Keegan','Goff',979617912,'turpis.nulla@google.net','Ap #333-3233 Eget, Av.','Lahore',757655,338942066,765420),(8,'2007-12-29','Illiana','Hanson',977818456,'fermentum.risus@icloud.com','9139 Sed Avenue','Patan',214168,467327842,620886),(9,'2004-02-27','Baxter','Lawrence',987457745,'imperdiet@aol.org','514-6277 Dictum St.','Haldia',440898,933044774,767522),(10,'2004-06-10','Bert','Chang',968270946,'consectetuer@google.com','Ap #835-8207 Risus. Street','Daman',928004,569736306,647360),(11,'2011-08-10','Alvin','Burton',9014226243,'fringilla.mi@aol.ca','P.O. Box 971, 2372 Lorem Rd.','Haridwar',483662,534513947,3886),(12,'2001-08-22','Lucy','Shaffer',9454748028,'ante.dictum@outlook.edu','711-1950 Varius Av.','Ichalkaranji',543918,6815922224,982729),(13,'2013-09-09','Acton','Nelson',9045988371,'est.mollis@hotmail.com','928-3021 Pede St.','Gangtok',321074,5288028138,931476),(14,'2002-11-09','Hedy','Burns',9947347218,'aliquet.lobortis@google.net','Ap #256-273 Velit Rd.','Vishakhapatnam',468623,7828148212,107953),(15,'2014-03-30','Angela','Lamb',9206784875,'maecenas.mi@google.edu','Ap #745-4427 Morbi Ave','Bulandshahr',767788,2626184773,739637),(16,'2010-12-24','Xanthus','Pope',9559184177,'consequat.nec@yahoo.net','Ap #344-5672 Et Rd.','Alwar',994740,6133172468,543220),(17,'2001-12-06','Irma','Rodriquez',9412041249,'scelerisque@aol.edu','4218 Aliquam Rd.','Haridwar',234763,3591034507,540211),(18,'2016-10-31','Igor','Burch',9654695764,'a.odio.semper@aol.com','Ap #519-3470 Etiam Avenue','Daman',745850,8616123513,703863),(19,'2005-11-27','Lisandra','Holloway',9641617227,'inceptos.hymenaeos@outlook.ca','Ap #766-9451 Mauris, Ave','Chandigarh',658523,4629337573,850353),(20,'2022-08-30','Noelle','Quinn',9218862229,'nec.ante.blandit@yahoo.net','9728 Arcu. Street','Silvassa',573497,7225416241,346158);
UNLOCK TABLES;


DROP TABLE IF EXISTS `debit_card`;
CREATE TABLE `debit_card` (
  `debit_number` int NOT NULL,
  `cc_cvv` int DEFAULT NULL,
  `debit_expirydate` date DEFAULT NULL,
  `account_no` int NOT NULL,
  PRIMARY KEY (`debit_number`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `debit_card_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `debit_card` WRITE;
INSERT INTO `debit_card` VALUES (10836544,563,'2023-03-03',329668),(11841303,281,'2023-12-19',620886),(13222655,372,'2023-12-20',674275),(13519196,699,'2023-12-15',486558),(13927455,856,'2023-07-18',765420),(15596584,830,'2023-06-07',647360),(17400335,158,'2023-11-27',873373),(18634753,857,'2023-12-19',777259),(19537734,681,'2023-05-11',883489),(19848698,980,'2023-09-18',767522);
UNLOCK TABLES;


DROP TABLE IF EXISTS `emp_branch`;
CREATE TABLE `emp_branch` (
  `emp_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `date_of_joining` date DEFAULT NULL,
  KEY `emp_branch_ibfk_1` (`branch_id`),
  KEY `emp_branch_ibfk_2` (`emp_id`),
  CONSTRAINT `emp_branch_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE,
  CONSTRAINT `emp_branch_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `emp_branch` WRITE;
INSERT INTO `emp_branch` VALUES (1004,4,'2020-12-07'),(1006,7,'2022-01-02'),(1001,8,'2019-01-21'),(1002,6,'2022-05-26'),(1010,8,'2021-07-17'),(1003,3,'2018-10-28'),(1008,6,'2017-12-03'),(1007,5,'2020-07-21'),(1009,3,'2017-06-06'),(1005,4,'2019-02-08');
UNLOCK TABLES;

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `emp_type` varchar(20) DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `phone_no` bigint NOT NULL,
  `emp_address_state` varchar(50) DEFAULT NULL,
  `emp_address_city` varchar(50) DEFAULT NULL,
  `emp_address_pincode` int DEFAULT NULL,
  `mgr_ID` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `employee` WRITE;
INSERT INTO `employee` VALUES (1000,'Barclay','Mathis',156835,'IT','1996-04-18',9616311711,'228-281 Consequat Rd.','Ranchi',152565,1),(1001,'Ivy','Ray',178677,'Manager','1996-05-15',9236383056,'Ap #533-8199 Nulla Ave','Chandigarh',977347,2),(1002,'Vaughan','Nolan',184248,'IT','1996-05-05',9371846824,'Ap #542-9277 Velit Ave','Uluberia',568007,3),(1003,'Aaron','Merrill',116529,'Bank Clerk','1996-05-16',9813713324,'991-598 Consectetuer St.','Delhi',404413,4),(1004,'Rosalyn','Mccullough',171636,'IT','1996-04-08',9355802510,'Ap #210-3111 Orci, Street','Parbhani',831659,5),(1005,'Josiah','Cox',124604,'Bank Clerk','1996-04-02',9290618312,'Ap #578-1997 Non, Street','Panjim',107305,6),(1006,'Bevis','Duran',153371,'Bank Clerk','1996-05-11',9385333731,'Ap #628-3754 Lobortis Street','Imphal',533909,7),(1007,'Orson','Gray',183365,'Manager','1996-04-04',9925047135,'6958 Semper Ave','Shillong',648944,8),(1008,'Eugenia','Gilmore',170024,'Bank Clerk','1996-04-05',9793175784,'Ap #796-9671 Nunc, St.','Gangtok',468786,9),(1009,'Cadman','Byrd',195872,'IT','1996-04-15',9214412245,'P.O. Box 246, 4845 Eu, Rd.','Aizwal',264127,10),(1010,'Gemma','Oneal',138005,'Bank Clerk','1996-04-17',9357877485,'Ap #519-692 Integer Rd.','Bettiah',150978,11),(1011,'Kristen','Poole',102014,'IT','1996-04-27',9483353509,'Ap #757-6244 Dolor, St.','Nellore',470472,12),(1012,'Serena','Chang',162316,'Bank Clerk','1996-04-30',9306107365,'670-7164 Malesuada Avenue','Navsari',564079,13),(1013,'Hope','Patton',192403,'Manager','1996-04-09',9617844323,'Ap #274-7347 Eu Av.','Raichur',844373,14),(1014,'Karyn','Strong',101986,'IT','1996-04-13',9575136713,'5645 Nunc. Av.','Kohima',945679,15),(1015,'Maggy','Tyson',190832,'Bank Clerk','1996-05-08',9278472054,'1696 Placerat. Road','Haridwar',623053,16),(1016,'Drew','Hansen',172699,'Manager','1996-04-21',9435126622,'P.O. Box 745, 3327 Natoque Rd.','Agartala',145892,17),(1017,'Alyssa','Bowman',173755,'Manager','1996-04-02',9889471385,'325-3060 Nibh Av.','Daman',536731,18),(1018,'Gay','Alexander',191596,'Manager','1996-04-10',9947292027,'Ap #800-7793 Sed Road','Shillong',171035,19),(1019,'Sydnee','Mueller',158692,'Manager','1996-04-24',9143381347,'772-2145 Diam Av.','Port Blair',412551,20);
UNLOCK TABLES;


DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance` (
  `Insurance_no` int NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `date_of_insurance` date DEFAULT NULL,
  `term` int DEFAULT NULL,
  `premium_payment` varchar(50) DEFAULT NULL,
  `issuing_company` varchar(50) DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  PRIMARY KEY (`Insurance_no`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `insurance` WRITE;
INSERT INTO `insurance` VALUES (1,'Home Insurance','2019-01-23',7,'18500','Non Magna Consulting',1),(2,'Travel Insurance','2019-06-23',8,'28700','Non Magna Nam LLC',2),(3,'Home Insurance','2021-02-28',6,'93800','Dolor Vitae Inc.',3),(4,'Travel Insurance','2018-03-20',7,'64200','Eleifend Egestas Sed Incorporated',4),(5,'Home Insurance','2015-11-08',8,'65800','Magna Praesent PC',10),(6,'Travel Insurance','2016-09-14',8,'43100','Ac Turpis LLP',6),(7,'Home Insurance','2015-10-07',7,'84100','Turpis LLP',5),(8,'Motor Insurance','2021-01-09',7,'27500','Donec Est Corp.',9),(9,'Motor Insurance','2018-04-29',7,'63100','Consequat Purus Maecenas Corp.',8),(10,'Travel Insurance','2016-11-29',5,'30600','Consectetuer Rhoncus Nullam Ltd',7);
UNLOCK TABLES;


DROP TABLE IF EXISTS `loans`;
CREATE TABLE `loans` (
  `loan_id` int NOT NULL,
  `term` int DEFAULT NULL,
  `rate_of_interest` float DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `type_of_loan` varchar(20) DEFAULT NULL,
  `account_no` int DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`acc_no`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `loans` WRITE;
INSERT INTO `loans` VALUES (1,9,9,74920,'Home Loan',873373),(2,9,9,39497,'Business Loan',329668),(3,5,6,35193,'Personal Loan',647360),(4,5,10,84855,'Gold Loan',620886),(5,10,9,25024,'Business Loan',883489),(6,10,6,71005,'Gold Loan',674275),(7,8,7,73476,'Gold Loan',873373),(8,5,9,10855,'Home Loan',777259),(9,5,6,12932,'Home Loan',765420),(10,6,8,54723,'Gold Loan',647360);
UNLOCK TABLES;


DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `email_id` varchar(250) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `login` WRITE;
INSERT INTO `login` VALUES ('ac.mattis@protonmail.net','Customer','XEVO888','uwo46w0Su'),('ante.dictum@outlook.edu','Employee','SRKK317','ojy28p3Lh'),('consectetuer@google.com','Employee','YKOP908','lmg69k6Bp'),('est.mollis@hotmail.com','Employee','FLNI527','czc48x7Dv'),('fermentum.risus@icloud.com','Customer','NFIS952','guf05v8Vv'),('inceptos.hymenaeos@outlook.ca','Customer','XNPS443','ggx74x1Ag'),('maecenas.mi@google.edu','Employee','HDTO052','gkf62n8Nq'),('nec.ante.blandit@yahoo.net','Customer','DSRM876','uds90l8Ep'),('phasellus@google.ca','Customer','ESCK764','zhw03h3Kt'),('scelerisque@aol.edu','Customer','GGVT865','rhh73b5Ev');
UNLOCK TABLES;


DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `payment_amountdue` int DEFAULT NULL,
  `payment_duedate` date DEFAULT NULL,
  `account_no` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `payment` WRITE;
INSERT INTO `payment` VALUES (1,16775,'2023-04-22',873373),(2,15237,'2023-05-15',486558),(3,18269,'2023-09-07',329668),(4,26582,'2023-10-27',674275),(5,14147,'2023-09-17',883489),(6,12503,'2023-12-17',777259),(7,12289,'2023-08-19',765420),(8,12188,'2023-07-09',620886),(9,19282,'2023-07-08',767522),(10,1278,'2024-02-03',647360);
UNLOCK TABLES;


DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `date_of_request` date DEFAULT NULL,
  `cust_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `loan_id` int NOT NULL,
  PRIMARY KEY (`cust_id`,`branch_id`,`loan_id`),
  KEY `branch_id` (`branch_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE,
  CONSTRAINT `request_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE,
  CONSTRAINT `request_ibfk_3` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `request` WRITE;
INSERT INTO `request` VALUES ('2018-10-28',3,10,3),('2019-02-08',5,4,4),('2020-07-21',7,5,5),('2017-12-03',8,8,6),('2022-01-02',8,10,7),('2020-12-07',9,1,4),('2017-06-06',9,5,3),('2022-05-26',10,4,6),('2019-01-21',10,4,8),('2021-07-17',10,6,8);
UNLOCK TABLES;

