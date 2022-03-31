/*Questions:*/
/*1.      Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"*/
select FIRST_NAME "First Name", LAST_NAME "Last Name" from employees;
/*2.      Write a query to get unique department ID from employee table.*/
select distinct DEPARTMENT_ID from employees;
/*3.      Write a query to get all employee details from the employee table order by first name, descending.*/
select * from employees order by FIRST_NAME desc;
/*4.      Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).*/
select concat(FIRST_NAME,' ', LAST_NAME) NAMES, SALARY, (.15*SALARY)PF from employees;
/*5.      Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.*/
select EMPLOYEE_ID, concat(FIRST_NAME, ' ', LAST_NAME) NAMES, SALARY from employees order by salary;
/*6.      Write a query to get the total salaries payable to employees.*/
select sum(SALARY) from employees;
/*7.      Write a query to get the maximum and minimum salary from employees table.*/
select max(SALARY), min(SALARY) from employees;
/*8.      Write a query to get the average salary and number of employees in the employees table.*/
select avg(SALARY), count(*) from employees;
/*9.      Write a query to get the number of employees working with the company.*/
select count(*) from employees where EMPLOYEE_ID not in (select EMPLOYEE_ID from job_history);
/*10.   Write a query to get the number of jobs available in the employees table.*/
select count(distinct JOB_ID) from employees;
/*11.   Write a query to select first 10 records from a table.*/
select * from employees limit 10;
/*12.   Write a query to get monthly salary (round 2 decimal places) of all employee.*/
select round(SALARY,2) from employees;
/*13.   Write a query to get the maximum salary of an employee working as a Programmer.*/
select max(SALARY) from employees where JOB_ID = (select JOB_ID from jobs where JOB_TITLE = 'Programmer');
/*14.   Write a query to get the average salary and number of employees working the department 90.*/
select avg(SALARY), count(*) from employees where DEPARTMENT_ID = 90;
/*15.   Write a query to get the number of employees with the same job.*/
select JOB_ID, count(*) from employees group by JOB_ID;
/*16.   Write a query to get the difference between the highest and lowest salaries.*/
select max(SALARY) - min(SALARY) from employees;
/*17.   Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.*/
select MANAGER_ID, SALARY from employees group by MANAGER_ID having min(SALARY); #re-check
/*18.   Write a query to get the department ID and the total salary payable in each department.*/
select DEPARTMENT_ID, sum(SALARY) from employees group by DEPARTMENT_ID;
/*19.   Write a query to get the average salary for each job ID excluding programmer.*/
select JOB_ID, avg(SALARY) from employees where JOB_ID != (select JOB_ID from jobs where JOB_TITLE = 'Programmer') group by JOB_ID; 
/*20.   Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.*/
select sum(SALARY), min(SALARY), max(SALARY), avg(SALARY) from employees where DEPARTMENT_ID = 90;
/*21.   Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to 4000.*/
select JOB_ID, max(SALARY) from employees where  SALARY >= 4000 group by JOB_ID;
/*22.   Write a query to get the average salary for all departments employing more than 10 employees.*/
select avg(SALARY) from employees group by DEPARTMENT_ID having count(*) > 10;
