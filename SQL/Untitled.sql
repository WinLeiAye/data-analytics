use employees;

select * 
from employees
where first_name Not IN ('John', 'Mark','Jacob');

select * 
from employees 
where first_name Like (A_) ;

select *
From employees
where first_name Not Like (Mar%);

SELECT

    *

FROM

    employees

WHERE

    first_name LIKE('Mark%');
    
SELECT

    *

FROM

    employees

WHERE

    hire_date LIKE('%2000%');

SELECT

    *

FROM

    employees

WHERE

    emp_no Not LIKE('1000_');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Jack');

SELECT 
    *
FROM
    employees
WHERE
    first_name Like ('%Jack%');

SELECT 
    *
FROM
    employees
WHERE
    first_name Not Like ('%Jack%');
    
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';
    
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no BETWEEN '1004' AND '10012';
    
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

select dept_name
from departments 
where dept_no is  null ;

select *
from employees
where  hire_date >= '2000_01_01' and gender = 'F';

select *
from salaries
where salary > '150000';

use employees;
select Distinct hire_date
from employees;

select Distinct gender
from employees;

SELECT 
    COUNT(emp_no)
FROM
    employees;
    
select count(emp_no)
from dept_manager;

select distinct * 
from dept_manager;

select *
from employees
Order By hire_date DESC;


SELECT 
    first_name, COUNT(first_name) As names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;


SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary 
order by salary;

SELECT 
    gender, COUNT(gender) AS gender_count
FROM
    employees
GROUP BY gender
HAVING COUNT(gender) > 250
ORDER BY gender;

select salary, count(salary)
from salaries
where salary > 120000
group by salary;

SELECT *, AVG(salary)
FROM salaries
WHERE salary > 120000
GROUP BY emp_no
Order by emp_no;


SELECT

    *, AVG(salary)

FROM

    salaries

GROUP BY emp_no

HAVING AVG(salary) > 120000;


SELECT

    emp_no, AVG(salary)

FROM

    salaries

GROUP BY emp_no

HAVING AVG(salary) > 120000

ORDER BY emp_no;

use employees;
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY names_count DESC;

select  emp_no
from dept_emp
where from_date  > '2000-01-01'
Group by emp_no
having count(from_date) < 1 
order by emp_no desc;


SELECT

    emp_no

FROM

    dept_emp

WHERE

    from_date > '2000-01-01'

GROUP BY emp_no

HAVING COUNT(from_date) > 1

ORDER BY emp_no;


select *
from salaries; 

select * 
from dept_emp
limit 100;

select count(distinct dept_no)
from dept_emp;

select sum(salary)
from salaries
where from_date > '1997-01-01';


select min(salary)
from salaries;

select min(emp_no)
from salaries;
select max(emp_no)
from salaries;

select round (avg(salary))
from salaries;

SELECT 
    ROUND(AVG(salary),2) As AverageSal

FROM
    salaries;
    
    
select round (avg(salary),2)
from salaries
where from_date> '1997-01-01';


DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);
INSERT INTO departments_dup
   ( dept_no,
    dept_name)
    SELECT *
FROM departments;
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002'; 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');





DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES   (999904, '2017-01-01'),
		(999905, '2017-01-01'),
		(999906, '2017-01-01'),
		(999907, '2017-01-01');


DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
    

use employees;

select *
from departments_dup
Order by dept_no;

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join deparments_dup d on m.dept_no = d.dept_no
order by m.dept_no;


Drop procedure if exists emp_avg_salary_out;

Delimiter $$;
Create procedure emp_avg_salary_out(in p_emp_no Integer, out p_avg_salary Decimal (10,2))
Begin 
Select 
Avg(s.salary)
Into p_avg_salary from employees e 
join salaries s on e.emp_no = s.emp_no
where e.emp_no = p_emp_no;
end $$

delimiter ;


Delimiter $$;
create function f_emp_avg_salary(p_emp_no Integer) Returns Decimal (10,2)
Deterministic no SQL Reads SQL DATA
Begin 
Declare v_avg_salary decimal(10,2);
Select 
Avg (s.salary)
Into v_avg_salary from
employees e
Join 
salaries s on e.emp_no = s.emp_no 
where e.emp_no = p.emp_no;
Return v_avg_salary;
End$$
Delimiter; 

select f_emp_avg_salary(11300);


DELIMITER $$

CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
Deterministic no SQL Reads SQL DATA
BEGIN
                DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
                SELECT
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
                SELECT
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
                RETURN v_salary;
END$$

DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');


select 
	emp_no, 
    first_name, 
    last_name,
	Case gender
		when 'M' then 'Male'
		Else 'Female'
		End As gender
from employees;

select * 
from employees;



select 
emp_no,
first_name,
last_name,
If(gender = 'M', 'Male', 'Female') As gender
From employees;
\


select 
emp_no,
first_name,
last_name,
if (salary > 109990, 'Raise', 'Not Raise') As salaryyy_inc
from dept_manager;



SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN dm.emp_no IS NOT NULL THEN 'Manager'

        ELSE 'Employee'

    END AS is_manager

FROM

    employees e

        LEFT JOIN

    dept_manager dm ON dm.emp_no = e.emp_no

WHERE

    e.emp_no > 109990;
    
    SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN dm.emp_no IS NOT NULL THEN 'Manager'

        ELSE 'Employee'

    END AS is_manager

FROM

    employees e

         JOIN

    dept_manager dm ON dm.emp_no = e.emp_no

WHERE

    e.emp_no > 109990;
    
    SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN dm.emp_no IS NOT NULL THEN 'Manager'

        ELSE 'Employee'

    END AS is_manager

FROM

    employees e

        Left JOIN

    dept_manager dm ON dm.emp_no = e.emp_no

WHERE

    e.emp_no > 109990;


SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN max(salary) - min(salary) > 30000 then salary raise 

        ELSE 'Not raise'

    END AS salary_raise

FROM

    dept_manager dm

         JOIN

 employees e ON e.emp_no = dm.emp_no  

        JOIN  

    salaries s ON s.emp_no = dm.emp_no  

GROUP BY s.emp_no;



SELECT  

    dm.emp_no,  

    e.first_name,  

    e.last_name,  

    MAX(s.salary) - MIN(s.salary) AS salary_difference,  

    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 'Salary was NOT raised by more then $30,000') AS salary_increase  

FROM  

    dept_manager dm  

        JOIN  

    employees e ON e.emp_no = dm.emp_no  

        JOIN  

    salaries s ON s.emp_no = dm.emp_no  

GROUP BY s.emp_no;


SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'

        ELSE 'Not an employee anymore'

    END AS current_employee

FROM

    employees e

        JOIN

    dept_emp de ON de.emp_no = e.emp_no

GROUP BY de.emp_no

LIMIT 100;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 10005;
    
    SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) >= '2025-01-01' THEN 'Currently working'
        ELSE 'No longer with the company'
    END AS current_status
FROM
    employees e
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
GROUP BY e.emp_no, e.first_name, e.last_name;




