
CREATE DATABASE Question;
USE Question;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);


INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, 14-02-20, 'HR'),
		(002, 'Niharika', 'Verma', 80000, 14-06-11, 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, 14-02-20, 'HR'),
		(004, 'Amitabh', 'Singh', 500000, 14-02-20, 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, 14-06-11, 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, 14-06-11, 'Account'),
		(007, 'Satish', 'Kumar', 75000, 14-01-20, 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, 14-04-11, 'Admin');

select * from worker
--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as
select First_name as [Worker Name] from worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) from worker

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table
select SUBSTRING(first_name,1,3) from worker

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
--select instr(first_name,'t') from worker where first_name='Amitabh'

--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(first_name) from worker

--Q-7. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A
select replace(first_name,'a','A') from worker

--Q-8. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select CONCAT(first_name,' ',last_name) as worker_name from worker

--Q-9. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name asc, DEPARTMENT desc

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name in ('Vipul','vivek')

--Q-20. Write an SQL query to print details of the Workers who have joined in 1899.
select * from worker where year(joining_date)=1899

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from worker where department='admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select first_name from worker where SALARY >= 50000 and salary <= 100000
select first_name from worker where SALARY between 50000 and 100000

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department, count(department) as [No_of_employee] from worker group by department order by count(department) desc
select department, count(*) as [No_of_employee] from worker group by department order by [No_of_employee] desc

--Q-32. Write an SQL query to show the top n (say 10) records of a table.
select top(3) * from worker order by SALARY desc

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select top(1) * from worker where salary in (select distinct top(3) salary from worker order by salary desc) order by salary 


 --Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
 select salary from worker where 5=(select count(distinct(salary)) from worker w1 where w1.salary>=worker.salary)

 --Q-35. Write an SQL query to fetch the list of employees with the same salary.
 select distinct w.salary, w.first_name from worker as w, worker as w1 where w1.salary=w.salary and w1.FIRST_NAME<>w.FIRST_NAME

 --Q-36. Write an SQL query to show the second highest salary from a table.
 select max(salary) from worker where salary not in (select max(salary) from worker)

 --