 CREATE DATABASE IF NOT EXISTS LabSheet3;
USE LabSheet3;
DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Gender CHAR(1),
    Dept_ID INT,
    Marks INT,
    City VARCHAR(50)
);
INSERT INTO Student
(Student_ID, Student_Name, Gender, Dept_ID, Marks, City)
VALUES
(1, 'Aarav', 'M', 101, 85, 'Meerut'),
(2, 'Priya', 'F', 102, 92, 'Delhi'),
(3, 'Rahul', 'M', 103, 76, 'Roorkee'),
(4, 'Ananya', 'F', 102, 88, 'Meerut'),
(5, 'Karan', 'M', 101, 69, 'Delhi'),
(6, 'Neha', 'F', 104, 95, 'Noida'),
(7, 'Mohit', 'M', 103, 81, 'Meerut'),
(8, 'Simran', 'F', 105, 73, 'Ghaziabad'),
(9, 'Rohan', 'M', 104, 89, 'Delhi'),
(10, 'Pooja', 'F', 102, 78, 'Roorkee');
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees
(Employee_ID, First_Name, Last_Name, Salary)
VALUES
(1, 'Divya', 'Verma', 45678.45),
(2, 'Aarav', 'Sharma', 52345.67),
(3, 'Priya', 'Singh', 38999.32),
(4, 'Rahul', 'Kumar', 61250.75),
(5, 'Ananya', 'Gupta', 47890.55);
SELECT * FROM Student;
SELECT * FROM Employees;
SELECT ABS(-25) AS Absolute_Value;

SELECT ABS(50) AS Absolute_Value;
SELECT
    Employee_ID,
    First_Name,
    Salary,
    ABS(Salary - 50000) AS Salary_Difference
FROM Employees;
SELECT ROUND(125.678, 2) AS Rounded_Value;
SELECT
    Employee_ID,
    First_Name,
    Salary,
    ROUND(Salary, 2) AS Rounded_Salary
FROM Employees;
SELECT
    Employee_ID,
    First_Name,
    Salary,
    ROUND(Salary, -3) AS Rounded_Salary
FROM Employees;
SELECT MOD(17, 5) AS Remainder;
SELECT
    CEIL(12.3) AS Ceiling_Value,
    FLOOR(12.9) AS Floor_Value;
SELECT
    Employee_ID,
    First_Name,
    Last_Name,
    Salary,
    ROUND(Salary, 2) AS Rounded_Salary
FROM Employees;
SELECT COUNT(*) AS Total_Students
FROM Student;
SELECT ROUND(AVG(Salary), 2) AS Average_Salary
FROM Employees;
SELECT MAX(Salary) AS Highest_Salary
FROM Employees;
SELECT MIN(Salary) AS Lowest_Salary
FROM Employees;
SELECT
    Student_Name,
    Upper(Student_Name)AS Upper_Name
FROM Student;
SELECT
    Student_Name,
    LOWER(Student_Name) AS Lower_Name
FROM Student;
SELECT
    Student_Name,
    LENGTH(Student_Name) AS Name_Length
FROM Student;
SELECT
    First_Name,
    Last_Name,
    CONCAT(First_Name, ' ', Last_Name) AS Full_Name
FROM Employees;
SELECT
    Student_Name,
    SUBSTRING(Student_Name, 1, 3) AS First_Three_Characters
FROM Student;
SELECT CAST(12345 AS CHAR) AS String_Value;
SELECT CAST('50000' AS DECIMAL(10,2)) AS Numeric_Value;
SELECT
    Joining_Date,
    DATE_FORMAT(Joining_Date, '%d-%m-%Y') AS Formatted_Date
FROM Employees;
SELECT CAST(1000 AS CHAR) AS Number_To_String;
SELECT CAST('2500' AS SIGNED) AS String_To_Number;
SELECT CAST('45678.75' AS DECIMAL(10,2)) AS Decimal_Value;
SELECT CAST('2026-09-23' AS DATETIME) AS Date_Time_Value;
SELECT CONVERT(12345, CHAR) AS Converted_String;
SELECT CONVERT('5000', UNSIGNED) AS Converted_Number;
SELECT CONVERT('2026-09-23', DATETIME) AS Converted_Date;
SELECT CURDATE() AS Current_Date;
SELECT CURRENT_DATE() AS Current_Date;
SELECT NOW() AS Current_Date_Time;
SELECT
    Joining_Date,
    YEAR(Joining_Date) AS Joining_Year,
    MONTH(Joining_Date) AS Joining_Month,
    DAY(Joining_Date) AS Joining_Day
FROM Employees;
SELECT
    Joining_Date,
    EXTRACT(YEAR FROM Joining_Date) AS Year,
    EXTRACT(MONTH FROM Joining_Date) AS Month,
    EXTRACT(DAY FROM Joining_Date) AS Day
FROM Employees;