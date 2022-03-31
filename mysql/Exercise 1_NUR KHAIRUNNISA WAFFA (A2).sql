/*Questions:*/
/*1.      Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.*/
select concat(FIRST_NAME, ' ', LAST_NAME) NAMES, SALARY from employees where SALARY not between 10000 and 15000;
/*2.      Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.*/
select EMPLOYEE_ID, concat(FIRST_NAME, ' ', LAST_NAME) NAMES, DEPARTMENT_ID from employees where DEPARTMENT_ID in (30,100) order by 1;
/*3.      Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.*/
select concat(FIRST_NAME, ' ', LAST_NAME) NAMES, SALARY from employees where SALARY not between 10000 and 15000 and DEPARTMENT_ID in (30,100) order by 1;
/*4.      Write a query to display the first_name of all employees who have both "b" and "c" in their first name.*/
select FIRST_NAME from employees where FIRST_NAME like '%b%' and FIRST_NAME like '%c%';
/*5.      Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and salary is not equal to $4,500, $10,000, or $15,000.*/
select LAST_NAME,JOB_ID,SALARY from employees where JOB_ID in (select JOB_ID from jobs where JOB_TITLE in ('Programmer','Shipping Clerk')) and SALARY not in (4500,10000,15000);
/*6.      Write a query to display the jobs/designations available in the employees table*/
select JOB_TITLE from jobs where JOB_ID in (select JOB_ID from employees);
/*7.      Write a query to find the name (first_name, last name), department ID and name of all the employees.*/
select concat(FIRST_NAME, ' ', LAST_NAME) NAMES, d.DEPARTMENT_ID,DEPARTMENT_NAME from employees e join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;
/*8.      Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).*/
select e.EMPLOYEE_ID,e.LAST_NAME, e.MANAGER_ID, m.LAST_NAME from employees e join employees m on e.MANAGER_ID = m.EMPLOYEE_ID;
/*9.      Write a query to display the first name, last name, hire date, salary of the manager for all managers whose experience is more than 15 years.*/
select concat(e.FIRST_NAME, ' ', e.LAST_NAME) NAMES, e.HIRE_DATE, e.SALARY from employees e join employees m on e.MANAGER_ID = m.EMPLOYEE_ID where year(curdate()) - year(e.HIRE_DATE) > 15;
/*10.   Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).*/
select e.EMPLOYEE_ID,e.LAST_NAME, e.MANAGER_ID, m.LAST_NAME from employees e join employees m on e.MANAGER_ID = m.EMPLOYEE_ID;
/*11.   Write a query to get the firstname, lastname who joined in the month of June.*/
select concat(FIRST_NAME, ' ', LAST_NAME) NAMES from employees where month(HIRE_DATE) = 6; 
/*12.   Write a query to get the years in which more than 10 employees joined.*/
select year(HIRE_DATE) from employees group by year(HIRE_DATE) having count(*) > 10;
/*13.   Write a query to get the department ID, year, and number of employees joined.*/
select DEPARTMENT_ID, year(HIRE_DATE), count(*) from employees group by DEPARTMENT_ID,year(HIRE_DATE) order by 1,2;
