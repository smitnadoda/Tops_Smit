create database marketco;
use marketco;

create table company(
companyid  int Primary key not null,
company_name varchar(45),
street varchar(45),
city varchar(45),
state varchar(45),
zip varchar(10));

create table contact(
contact_id int,
companyid int,
Firstname varchar(45),
Lastname varchar(45),
street varchar(45),
city varchar(45),
state varchar(5),
zip varchar(10),
Ismain boolean,
Email varchar(45),
Phone varchar(12),
PRIMARY KEY (contact_id),
FOREIGN KEY (companyid) REFERENCES company(companyid));

create table contactemployee(
ContactEmployee_id int,
contact_id int,
Employee_id int,
Contact_date date,
Descriptions varchar(100),
PRIMARY KEY (Employee_id),
FOREIGN KEY (contact_id) REFERENCES contact(contact_id));


create table employee(
Employee_id int,
Firstname varchar(45),
Lastname varchar(45),
salary float ,
Hiredate date,
JobTitle varchar(45),
Email varchar(45),
Phone varchar(12),
FOREIGN KEY (Employee_id) REFERENCES contactemployee(Employee_id));

INSERT INTO company VALUES 
(1, 'TechCorp', '123 Main St', 'New York', 'NY', '10001'),
(2, 'SoftSolutions', '456 Elm St', 'San Francisco', 'CA', '94102'),
(3, 'InnovateX', '789 Oak St', 'Chicago', 'IL', '60601'),
(4, 'FutureTech', '321 Pine St', 'Los Angeles', 'CA', '90001'),
(5, 'NextGen', '654 Maple St', 'Seattle', 'WA', '98101');

INSERT INTO contact VALUES 
(1, 1, 'John', 'Doe', '123 Main St', 'New York', 'NY', '10001', TRUE, 'john.doe@techcorp.com', '123-456-7890'),
(2, 2, 'Jane', 'Smith', '456 Elm St', 'San Francisco', 'CA', '94102', FALSE, 'jane.smith@softsolutions.com', '234-567-8901'),
(3, 3, 'Alice', 'Johnson', '789 Oak St', 'Chicago', 'IL', '60601', TRUE, 'alice.johnson@innovatex.com', '345-678-9012'),
(4, 4, 'Robert', 'Brown', '321 Pine St', 'Los Angeles', 'CA', '90001', FALSE, 'robert.brown@futuretech.com', '456-789-0123'),
(5, 5, 'Emily', 'Davis', '654 Maple St', 'Seattle', 'WA', '98101', TRUE, 'emily.davis@nextgen.com', '567-890-1234');


INSERT INTO contactemployee VALUES
(1, 1, 101, '2025-02-10', 'Initial meeting with Lesley Bland for Urban Outfitters'),
(2, 2, 102, '2025-02-12', 'Follow-up with Dianne Connor from Toll Brothers'),
(3, 3, 103, '2025-02-15', 'Meeting with Jack Lee at Acme Corp.'),
(4, 4, 104, '2025-02-18', 'Conference call with Sarah Kim from Tech Solutions'),
(5, 5, 105, '2025-02-20', 'Contract negotiation with John Doe from Global Enterprises');



INSERT INTO employee VALUES
(101, 'Lesley', 'Bland', 60000, '2020-01-10', 'Sales Manager', 'lesley.bland@urbanoutfitters.com', '215-555-1234'),
(102, 'Dianne', 'Connor', 70000, '2018-03-12', 'Project Manager', 'dianne.connor@tollbrothers.com', '215-555-5678'),
(103, 'Jack', 'Lee', 80000, '2017-05-20', 'Lead Engineer', 'jack.lee@acmecorp.com', '312-555-8765'),
(104, 'Sarah', 'Kim', 65000, '2019-07-15', 'Product Manager', 'sarah.kim@techsolutions.com', '415-555-4321'),
(105, 'John', 'Doe', 75000, '2016-09-05', 'Account Manager', 'john.doe@globalent.com', '212-555-9876');


-- QUESTION : 4  
UPDATE employee
SET Phone = '215-555-8800'
WHERE Firstname = 'Lesley' AND Lastname = 'Bland';

-- QUESTION : 5 
UPDATE company
SET company_name = "Urban Outfitters"
WHERE companyid = "1";

-- QUESTION : 6 

SELECT * FROM contactemployee;

DELETE FROM employee WHERE Employee_id = 102;

DELETE FROM contactemployee WHERE ContactEmployee_id = 2 AND Employee_id = 102;

-- QUESTION : 7 :Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in MySQL Workbench. Copy the results below as well. 

SELECT e.Firstname, e.Lastname
FROM employee e
JOIN contactemployee ce ON e.Employee_id = ce.Employee_id
JOIN contact c ON ce.contact_id = c.contact_id
JOIN company comp ON c.companyid = comp.companyid
WHERE comp.company_name = 'FutureTech';

-- QUESTION : 8
SELECT * FROM employee WHERE Firstname LIKE 'J%';

SELECT * FROM employee WHERE Firstname LIKE '_a%';

-- QUESTION : 9 :
/* Normalization is a process of organizing data in a database to:

Reduce data redundancy
Improve data integrity
Enhance query performance

Normal Forms (NF):

1NF (First Normal Form): No duplicate rows; each column has atomic values (no multiple values in one column).
2NF (Second Normal Form): 1NF + No partial dependency (all non-key attributes must depend on the whole primary key).
3NF (Third Normal Form): 2NF + No transitive dependency (attributes should depend only on the primary key).
BCNF (Boyce-Codd Normal Form): 3NF + No overlapping candidate keys.
*/

-- QUESTIOn : 10

/*A JOIN in MySQL is used to combine data from multiple tables based on a related column.

Common types of JOINs:

INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN

*/


-- QUESTION :11

/* DDL (Data Definition Language) → Defines the structure of a database
Commands: CREATE, ALTER, DROP, TRUNCATE

DML (Data Manipulation Language) → Modifies data inside tables
Commands: INSERT, UPDATE, DELETE, SELECT

DCL (Data Control Language) → Controls access to data
Commands: GRANT, REVOKE 
*/    
-- QUESTION : 12
/*
INNER JOIN – Returns only matching records from both tables.

	SELECT employees.name, company.company_name
	FROM employees
	INNER JOIN company ON employees.companyid = company.companyid;

LEFT JOIN (LEFT OUTER JOIN) – Returns all records from the left table and matching records from the right table.

	SELECT employees.name, company.company_name
	FROM employees
	LEFT JOIN company ON employees.companyid = company.companyid;

RIGHT JOIN (RIGHT OUTER JOIN) – Returns all records from the right table and matching records from the left table.

	SELECT employees.name, company.company_name
	FROM employees
	RIGHT JOIN company ON employees.companyid = company.companyid;

FULL JOIN (FULL OUTER JOIN) – Returns all records when there is a match in either left or right table. (Not directly supported in MySQL, but can be achieved using UNION)

	SELECT employees.name, company.company_name
	FROM employees
	LEFT JOIN company ON employees.companyid = company.companyid
	UNION
	SELECT employees.name, company.company_name
	FROM employees
RIGHT JOIN company ON employees.companyid = company.companyid;
*/







