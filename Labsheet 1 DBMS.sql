DROP DATABASE IF EXISTS Company;
CREATE DATABASE Company;
USE Company;
CREATE TABLE Employee (ID INT AUTO_INCREMENT PRIMARY KEY, FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Email VARCHAR(100) UNIQUE);
SHOW TABLES;
DESCRIBE Employee;
Insert INTO Employee( FirstName, LastName, Department,Salary,Email )
VALUES
("Suhani","Saini", "Btech",60000, "Suhani@1234");
SELECT * FROM Employee;
ALTER TABLE Staff ADD Phonenumber VARCHAR(15);
SHOW TABLES;
DESC Staff;
ALTER TABLE Staff
MODIFY Salary DECIMAL(12,2);
ALTER TABLE Staff MODIFY Department VARCHAR(50) DEFAULT 'GENERAl';
INSERT INTO Staff(FirstName, LastName,Salary,Email )
VALUES('SONAM','RAJ',50000,'SO1234@23');
SHOW TABLEs;
DESC Staff;
INSERT INTO Staff (Firstname, LastName, Department, Salary, Email)
VALUES
('Aman', 'Kumar', 'IT', 35000, 'aman123@gmail.com'),
('Riya', 'Sharma', 'HR', 42000, 'riya123@gmail.com'),
('Rahul', 'Verma', 'Finance', 28000, 'rahul123@gmail.com'),
('Neha', 'Singh', 'Marketing', 55000, 'neha123@gmail.com'),
('Arjun', 'Gupta', 'IT', 75000, 'a123@gmail.com');
SELECT * FROM Staff;
ALTER TABLE Staff 
ADD CONSTRAINT check_salary CHECK (Salary > 20000);
DESC Staff;

DROP DATABASE IF EXISTS Company;
CREATE DATABASE Company;
USE Company;
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Description VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10,2)
);
ALTER TABLE Projects
ADD Status VARCHAR(20);
ALTER TABLE Projects
MODIFY Description VARCHAR(500);
ALTER TABLE Projects
RENAME COLUMN Status TO ProjectStatus;
ALTER TABLE Projects
DROP COLUMN ProjectStatus;
DESCRIBE Projects;