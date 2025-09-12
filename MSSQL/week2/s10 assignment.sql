create database thor
use thor
CREATE TABLE Employees_A (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO Employees_A (EmployeeID, FirstName, LastName)
VALUES
(1, 'Clark', 'Kent'),
(2, 'Diana', 'Prince'),
(3, 'Barry', 'Allen');

CREATE TABLE Employees_B (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO Employees_B (EmployeeID, FirstName, LastName)
VALUES
(4, 'Peter', 'Parker'),
(2, 'Diana', 'Prince'), 
(5, 'Bruce', 'Wayne'),
(6, 'Bruce', 'Wayne'); 

-- Add the Department column to the Employees_A table
ALTER TABLE Employees_A ADD Department VARCHAR(50) NULL;

-- Add the Department column to the Employees_B table
ALTER TABLE Employees_B ADD Department VARCHAR(50) NULL;

UPDATE Employees_A
SET Department = CASE EmployeeID
    WHEN 1 THEN 'Marketing'
    WHEN 2 THEN 'IT'
    WHEN 3 THEN 'Finance'
END
WHERE EmployeeID IN (1, 2, 3);

UPDATE Employees_B
SET Department = CASE EmployeeID
    WHEN 4 THEN 'Sales'
    WHEN 2 THEN 'IT' -- This employee is in the IT department
    WHEN 5 THEN 'Sales'
    WHEN 6 THEN 'Sales'
END
WHERE EmployeeID IN (4, 2, 5, 6);


select * , ROW_NUMBER () over (order by salary ) as row__number
,rank()  over (order by salary ) as rank_number,
DENSE_RANK () over (order by salary ) as dense_rank_number
 from Employees

 select * from employees

 select * ,row_number () over (partition by sex order by salary )
 as popularity from employees


---Show a list of all student names (unique only).
select * from Employees_A
union 
select * from Employees_B
---Show a list of all student names (including duplicates).
select * from Employees_A
union all
select * from Employees_B

/*
Display employee names in UPPERCASE and LOWERCASE.
Find the length of each employee’s name.
Show only the first 3 letters of each name.
Replace Finance department with Accounts.
Create a new column showing "Name - Department" using CONCAT.
*/


select upper(FirstName)  from Employees_A;

select lower (FirstName)  from Employees_A;


select len(firstname) from Employees_A

select substring(firstname,1,3) from Employees_A


select replace (firstname,'clark','park') from Employees_A


select replace(Department,'Finance','IT') from Employees_A


select concat (firstname,'',department) as name_department from Employees_A



/*Date Functions (DATEDIFF, DATEADD, GETDATE, NOW)
Tasks:
Show today’s date using GETDATE().
Find the duration (in days) of each project using DATEDIFF.
Add 10 days to each project’s EndDate using DATEADD
Find how many days are left until each project ends. (Hint: Use DATEDIFF with GETDATE())
*/

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate)
VALUES
(1, 'Project Alpha', '2025-08-15', '2025-10-15'),
(2, 'Project Beta', '2025-09-01', '2025-09-11'),
(3, 'Project Gamma', '2025-09-10', '2025-11-20'),
(4, 'Project Delta', '2025-07-20', '2025-08-30');




select getdate() as cuurent_time_and_date




















/*CAST, CONVERT, CASE

Tasks:
Convert today’s date into DD/MM/YYYY format using CONVERT.

Convert a float 123.456 into an integer using CAST.

For employees (from Employees table above), categorize them:

If Dept = IT → show Tech Team

If Dept = HR → show Human Resources

Else → Other

(Hint: Use CASE expression)

*/