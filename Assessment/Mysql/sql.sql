-- Assessment 1:
CREATE DATABASE worker;

USE worker;

CREATE TABLE worker(
Worker_Id INT PRIMARY KEY NOT NULL,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Salary FLOAT NOT NULL,
Joinning_Date DATETIME NOT NULL,
DEPARTMENT ENUM("HR","Admin","Account") NOT NULL
);

INSERT INTO worker VALUES
("1", "Monika", "Arora", "100000", '2014-02-20 09:00:00', "HR"),
("2", "Niharika", "Verama", "80000", '2014-06-11 09:00:00', "Admin"),
("3", "Vishal", "Singhal", "300000", '2014-02-20 09:00:00', "HR"),
("4", "Amitabh", "Singh", "500000", '2014-02-20 09:00:00', "Admin"),
("5", "Vivek", "Bhati", "500000", '2014-06-11 09:00:00', "Admin"),
("6", "Vipul", "Diwan", "200000", '2014-06-11 09:00:00', "Account"),
("7", "Satish", "Kumar", "75000", '2014-01-20 00:00:00', "Account"),
("8", "Geetika", "Chauahan", "90000", '2014-04-11 00:00:00', "Admin");


-- QUESTION : 1  

SELECT * FROM worker
ORDER BY First_Name ASC ,DEPARTMENT DESC;

-- QUESTION : 2 

SELECT * FROM worker
WHERE  First_Name IN ("Vipul","Satish");


-- QUESTION : 3  

SELECT * FROM worker
WHERE First_Name LIKE '_____h' 
AND 
length(First_Name)=6;

-- QUESTION : 4 

SELECT * FROM worker 
WHERE Salary BETWEEN 50000 and 150000;

-- QUESTION : 5  

SELECT First_Name,Last_Name ,COUNT(*) AS duplicate_count
FROM worker 
GROUP BY First_Name,Last_Name
HAVING COUNT(*)>1;

-- QUESTION : 6 
SELECT * FROM worker
LIMIT 6;

-- QUESTION : 7  

SELECT DEPARTMENT,COUNT(*) 
FROM worker
GROUP BY DEPARTMENT
HAVING COUNT(*)<5;

-- QUESTION : 8  

SELECT DEPARTMENT,COUNT(*) AS Worker_Count
FROM worker GROUP BY DEPARTMENT ;

-- QUESTION : 9 
select First_Name, DEPARTMENT, Salary
from worker
where (DEPARTMENT, salary) in (select  DEPARTMENT, max(salary)
	from worker
	group by DEPARTMENT)
order by Salary desc;


-- Assessment 2:
CREATE DATABASE school;
USE school;

CREATE TABLE Student(
StdID INT NOT NULL,
Std_Name VARCHAR(45) NOT NULL,
Sex VARCHAR(10) NOT NULL,
Percentage FLOAT NOT NULL,
Class INT NOT NULL,
Sec VARCHAR(2) NOT NULL,
Stream VARCHAR(10) NOT NULL,
BOB DATE
);

INSERT INTO Student VALUES
("1", "Surekha Joshi", "Female", "82", "12", "A", "Science", "1998-03-08"),
("2", "Maahi Agarwal", "Female", "56", "11", "C", "Commerce", "2008-11-23"),
("3", "Sanam Verma", "Male", "56", "11", "C", "Commerce", "2006-06-29"),
("4", "Ronit Kumar", "Male", "63", "11", "C", "Commerce", "1997-05-11"),
("5", "Dipesh Pulkit", "Male", "78", "11", "B", "Science", "2003-09-14"),
("6", "Jahanvi Puri", "Female", "60", "11", "B", "Commerce", "2008-11-07"),
("7", "Sanam Kumar", "Male", "23", "12", "F", "Commerce", "1998-03-08"),
("8", "Sahil Saras", "Male", "56", "11", "C", "Commerce", "2008-11-07"),
("9", "Akshra Agarwal", "Female", "72", "12", "B", "Commerce", "1996-10-01"),
("10", "Stuti Mishra", "Female", "39", "11", "F", "Science", "2008-11-23"),
("11", "Harsh Agarwal", "Male", "42", "11", "C", "Science", "1998-03-08"),
("12", "Nikunj Agarwal", "Male", "49", "12", "C", "Commerce", "1998-06-28"),
("13", "Akriti Saxena", "Female", "89", "12", "A", "Science", "2008-11-23"),
("14", "Tani Rastogi", "Female", "82", "12", "A", "Science", "2008-11-23");


-- QUESTION : 1  

SELECT * FROM Student;

-- QUESTION : 2 

SELECT Std_Name, BOB FROM Student 
WHERE Std_Name = 'Surekha Joshi';

-- QUESTION : 3 
SELECT * FROM student WHERE percentage >= 80;

-- QUESTION: 4
SELECT Std_Name, Stream
FROM student WHERE percentage > 80; 

-- QUESTION : 5 
SELECT * FROM student
WHERE Stream = "Science" AND percentage>75;




