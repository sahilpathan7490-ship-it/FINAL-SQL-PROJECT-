CREATE DATABASE FINAL_PROJECT;
USE FINAL_PROJECT;
-- --------------------------------------------------
-- --------------------------------------------------
--  STUDENTS TABLE--
CREATE TABLE Students(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
BirthDate DATE,
EnrollmentDate DATE);

INSERT INTO Students VALUES
(1,'John','Doe','john@email.com','2000-01-15','2022-08-01'),(2,'Jane','Smith','jane@email.com','1999-05-25','2021-08-01'),(3,'Mike','Brown','mike@email.com','2001-03-12','2023-01-10'),
(4,'Sarah','Wilson','sarah@email.com','2002-06-20','2024-01-15'),(5,'David','Miller','david@email.com','2001-02-14','2022-09-01'),(6,'Emma','Taylor','emma@email.com','2000-11-10','2021-07-15'),
(7,'Chris','Anderson','chris@email.com','1998-08-18','2020-08-01'),(8,'Sophia','Thomas','sophia@email.com','2001-09-09','2023-08-01'),(9,'Daniel','Moore','daniel@email.com','1999-12-22','2022-01-10'),
(10,'Olivia','Martin','olivia@email.com','2002-04-11','2024-02-01'),(11,'James','Jackson','james@email.com','2000-06-16','2021-08-01'),(12,'Ava','White','ava@email.com','2001-01-30','2023-06-01'),
(13,'Noah','Harris','noah@email.com','1999-10-12','2022-07-01'),(14,'Mia','Clark','mia@email.com','2002-03-25','2024-03-15'),(15,'Liam','Lewis','liam@email.com','2001-05-08','2023-09-01');
-- -------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------
--   courses table
CREATE TABLE Courses(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100),
DepartmentID INT,
Credits INT,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));
INSERT INTO Courses VALUES
(101,'Introduction to SQL',1,3),(102,'Data Structures',1,4),(103,'DBMS',1,4),(104,'Operating Systems',1,4),(105,'Computer Networks',1,3),(106,'Calculus',2,4),
(107,'Linear Algebra',2,3),(108,'Statistics',2,4),(109,'Quantum Physics',3,4),(110,'Mechanics',3,3),(111,'Organic Chemistry',4,4),(112,'Physical Chemistry',4,3),
(113,'Thermodynamics',5,4),(114,'Machine Design',5,4),(115,'Engineering Graphics',5,3);
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
--  instructor table 
CREATE TABLE Instructors(
InstructorID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
DepartmentID INT,
Salary DECIMAL(10,2),
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));

INSERT INTO Instructors VALUES
(1,'Alice','Johnson','alice@univ.com',1,80000),(2,'Bob','Lee','bob@univ.com',2,75000),(3,'Mark','Hall','mark@univ.com',3,72000),
(4,'Nancy','Young','nancy@univ.com',4,71000),(5,'Kevin','King','kevin@univ.com',5,78000),(6,'Laura','Scott','laura@univ.com',1,83000),
(7,'Ryan','Green','ryan@univ.com',2,76000),(8,'Grace','Adams','grace@univ.com',3,74000),(9,'Henry','Baker','henry@univ.com',4,70000),
(10,'Ella','Nelson','ella@univ.com',5,79000),(11,'Jack','Carter','jack@univ.com',1,85000),(12,'Chloe','Mitchell','chloe@univ.com',2,77000),
(13,'Luke','Perez','luke@univ.com',3,73000),(14,'Zoe','Roberts','zoe@univ.com',4,72000),(15,'Leo','Turner','leo@univ.com',5,80000);
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- enrollments table 
CREATE TABLE Enrollments(
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollmentDate DATE,
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
FOREIGN KEY(CourseID) REFERENCES Courses(CourseID));

INSERT INTO Enrollments VALUES
(1,1,101,'2022-08-01'),(2,2,102,'2021-08-01'),(3,3,103,'2023-01-10'),(4,4,104,'2024-01-15'),(5,5,105,'2022-09-01'),
(6,6,106,'2021-07-15'),(7,7,107,'2020-08-01'),(8,8,108,'2023-08-01'),(9,9,109,'2022-01-10'),(10,10,110,'2024-02-01'),
(11,11,111,'2021-08-01'),(12,12,112,'2023-06-01'),(13,13,113,'2022-07-01'),(14,14,114,'2024-03-15'),(15,15,115,'2023-09-01');
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
--  department table

CREATE TABLE Departments(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(100));

INSERT INTO Departments VALUES
(1,'Computer Science'),
(2,'Mathematics'),
(3,'Physics'),
(4,'Chemistry'),
(5,'Mechanical Engineering');
-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------

-- 1 Create ,read, update ,delete ON ALL TABLES
SELECT * FROM STUDENTS;
INSERT INTO Students VALUES(16,'Alex','Roy','alex@email.com','2002-01-01','2024-06-01');
UPDATE Students SET Email='john_new@email.com' WHERE StudentID=1;
DELETE FROM Students WHERE StudentID=16;
------------------------------------------------------------------------------------
SELECT * FROM COURSES;
INSERT INTO COURSES VALUES (16,'Mechanics',3,3);
UPDATE COURSES SET CREDITS =5 WHERE CourseID = 116;
delete from courses where CourseID = 116;
----------------------------------------------------------------------------------------
SELECT * FROM Instructors;
insert into Instructors VALUES (16,'AMIN','MEMAN','AMIN@GMAIL.COM',4,'90000');
UPDATE INSTRUCTORS SET SALARY =100000 WHERE InstructorID = 16;
DELETE FROM INSTRUCTORS WHERE INSTRUCTORID =16;
----------------------------------------------------------------
SELECT * FROM  Enrollments;
INSERT INTO Enrollments VALUES (16,16,16,'2025-10-10');
UPDATE Enrollments SET EnrollmentID =20 WHERE EnrollmentID = 16;
delete from Enrollments where EnrollmentID = 20;
---------------------------------------------------------------------------------------------
SELECT * FROM Departments ;
INSERT INTO Departments VALUES (6,'statics');
UPDATE Departments SET DepartmentID =7 WHERE DepartmentID = 6;
delete from Departments where DepartmentID = 7;
---------------------------------------------------------------------------------------------------
-- 2-- retrive students who enrolle after  2022
SELECT * FROM Students
WHERE EnrollmentDate > '2022-12-31';
-- ------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------
-- 3 -- retrive courses offered by mathematics department with a limit of 5  courses 
SELECT c. *
FROM Courses c
JOIN Departments d
ON c.DepartmentID=d.DepartmentID
WHERE d.DepartmentName='Mathematics'
LIMIT 5;
-- ----------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------
-- 4 --GET THE NUMBERS OF STUDENTS ENROLLED IN EACH COURSES, FILTERING FOR  COURSES WITH MORE THAN  0 STUDENTS
SELECT CourseID,
       COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 0;
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- 5-- students who are enrolled in both introduction to  sql and data structure
SELECT StudentID
FROM Enrollments
WHERE CourseID IN (101, 102)
GROUP BY StudentID
HAVING COUNT(DISTINCT CourseID) = 2;
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- 6 -- students who are either enrolled in introduction to sql or data structure
SELECT DISTINCT StudentID
FROM Enrollments
WHERE CourseID IN(101,102);
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- 7--- calculate average numbers of credits for all courses
SELECT AVG(Credits) as AverageCredits
FROM Courses;
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- 8 -- maximum salary of instructors in computer science department
SELECT MAX(i.Salary) MaxSalary
FROM Instructors i
JOIN Departments d
ON i.DepartmentID=d.DepartmentID
WHERE d.DepartmentName='Computer Science';
-- ------------------------------------------------------------
-- ------------------------------------------------------------
 -- 9 count the numbers of students enrolled in each department
 SELECT d.DepartmentName,
COUNT(e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID=c.DepartmentID
JOIN Enrollments e ON c.CourseID=e.CourseID
GROUP BY d.DepartmentName;
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- 10 --INNER JOIN : RETRIVE STUDENTS AND THEIR CORRESPONDING COURSES
SELECT s.FirstName,s.LastName,c.CourseName
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID=e.StudentID
INNER JOIN Courses c
ON e.CourseID=c.CourseID;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- 11  LEFT JOIN RETRIVE STUDENTS AND THEIR CORRESPONDING COURSES IF ANY
SELECT s.FirstName,s.LastName,c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID=e.StudentID
LEFT JOIN Courses c
ON e.CourseID=c.CourseID;
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
 -- 12 FIND STUDENTS  ENROLLED IN COURSES THAT HAVE MORE THAN 10 STUDENTS
 SELECT *
FROM Students
WHERE StudentID IN(
SELECT StudentID
FROM Enrollments
WHERE CourseID IN
(SELECT CourseID
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID)>10));
-- ---------------------------------------------------------
-- ---------------------------------------------------------
-- 13 EXTRACT THE YEAR FROM THE ENROLLEMENTDATE OF STUDENTS
SELECT StudentID,
YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;
-- --------------------------------------------------------
-- --------------------------------------------------------
-- 14 -CONCACATENATE THE INSTRUCTORS FIRST AND LAST NAME
SELECT CONCAT(FirstName,' ',LastName)
AS InstructorName
FROM Instructors;
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- 15-CALCULATE THE RUNNING TOTAL OF STUDENTS ENROLLED IN COURSES
SELECT CourseID,
COUNT(StudentID) AS StudentCount,
SUM(COUNT(StudentID))
OVER(ORDER BY CourseID) RunningTotal
FROM Enrollments
GROUP BY CourseID;
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
-- 16-- LABEL STUDENTS AS 'SENIOR' OR 'JUNIOR' BASED ON THEIR ENROLLMENT YEAR
SELECT StudentID,
CASE
WHEN TIMESTAMPDIFF(YEAR,EnrollmentDate,CURDATE())>4
THEN 'Senior'
ELSE 'Junior'
END AS Status
FROM Students;
-- --------------------------------------------------------------------------------------
-- ********************************************************************************** --
-- --------------------------------------------------------------------------------------