SELECT 25 + 15 AS Addition_Result;
SELECT 50 - 18 AS Subtraction_Result;
SELECT 12 * 8 AS Multiplication_Result;
SELECT 100 / 4 AS Division_Result;
SELECT 49.99 * 5 AS Total_Amount;

CREATE DATABASE IF NOT EXISTS LabSheet4DB;
USE LabSheet4DB;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Course VARCHAR(50),
    City VARCHAR(50),
    Marks INT
);

INSERT INTO Students VALUES
(1, 'Alice', 'Computer Science', 'New York', 85),
(2, 'Bob', 'Mathematics', 'Chicago', 58),
(3, 'Charlie', 'Computer Science', 'Chicago', 72),
(4, 'Diana', 'Physics', 'New York', 90),
(5, 'Ethan', 'Computer Science', 'New York', 65);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    JobTitle VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Status VARCHAR(20)
);

INSERT INTO Employees VALUES
(101, 'John Smith', 'Sales', 'Manager', 32, 60000.00, 'Active'),
(102, 'Sarah Connor', 'Marketing', 'Specialist', 24, 45000.00, 'Active'),
(103, 'Mike Ross', 'IT', 'Developer', 28, 75000.00, 'Active'),
(104, 'Rachel Zane', 'Sales', 'Representative', 29, 52000.00, 'Terminated'),
(105, 'Harvey Specter', 'Legal', 'Manager', 42, 120000.00, 'Active');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

INSERT INTO Products VALUES
(201, 'Laptop', 'Electronics', 899.99, 15),
(202, 'Blender', 'Appliances', 49.99, 8),
(203, 'Desk Chair', 'Furniture', 120.00, 5),
(204, 'Smartphone', 'Electronics', 699.99, 25),
(205, 'Coffee Maker', 'Appliances', 85.00, 12);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Customers VALUES
(301, 'Emma Watson', 'USA'),
(302, 'Liam Neeson', 'UK'),
(303, 'Hugh Jackman', 'Australia'),
(304, 'Chris Evans', 'USA');

SELECT EmpName, Age, Salary 
FROM Employees 
WHERE Age > 25 AND Salary > 50000.00;

SELECT ProductName, Category, Price 
FROM Products 
WHERE Category = 'Electronics' OR Category = 'Appliances';

SELECT CustomerName, Country 
FROM Customers 
WHERE NOT Country = 'USA';

SELECT StudentName, Course, City 
FROM Students 
WHERE Course = 'Computer Science' AND City = 'New York';

SELECT EmpName, Department 
FROM Employees 
WHERE Department = 'Sales' OR Department = 'Marketing';

SELECT EmpName, JobTitle, Department 
FROM Employees 
WHERE JobTitle = 'Manager';

SELECT ProductName, Price 
FROM Products 
WHERE Price > 100.00;

SELECT ProductName, StockQuantity 
FROM Products 
WHERE StockQuantity < 10;

SELECT StudentName, Marks 
FROM Students 
WHERE Marks >= 60 AND Marks <= 80;

SELECT EmpName, Status 
FROM Employees 
WHERE Status <> 'Terminated';

SELECT EmpName, Status 
FROM Employees 
WHERE Status != 'Terminated';

USE LabSheet4DB;

INSERT INTO Employees (EmpID, EmpName, Department, JobTitle, Age, Salary, Status) 
VALUES (106, 'Donna Paulsen', NULL, 'Executive Assistant', 38, NULL, 'Active');

CREATE TABLE NorthRegion_Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE SouthRegion_Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO NorthRegion_Customers VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Chicago'),
(3, 'Charlie', 'Boston');

INSERT INTO SouthRegion_Customers VALUES
(3, 'Charlie', 'Boston'),
(4, 'Diana', 'Miami'),
(5, 'Ethan', 'Dallas');

SELECT EmpName, Salary 
FROM Employees 
WHERE Salary BETWEEN 50000.00 AND 80000.00;

SELECT StudentName, City 
FROM Students 
WHERE City IN ('New York', 'Chicago', 'Boston');

SELECT StudentName, City 
FROM Students 
WHERE City NOT IN ('Chicago', 'Dallas');


SELECT EmpName, Department 
FROM Employees 
WHERE EmpName LIKE 'S%';


SELECT EmpName, Department 
FROM Employees 
WHERE Department IS NULL;

SELECT EmpName, Salary 
FROM Employees 
WHERE Salary IS NOT NULL;
USE LabSheet4DB;

-- Drop existing tables if they exist partially
DROP TABLE IF EXISTS NorthRegion_Customers;
DROP TABLE IF EXISTS SouthRegion_Customers;

-- Create North Region Customers Table
CREATE TABLE NorthRegion_Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Create South Region Customers Table
CREATE TABLE SouthRegion_Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Insert Data into NorthRegion_Customers
INSERT INTO NorthRegion_Customers VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Chicago'),
(3, 'Charlie', 'Boston');

-- Insert Data into SouthRegion_Customers
INSERT INTO SouthRegion_Customers VALUES
(3, 'Charlie', 'Boston'),
(4, 'Diana', 'Miami'),
(5, 'Ethan', 'Dallas');

SELECT CustomerName, City FROM NorthRegion_Customers
UNION
SELECT CustomerName, City FROM SouthRegion_Customers;

SELECT CustomerName, City FROM NorthRegion_Customers
INTERSECT
SELECT CustomerName, City FROM SouthRegion_Customers;


SELECT CustomerName, City FROM NorthRegion_Customers
EXCEPT
SELECT CustomerName, City FROM SouthRegion_Customers;

SELECT 
    EmpID,
    EmpName,
    Department,
    Salary,
    (Salary * 1.10) AS Salary_With_10Pct_Bonus 
FROM Employees
WHERE 
    Status = 'Active'                          
    AND (Salary * 1.10) > 55000.00           
    AND Age BETWEEN 25 AND 45                  
    AND Department IS NOT NULL                 
    AND EmpName NOT LIKE 'R%';