CREATE DATABASE UniversityDB;
USE UniversityDB;
  
create table departments (
departmentid int primary key auto_increment,
departmentname varchar(100) not null);

create table students (
studentid int primary key auto_increment,
studentname varchar(100) not null,
age int not null,
departmentid int,
foreign key (departmentid) references departments(departmentid));

create table course (
courseid int primary key auto_increment,
coursename varchar(100),
studentid int,
foreign key (studentid) references  students (studentid ));

insert into departments(departmentname)values
('computer science'),
('mehanical engineering'),
('electrical engineering');

insert into students(studentname,age,departmentid)values
('virat kohli',21,1),
('yash dayal',22,2),
('rohit sharma',20,1),
('kl rahul',23,3),
('dk',21,2);


insert into course(coursename,studentid)values
('database management',1),
('operating system',2),
('Thermodynamics', 2),
('Digital Circuits', 3),
('Artificial Intelligence', 1),
('Heat Transfer', 2),
('Power Systems', 4),
('Data Structures', 3),
('Fluid Mechanics', 5),
('Machine Learning', 1);


SELECT Students.StudentID, Students.studentName, Students.Age, Departments.DepartmentName FROM Students 
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;


SELECT Students.studentName FROM Students 
JOIN Course ON Students.StudentID = Course.StudentID 
WHERE Course.CourseName = 'Artificial Intelligence';

SELECT Departments.DepartmentName, COUNT(Students.StudentID) AS StudentCount FROM Departments 
LEFT JOIN Students ON Departments.DepartmentID = Students.DepartmentID 
GROUP BY Departments.DepartmentName;

SELECT Course.CourseName FROM Course
JOIN Students ON Course.StudentID = Students.StudentID 
WHERE Students.studentName = 'virat kohli';


SELECT Students.studentName, COUNT(Course.CourseID) AS CourseCount FROM Students
JOIN Course ON Students.StudentID = Course.StudentID 
GROUP BY Students.StudentID 
HAVING CourseCount > 1;

SELECT Departments.DepartmentName, AVG(Students.Age) AS AvgAge FROM Departments 
JOIN Students ON Departments.DepartmentID = Students.DepartmentID 
GROUP BY Departments.DepartmentName;


SELECT Departments.DepartmentName FROM Departments 
JOIN Students ON Departments.DepartmentID = Students.DepartmentID 
GROUP BY Departments.DepartmentName 
ORDER BY COUNT(Students.StudentID) DESC 
LIMIT 1;


SELECT Students.studentName FROM Students 
LEFT JOIN Course ON Students.StudentID = Course.StudentID 
WHERE Course.StudentID IS NULL;

SELECT Students.studentName, COUNT(Course.CourseID) AS TotalCourse FROM Students 
LEFT JOIN Course ON Students.StudentID = Course.StudentID 
GROUP BY Students.StudentID;

SELECT Students.studentName FROM Students 
JOIN Departments ON Students.DepartmentID = Departments.DepartmentID 
JOIN Course ON Students.StudentID = Course.StudentID 
WHERE Departments.DepartmentName = 'Computer Science' 
AND Course.CourseName LIKE '%Data%';


