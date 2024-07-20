--1. From dep_emp table, find out how many employees joined the company on same dates
SELECT * FROM dept_emp group by from_date Having Count(*)>1;

--2. From salary table, find out how many employees left the company on same dates? 
select to_date,count(*) from salary group by to_date having count(*)>1;

--3. From Q2 above, now can you sort the resultant records based on frequency i.e. count? What is the highest number of people who left on same date? Which date is it?
select to_date,count(*)as frequency from salary group by to_date having count(*)>1 order by frequency;

--4. Show records of employees who joined after 1990-01-01 and worked in dept_no “d005” 
SELECT * from dept_emp where from_date>"1990-01-01" and dept_no="d005";

--5. Which employees joined after 1990-01-01 and worked in dept_no “d005”. Now show records in descending order on from_date
SELECT * from dept_emp where from_date>"1990-01-01" and dept_no="d005" order by from_date Desc;

--6. How many employees’ records are available in salary table?
select count(distinct emp_no) From salary;

--7. Are there any employees who joined after 11-11-1994 with salary of 40,000 or salary more than 100,000? 
select * from salary where from_date>'1994-11-11' and (salary = '40000' or salary > '100000') group by emp_no;
--How many such employees are there in the company?
select count(*) as emplpoyee_number from salary where from_date>'1994-11-11' and (salary = '40000' or salary > '100000');

--8. Find the number of Engineers who were working at the company between 1st Jan 1990 and 1st Jan 2000 from the titles table
select count(*) From titles where title='Engineer' and (from_date>'1990-01-01' and to_date<='2000-01-01');

--9. Find the information of the employees who were hired before 1st Jan 2000 and after 1st Jan 1990 in descending order of hire date from the employee table
Select * from employee where hire_date<'2000-01-01' and hire_date>'1990-01-01' order by hire_date DESC;

--10. Find the department number with the least number of employees from the dept_emp table
select dept_no, count(*) as employee_no from dept_emp group BY dept_no Order by count(*) limit 1;

--11. Using the titles and salary tables, find the highest paying job title based on average salary (Hint: Use join)
select t.title, count(t.title) as 'No of Employee', avg(s.salary) as 'Average Salary' from titles as t
left join salary as s on t.emp_no = s.emp_no group by title order by avg(s.salary) desc limit 1;

--12. Using the departments and dept_emp tables, find the department names having at least 10 employees and the number of employees in those departments (Hint: Use join)demo
Select d.dept_name, count(e.emp_no) as 'Employee No.' From departments as d 
left join dept_emp as e on d.dept_no = e.dept_no group by d.dept_name having count(e.emp_no)>=10 order by 'Employee No.';