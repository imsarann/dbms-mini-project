CREATE ROLE admin;
CREATE ROLE employee;
CREATE ROLE customer;
CREATE ROLE director;
CREATE ROLE insurance;

GRANT ALL PRIVILEGES ON OnlineBankingSystem.* TO director;
GRANT ALL PRIVILEGES ON OnlineBankingSystem.* TO admin;
GRANT SELECT, INSERT ON OnlineBankingSystem.account TO employee;
GRANT SELECT, INSERT ON OnlineBankingSystem.customer TO employee;
GRANT SELECT, INSERT ON OnlineBankingSystem.employee TO employee;
GRANT SELECT, INSERT ON OnlineBankingSystem.loans TO employee;
GRANT SELECT, INSERT ON OnlineBankingSystem.payment TO employee;
GRANT SELECT, INSERT ON OnlineBankingSystem.request TO employee;
GRANT SELECT, INSERT ON OnlineBankingSystem.branch TO employee;
GRANT SELECT, INSERT ON OnlineBankingSystem.insurance TO employee;
GRANT SELECT, UPDATE ON OnlineBankingSystem.insurance TO insurance;