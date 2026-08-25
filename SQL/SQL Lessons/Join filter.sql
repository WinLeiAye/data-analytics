use employees;
select * from employees;

SELECT 
    dept_no
FROM
    departments;
    
    
SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' And gender = "F" ;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' or first_name = "Elvis" ;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' or first_name = "Aruna" ;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna' AND (gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
   gender = 'F' and (first_name = 'Kellie'OR first_name = 'Aruna')
   
   
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan'; 
        
 SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
    OR first_name = 'Mark'
    OR first_name = 'Nathan';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ("Denis”, “Elvis")
    



    *
FROM
    employees
WHERE
    last_name IN ("John", "Mark", or "Jacob");
    

use employees;

SELECT 
m.dept_no, m.emp_no, d.dept_name
from 
dept_manager_dup m
Inner join 
departments_dup d on m.dept_no = d. dept_no
order by m.dept_no;

select * from dept_manager_dup;

select m.emp_no, e.first_name, e.last_name,e.hire_date
from dept_manager_dup m
Inner join
employees e on m.emp_no= e.emp_no
order by m.emp_no;

SELECT 
    m.emp_no, e.first_name, e.last_name, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager_dup m ON m.emp_no = e.emp_no
ORDER BY m.emp_no;

use employees;

select e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
from employees e
left Join dept_manager d on e.emp_no=d.emp_no
where last_name = 'Markovitch'
order by d.dept_no desc, e.emp_no;


select e.emp_no, e.first_name, e.last_name, dm.dept_no,dm.from_date
from employees e, dept_manager dm
where e.emp_no = dm.emp_no
order by e.emp_no;


select e.emp_no, e.first_name, e.last_name, dm.dept_no,dm.from_date
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
order by e.emp_no;

select 
e.emp_no, e.first_name, e.last_name, s.salary
from 
employees e
	 Join
	salaries s on e.emp_no= s.emp_no
Where
s.salary > 145000;

select 
e.emp_no, e.first_name, e.last_name, s.salary
from 
employees e
	 Join
	salaries s on e.emp_no= s.emp_no
Where
s.salary >= 145000;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
select @@global.sql_mode;
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
set @@global.sql_mode := concat('ONLY_FULL_GROUP_BY,', @@global.sql_mode);

select 
e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t  on e.emp_no = t.emp_no
where first_name = ' Margareta' and last_name = 'Morkovitch'
order by e.emp_no;

SELECT

    e.first_name, e.last_name, e.hire_date, t.title

FROM

    employees e

        JOIN

    titles t ON e.emp_no = t.emp_no

WHERE

    first_name = 'Margareta'

        AND last_name = 'Markovitch'

ORDER BY e.emp_no

;   


SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
ORDER BY dm.emp_no , d.dept_no;


select dm.*,d.*
from dept_manager dm
cross Join
departments d;

select dm.*,d.*
from dept_manager dm
cross Join
departments d
where d.dept_no= 'd009'
order by d.dept_name;

SELECT

    e.*, d.*

FROM

    employees e

        CROSS JOIN

    departments d

WHERE

    e.emp_no < 10011

ORDER BY e.emp_no, d.dept_name;

select e.gender, avg(s.salary) As average_salary
from employees e
join salaries s on e.emp_no = s.emp_no
group by gender;

select 
e.first_name,
e.last_name,
e.hire_date,
m.from_date,
d.dept_name
from employees e
Join dept_manager m on e.emp_no = m.emp_no
join departments d on m.dept_no = d.dept_no;

select e.first_name, e.last_name, e.hire_date, t.title, dm.dept_no, dm.from_date
from employees e 
join titles t on e.emp_no = t.emp_no
join dept_manager dm on dm.emp_no = t.emp_no;

SELECT

    e.first_name,

    e.last_name,

    e.hire_date,

    t.title,

    m.from_date,

    d.dept_name

FROM

    employees e

        JOIN

    dept_manager m ON e.emp_no = m.emp_no

        JOIN

    departments d ON m.dept_no = d.dept_no

        JOIN

    titles t ON e.emp_no = t.emp_no

            AND m.from_date = t.from_date

ORDER BY e.emp_no;

SELECT

    e.first_name,

    e.last_name,

    e.hire_date,

    t.title,

    m.from_date,

    d.dept_name

FROM

    employees e

        JOIN

    dept_manager m ON e.emp_no = m.emp_no

        JOIN

    departments d ON m.dept_no = d.dept_no

        JOIN

    titles t ON e.emp_no = t.emp_no

WHERE t.title = 'Manager'

ORDER BY e.emp_no;

How many male and how many female managers do we have in the ‘employees’ database?

select gender, count (gender)
from employees
group by gender;

SELECT

    e.gender, COUNT(dm.emp_no)

FROM

    employees e

        JOIN

    dept_manager dm ON e.emp_no = dm.emp_no

GROUP BY gender;

SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no DESC;


use employees;

SELECT 
    e.first_name, e.last_name, e.emp_no
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);  
		
SELECT 
    *
FROM
    employees
WHERE
    '1990-01-01' <  hire_date > '1995-01-01';
    
SELECT
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            
SELECT
    *
FROM
    employees 
where emp_no in (select 
 emp_no from titles
 where title = 'Assistant Engineer';
 
 SELECT

    *

FROM

    employees e

WHERE

    EXISTS( SELECT

            *

        FROM

            titles t

        WHERE

            t.emp_no = e.emp_no

                and  title = 'Assistant Engineer' or Gender = 'M');
                
                
SELECT 
    *
FROM
    salaries s
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = s.emp_no
                AND title = 'Engineer');
                

SELECT 
    *
FROM
    titles t
WHERE
    EXISTS( SELECT 
            *
        FROM
            salaries s
        WHERE
            t.emp_no = s.emp_no
                AND title = 'Engineer');

SELECT 
    emp_no
FROM
    dept_manager
WHERE
    emp_no = 110022;
    
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emplpyees_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
Union
SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emplpyees_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    Limit 20) AS B;
    
  DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (

   emp_no INT(11) NOT NULL,

   dept_no CHAR(4) NULL,

   manager_no INT(11) NOT NULL

);  


SELECT 
    t.emp_no,
    t.title,
    (SELECT 
            ROUND(AVG(s.salary), 2)
        FROM
            salaries s
        WHERE
            s.emp_no = t.emp_no) AS avg_salary
FROM
    (SELECT 
        emp_no, title
    FROM
        titles t
    WHERE
        title = 'Staff' OR title = 'Engineer') as t
ORDER BY avg_salary DESC;

use employees;
Drop procedure if exists select_employees;
Delimiter $$;
Create procedure select_employees()
Begin  select * from employees
Limit 1000;
end $$
Delimiter ;

call employees.select_employees();


Delimiter $$;
Create Procedure average_salary()
Begin 
Select *, avg(salary)
from salaries
Limit 1000;
End $$
Delimiter ;
 

use employees;
Delimiter $$;
Create Procedure average_salary()
Begin 
Select avg(salary)
from salaries
Limit 1000;
End $$
DELIMITER; 

Select * from emplpyees $$

Delimiter;

use employees; 

use testdb;   

use 'employees';      

Drop procedure 

use employees;
