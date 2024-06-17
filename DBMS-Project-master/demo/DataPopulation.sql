use OnlineBankingSystem;

  INSERT INTO `account` (`acc_no`,`overdraft`,`balance`)
VALUES
  (873373,"1",999785.95),
  (486558,"1",998189.21),
  (329668,"1",997756.64),
  (674275,"1",999730.35),
  (883489,"1",999027.39),
  (777259,"1",999052.41),
  (765420,"1",999637.31),
  (620886,"1",1000550.64),
  (767522,"1",997775.64),
  (647360,"1",999773.39);
  
  INSERT INTO `account_type` (`account_no`,`deposit_ammount`,`transaction_limit`,`withdraw_limit`,`interest_rate`)
VALUES
  (873373,1000,200000,100000,5),
  (486558,5000,200000,100000,5),
  (329668,500,200000,200000,5),
  (674275,990,500000,200000,6),
  (883489,800,500000,300000,7),
  (777259,1600,100000,300000,8),
  (765420,2000,100000,100000,5),
  (620886,1500,300000,100000,6),
  (767522,2500,200000,200000,7),
  (647360,1500,123000,200000,8);

  

INSERT INTO `assistance` (`cust_id`,`emp_id`,`date_of_assistance`)
VALUES
  (5,1000,"2019-11-03"),
  (10,1004,"2017-04-22"),
  (2,1002,"2017-05-06"),
  (5,1007,"2019-06-15"),
  (6,1008,"2016-05-19"),
  (5,1008,"2019-08-12"),
  (7,1004,"2019-04-03"),
  (2,1005,"2016-12-10"),
  (8,1001,"2017-10-01"),
  (9,1005,"2021-01-24");
  

 
  -- BANK
  
INSERT INTO `bank` (`bank_ssn`,`bank_name`,`HO_email`,`HO_address_state`,`HO_address_city`,`HO_address_pincode`)
VALUES
  (1000,"Levine Bank","penatibus.et@google.org","Rajasthan","Wals-Siezenheim",161143),
  (1001,"Bishop Bank","augue@protonmail.org","Chhattisgarh","Surat",162820),
  (1002,"Moon Bank","gravida@hotmail.com","Uttar Pradesh","Minitonas",132669),
  (1003,"Bond Bank","donec@yahoo.com","Sikkim","Unecha",821634),
  (1004,"Griffin Bank","nec@aol.edu","Punjab","Opole",265256);
  
  -- BRANCH
  
INSERT INTO `branch` (`branch_id`,`branch_email`,`branch_address_state`,`branch_address_city`,`branch_address_pincode`)
VALUES
  (1,"natoque@hotmail.org","Rajasthan","Mosjøen",485953),
  (2,"sociis.natoque@hotmail.ca","Assam","Chitral",612397),
  (3,"dignissim.magna.a@hotmail.com","Meghalaya","Banda Aceh",713618),
  (4,"elit.etiam@aol.couk","Delhi","Zaria",258159),
  (5,"mauris@aol.org","Arunachal Pradesh","Gwangju",697866),
  (6,"a.scelerisque@outlook.com","Daman and Diu","Palmerston",819859),
  (7,"imperdiet@icloud.couk","Nagaland","Whitehorse",451685),
  (8,"volutpat@yahoo.org","Uttar Pradesh","Belfast",729939),
  (9,"aliquam.fringilla@hotmail.net","Daman and Diu","Palma de Mallorca",553708),
  (10,"suscipit.nonummy@aol.com","Rajasthan","Huesca",348635);

-- branches
INSERT INTO `branches` (`date_of_opening`,`bank_ssn`,`branch_id`)
VALUES
  ("2015-03-07",1003,8),
  ("2021-01-19",1003,10),
  ("2019-04-25",1009,2),
  ("2018-10-07",1005,5),
  ("2018-10-30",1005,6),
  ("2018-10-29",1006,3),
  ("2015-06-13",1000,4),
  ("2018-10-08",1003,7),
  ("2015-08-01",1002,9),
  ("2020-10-28",1004,1);  

-- credit_card  

INSERT INTO `credit_card` (`cc_limit`,`cc_number`,`cc_cvv`,`cc_expirydate`,`account_no`)
VALUES
  (23670,12247594,901,"2023-12-06",873373),
  (34119,13221224,570,"2024-02-12",486558),
  (96119,13246683,308,"2023-10-23",329668),
  (62066,12546778,410,"2023-06-17",674275),
  (14134,12890436,213,"2023-10-13",883489),
  (54563,11655571,248,"2023-10-25",777259),
  (82284,18548205,848,"2023-05-04",765420),
  (60265,18781485,829,"2023-08-28",620886),
  (81671,14336466,127,"2023-04-16",767522),
  (10611,14286801,744,"2023-12-31",647360);


  -- CUSTOMER

INSERT INTO `customer` (`cust_id`,`dob`,`first_name`,`last_name`,`phone_no`,`email`,`cust_address_state`,`cust_address_city`,`cust_address_pincode`,`pan_no`,`account_no`)
VALUES
  (1,"2020-07-05","Benedict","Harper",934652121,"ac.mattis@protonmail.net","736-8863 Mauris Avenue","Kavaratti",787644,161582657,873373),
  (2,"2008-02-09","Joshua","Boone",933750467,"vitae.sodales@yahoo.com","P.O. Box 382, 3355 Tempor Road","Aizwal",451352,667818422,486558),
  (3,"2009-08-31","Jesse","Harvey",921984594,"mauris.ut@protonmail.edu","P.O. Box 521, 1498 Lectus Rd.","Imphal",415676,504181748,329668),
  (4,"2014-01-06","Quail","Morris",936233275,"lectus.quis@outlook.org","P.O. Box 274, 699 Cum Street","Delhi",219127,353491334,674275),
  (5,"1998-12-29","Bryar","Schultz",973216943,"phasellus@google.ca","695-4527 Donec Av.","Silvassa",491024,660912167,883489),
  (6,"2006-11-19","Chase","Hart",973655286,"neque@outlook.org","1954 Non Rd.","Port Blair",967196,484372827,777259),
  (7,"2008-03-02","Keegan","Goff",979617912,"turpis.nulla@google.net","Ap #333-3233 Eget, Av.","Lahore",757655,338942066,765420),
  (8,"2007-12-29","Illiana","Hanson",977818456,"fermentum.risus@icloud.com","9139 Sed Avenue","Patan",214168,467327842,620886),
  (9,"2004-02-27","Baxter","Lawrence",987457745,"imperdiet@aol.org","514-6277 Dictum St.","Haldia",440898,933044774,767522),
  (10,"2004-06-10","Bert","Chang",968270946,"consectetuer@google.com","Ap #835-8207 Risus. Street","Daman",928004,569736306,647360);


-- debit_card

INSERT INTO `debit_card` (`debit_number`,`cc_cvv`,`debit_expirydate`,`account_no`)
VALUES
  (17400335,158,"2023-11-27",873373),
  (13519196,699,"2023-12-15",486558),
  (10836544,563,"2023-03-03",329668),
  (13222655,372,"2023-12-20",674275),
  (19537734,681,"2023-05-11",883489),
  (18634753,857,"2023-12-19",777259),
  (13927455,856,"2023-07-18",765420),
  (11841303,281,"2023-12-19",620886),
  (19848698,980,"2023-09-18",767522),
  (15596584,830,"2023-06-07",647360);
  
  
  INSERT INTO `employee` (`emp_id`,`first_name`,`last_name`,`salary`,`emp_type`,`emp_dob`,`phone_no`,`emp_address_state`,`emp_address_city`,`emp_address_pincode`,`mgr_id`)
VALUES
  (1000,"Barclay","Mathis",156835,"IT","1996-04-18","9616311711","228-281 Consequat Rd.","Ranchi",152565,1),
  (1001,"Ivy","Ray",178677,"Manager","1996-05-15","9236383056","Ap #533-8199 Nulla Ave","Chandigarh",977347,2),
  (1002,"Vaughan","Nolan",184248,"IT","1996-05-05","9371846824","Ap #542-9277 Velit Ave","Uluberia",568007,3),
  (1003,"Aaron","Merrill",116529,"Bank Clerk","1996-05-16","9813713324","991-598 Consectetuer St.","Delhi",404413,4),
  (1004,"Rosalyn","Mccullough",171636,"IT","1996-04-08","9355802510","Ap #210-3111 Orci, Street","Parbhani",831659,5),
  (1005,"Josiah","Cox",124604,"Bank Clerk","1996-04-02","9290618312","Ap #578-1997 Non, Street","Panjim",107305,6),
  (1006,"Bevis","Duran",153371,"Bank Clerk","1996-05-11","9385333731","Ap #628-3754 Lobortis Street","Imphal",533909,7),
  (1007,"Orson","Gray",183365,"Manager","1996-04-04","9925047135","6958 Semper Ave","Shillong",648944,8),
  (1008,"Eugenia","Gilmore",170024,"Bank Clerk","1996-04-05","9793175784","Ap #796-9671 Nunc, St.","Gangtok",468786,9),
  (1009,"Cadman","Byrd",195872,"IT","1996-04-15","9214412245","P.O. Box 246, 4845 Eu, Rd.","Aizwal",264127,10);
     
  
-- insurance

INSERT INTO `insurance` (`insurance_no`,`type`,`date_of_insurance`,`term`,`premium_payment`,`issuing_company`,`cust_id`)
VALUES
  (1,"Home Insurance","2019-01-23",7,"18500","Non Magna Consulting",1),
  (2,"Travel Insurance","2019-06-23",8,"28700","Non Magna Nam LLC",2),
  (3,"Home Insurance","2021-02-28",6,"93800","Dolor Vitae Inc.",3),
  (4,"Travel Insurance","2018-03-20",7,"64200","Eleifend Egestas Sed Incorporated",4),
  (5,"Home Insurance","2015-11-08",8,"65800","Magna Praesent PC",10),
  (6,"Travel Insurance","2016-09-14",8,"43100","Ac Turpis LLP",6),
  (7,"Home Insurance","2015-10-07",7,"84100","Turpis LLP",5),
  (8,"Motor Insurance","2021-01-09",7,"27500","Donec Est Corp.",9),
  (9,"Motor Insurance","2018-04-29",7,"63100","Consequat Purus Maecenas Corp.",8),
  (10,"Travel Insurance","2016-11-29",5,"30600","Consectetuer Rhoncus Nullam Ltd",7);
  
  

-- loans

INSERT INTO `loans` (`loan_id`,`term`,`rate_of_interest`,`amount`,`type_of_loan`,`account_no`)
VALUES
  (1,9,9,74920,"Home Loan",873373),
  (2,9,9,39497,"Business Loan",329668),
  (3,5,6,35193,"Personal Loan",647360),
  (4,5,10,84855,"Gold Loan",620886),
  (5,10,9,25024,"Business Loan",883489),
  (6,10,6,71005,"Gold Loan",674275),
  (7,8,7,73476,"Gold Loan",873373),
  (8,5,9,10855,"Home Loan",777259),
  (9,5,6,12932,"Home Loan",765420),
  (10,6,8,54723,"Gold Loan",647360);

  
-- login
-- data remaining

INSERT INTO `login` (`email_id`,`role`,`username`,`password`)
VALUES
  ("est.mollis@hotmail.com","Employee","FLNI527","czc48x7Dv"),
  ("ac.mattis@protonmail.net","Customer","XEVO888","uwo46w0Su"),
  ("phasellus@google.ca","Customer","ESCK764","zhw03h3Kt"),
  ("consectetuer@google.com","Employee","YKOP908","lmg69k6Bp"),
  ("nec.ante.blandit@yahoo.net","Customer","DSRM876","uds90l8Ep"),
  ("ante.dictum@outlook.edu","Employee","SRKK317","ojy28p3Lh"),
  ("maecenas.mi@google.edu","Employee","HDTO052","gkf62n8Nq"),
  ("fermentum.risus@icloud.com","Customer","NFIS952","guf05v8Vv"),
  ("inceptos.hymenaeos@outlook.ca","Customer","XNPS443","ggx74x1Ag"),
  ("scelerisque@aol.edu","Customer","GGVT865","rhh73b5Ev");

-- payment

INSERT INTO `payment` (`payment_id`,`payment_amountdue`,`payment_duedate`,`account_no`)
VALUES
  (1,16775,"2023-04-22",873373),
  (2,15237,"2023-05-15",486558),
  (3,18269,"2023-09-07",329668),
  (4,26582,"2023-10-27",674275),
  (5,14147,"2023-09-17",883489),
  (6,12503,"2023-12-17",777259),
  (7,12289,"2023-08-19",765420),
  (8,12188,"2023-07-09",620886),
  (9,19282,"2023-07-08",767522),
  (10,1278,"2024-02-03",647360);
  
-- request
INSERT INTO `request` (`date_of_request`,`cust_id`,`branch_id`,`loan_id`)
VALUES
  ("2020-12-07",9,1,4),
  ("2022-01-02",8,10,7),
  ("2019-01-21",10,4,8),
  ("2022-05-26",10,4,6),
  ("2021-07-17",10,6,8),
  ("2018-10-28",3,10,3),
  ("2017-12-03",8,8,6),
  ("2020-07-21",7,5,5),
  ("2017-06-06",9,5,3),
  ("2019-02-08",5,4,4);
-- account_branch left 
 INSERT INTO `account_branch` (`account_no`,`branch_id`,`date_of_opening`)
VALUES
  (873373,5,"2019-12-15"),
  (486558,4,"2021-08-24"),
  (329668,3,"2018-01-21"),
  (674275,7,"2018-10-17"),
  (883489,8,"2019-09-11"),
  (777259,6,"2016-10-26"),
  (765420,9,"2019-05-13"),
  (620886,2,"2021-01-04"),
  (767522,1,"2023-01-23"),
  (647360,3,"2021-03-11");
  INSERT INTO `emp_branch` (`date_of_joining`,`emp_id`,`branch_id`)
VALUES
  ("2020-12-07",1004,4),
  ("2022-01-02",1006,7),
  ("2019-01-21",1001,8),
  ("2022-05-26",1002,6),
  ("2021-07-17",1010,8),
  ("2018-10-28",1003,3),
  ("2017-12-03",1008,6),
  ("2020-07-21",1007,5),
  ("2017-06-06",1009,3),
  ("2019-02-08",1005,4);
   