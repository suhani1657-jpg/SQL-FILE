DROP DATABASE IF EXISTS College;
CREATE DATABASE College;
USE College;

CREATE TABLE Student (
    Sname VARCHAR(50),
    Age INT,
    Branch VARCHAR(50),
    DOB DATE,
    Course VARCHAR(50),
    Year_of_Admission INT,
    City Varchar(50)
);

Insert into Student values('Yash', 22, 'Data Science', '2004-07-26', 'B.Tech', 2022,'Meerut');
 Select * from Student;
--  Insert into Student v-- alues('Pooja', 19, 'Civil', '2007-08-11', 'B.Tech', 2025);
-- Insert into Student values('Arjun', 22, 'Mechanical', '2004-05-30', 'B.Tech', 2022);
-- Insert into Student values('Kavya', 20, 'AI', '2006-09-21', 'B.Tech', 2024);
-- Insert into Student values('Nikhil', 21, 'ECE', '2005-02-17', 'B.Tech', 2023);
-- Insert into Student values('Mehak', 19, 'CSE', '2007-11-03', 'B.Tech', 2025);
-- Select * from Student;
Insert into Student (Sname, Age, Branch, DOB, Course, Year_of_Admission,City)
VALUES
('Pooja', 19, 'Civil', '2007-08-11', 'B.Tech', 2025,'Meerut'),
('Arjun', 22, 'Mechanical', '2004-05-30', 'B.Tech', 2022,'Delhi'),
('Kavya', 20, 'AI', '2006-09-21', 'B.Tech', 2024,'Mumbai'),
('Nikhil', 21, 'ECE', '2005-02-17', 'B.Tech', 2023,'Delhi'),
('Mehak', 19, 'CSE', '2007-11-03', 'B.Tech', 2025,'Roorkee');
INSERT INTO Student (Sname, age, branch)
VALUES ('Riya', 19, 'CSE');
 Select * from Student;
 UPDATE Student
SET Year_of_Admission=2022
WHERE Sname = 'Rahul';
Select * from Student;
UPDATE Student
SET Course = 'BTech CSE'
WHERE Sname = 'Rahul';
Select * from Student;
UPDATE Student
SET City = 'Delhi'
WHERE City = 'Meerut';
Select * from Student;
UPDATE Student
SET Age= 20,
    branch = 'CSE'
    WHERE Sname = 'Rahul';
Select * from Student;
DELETE FROM Student
WHERE Year_of_Admisssion=2025;
DELETE FROM Student
WHERE City = 'Meerut';
 CREATE TABLE Employee (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Email VARCHAR(100) UNIQUE
);
 INSERT INTO Employee (FirstName, LastName, Department, Salary, Email)
VALUES
('Suhani', 'Saini', 'BTech', 60000, 'suhani@gmail.com'),
('Amit', 'Sharma', 'IT', 55000, 'amit@gmail.com'),
('Priya', 'Verma', 'HR', 50000, 'priya@gmail.com');
Select * from Employee;
UPDATE Employee
SET Salary = 65000
WHERE ID = 1;
Select * from Employee;
UPDATE Employee
SET Salary = Salary * 1.10;
Select * from Employee;
DELETE FROM Employee
WHERE Salary < 50000;
DELETE FROM Employee
WHERE Salary < 50000 AND Department = 'HR';
CREATE TABLE Department (
    Dept_ID INT AUTO_INCREMENT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);
INSERT INTO Department (Dept_ID, Dept_Name, Location)
VALUES
(101, 'CSE', 'Block A'),
(102, 'IT', 'Block B'),
(103, 'ECE', 'Block C'),
(104, 'HR', 'Block D');
Select * From Department;
UPDATE Employee
SET Department = 'CSE'
WHERE ID = 1;
Select * From Department;
CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    Quantity INT
);
INSERT INTO Product (Product_ID, Product_Name, Price, Quantity)
VALUES
(1, 'Laptop', 55000, 10),
(2, 'Mouse', 500, 50),
(3, 'Keyboard', 1000, 30),
(4, 'Monitor', 12000, 15);
Select * From Product;
DELETE FROM Product
WHERE Quantity = 0;
CREATE Table Course(
    Course_ID INT AUTO_INCREMENT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Duration VARCHAR(20),
    Fees DECIMAL(10,2)
);
INSERT INTO Course (Course_ID, Course_Name, Duration, Fees)
VALUES
(101, 'BTech CSE', '4 Years', 120000),
(102, 'BTech IT', '4 Years', 115000),
(103, 'BTech Data Science', '4 Years', 130000),
(104, 'BCA', '3 Years', 90000);
Select * From Course;
UPDATE Course
SET Fees = 140000
WHERE Course_Name = 'BTech Data Science';
Select * From Course;

INSERT INTO Student
VALUES ('Rahul', 21, 'CSE', '2005-04-15', 'B.Tech', 2023, 'Jaipur');

SELECT * FROM Student;
UPDATE Student
SET City = 'Delhi'
WHERE Sname = 'Yash';

SELECT * FROM Student;

DELETE FROM Student
WHERE Sname = 'Rahul';

SELECT * FROM Student;
