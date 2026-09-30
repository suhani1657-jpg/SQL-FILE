CREATE DATABASE IF NOT EXISTS LabSheet5DB;
USE LabSheet5DB;

-- Drop tables if they exist to allow clean creation
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Department;

-- 1. Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 2. Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- 3. Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    CourseID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- 4. Employee Table (with ManagerID referencing EmployeeID)
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    ManagerID INT
);

-- Insert Sample Data
INSERT INTO Department VALUES 
(101, 'Computer Science'),
(102, 'Mechanical'),
(103, 'Electrical'),
(104, 'Civil'); -- Department with no students

INSERT INTO Course VALUES 
(201, 'Data Structures', 101),
(202, 'Thermodynamics', 102),
(203, 'Circuit Theory', 103),
(204, 'Web Development', 101);

INSERT INTO Student VALUES 
(1, 'Alice', 101, 201),
(2, 'Bob', 101, 204),
(3, 'Charlie', 102, 202),
(4, 'Diana', 103, 203),
(5, 'Ethan', NULL, NULL); -- Student with no assigned department or course

INSERT INTO Employee VALUES 
(1, 'John Smith', 101, 60000.00, NULL),  -- Top Manager
(2, 'Sarah Connor', 101, 45000.00, 1),
(3, 'Mike Ross', 101, 75000.00, 1),
(4, 'Rachel Zane', 102, 52000.00, NULL),
(5, 'Harvey Specter', 102, 120000.00, 4);


SELECT * 
FROM Student s
INNER JOIN Department d ON s.DepartmentID = d.DepartmentID;


SELECT s.StudentName, d.DepartmentName 
FROM Student s
INNER JOIN Department d ON s.DepartmentID = d.DepartmentID;


SELECT e.EmployeeName, d.DepartmentName 
FROM Employee e
INNER JOIN Department d ON e.DepartmentID = d.DepartmentID;


SELECT s.StudentName, c.CourseName 
FROM Student s
INNER JOIN Course c ON s.CourseID = c.CourseID;


SELECT s.StudentName, d.DepartmentName 
FROM Student s
INNER JOIN Department d ON s.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';


SELECT * 
FROM Student s
LEFT JOIN Department d ON s.DepartmentID = d.DepartmentID;


SELECT s.StudentID, s.StudentName, d.DepartmentName 
FROM Student s
LEFT JOIN Department d ON s.DepartmentID = d.DepartmentID;


SELECT * 
FROM Student s
RIGHT JOIN Department d ON s.DepartmentID = d.DepartmentID;

-- 9. Display all departments, including departments having no students
SELECT d.DepartmentID, d.DepartmentName, s.StudentName 
FROM Department d
LEFT JOIN Student s ON d.DepartmentID = s.DepartmentID;


SELECT s.StudentID, s.StudentName 
FROM Student s
LEFT JOIN Department d ON s.DepartmentID = d.DepartmentID
WHERE s.DepartmentID IS NULL;

SELECT d.DepartmentID, d.DepartmentName 
FROM Department d
LEFT JOIN Student s ON d.DepartmentID = s.DepartmentID
WHERE s.StudentID IS NULL;


SELECT s.StudentID, s.StudentName, d.DepartmentName 
FROM Student s
LEFT JOIN Department d ON s.DepartmentID = d.DepartmentID
UNION
SELECT s.StudentID, s.StudentName, d.DepartmentName 
FROM Student s
RIGHT JOIN Department d ON s.DepartmentID = d.DepartmentID;

SELECT s.StudentName, c.CourseName 
FROM Student s
CROSS JOIN Course c;

SELECT COUNT(*) AS PossibleCombinations 
FROM Student s
CROSS JOIN Course c;

SELECT s.StudentName, d.DepartmentName 
FROM Student s
NATURAL JOIN Department d;


SELECT s.StudentName, d.DepartmentName 
FROM Student s
INNER JOIN Department d ON s.DepartmentID = d.DepartmentID;

SELECT e.EmployeeName AS Employee, m.EmployeeName AS Manager
FROM Employee e
INNER JOIN Employee m ON e.ManagerID = m.EmployeeID;

SELECT e.EmployeeName AS Employee, COALESCE(m.EmployeeName, 'No Manager') AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.ManagerID = m.EmployeeID;


SELECT * 
FROM Student s
INNER JOIN Department d ON s.DepartmentID = d.DepartmentID
INNER JOIN Course c ON s.CourseID = c.CourseID;


SELECT s.StudentName, c.CourseName, d.DepartmentName 
FROM Student s
INNER JOIN Department d ON s.DepartmentID = d.DepartmentID
INNER JOIN Course c ON s.CourseID = c.CourseID;


SELECT e.EmployeeName, e.DepartmentID, e.Salary 
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(Salary) 
    FROM Employee 
    WHERE DepartmentID = e.DepartmentID
);


SELECT d.DepartmentName, COUNT(s.StudentID) AS StudentCount 
FROM Department d
INNER JOIN Student s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY StudentCount DESC
LIMIT 1;

SELECT d.DepartmentName, COUNT(s.StudentID) AS TotalStudents 
FROM Department d
LEFT JOIN Student s ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

SELECT c.CourseName, COUNT(s.StudentID) AS EnrolledStudents 
FROM Course c
LEFT JOIN Student s ON c.CourseID = s.CourseID
GROUP BY c.CourseID, c.CourseName;

SELECT 
    d.DepartmentName,
    COUNT(DISTINCT s.StudentID) AS TotalStudents,
    COUNT(DISTINCT c.CourseID) AS TotalCoursesOffered
FROM Department d
LEFT JOIN Student s ON d.DepartmentID = s.DepartmentID
LEFT JOIN Course c ON d.DepartmentID = c.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;