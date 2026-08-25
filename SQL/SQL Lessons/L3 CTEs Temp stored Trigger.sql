use parks_and_recreation;
##CTEs 

with cte_example as 
(
Select gender, 
Avg(salary) as avg_sal, 
max(salary) max_sal, 
min(salary) min_sal,
count(salary) count_sal
from employee_demographics dem
Join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
Select *
From cte_example
;


with cte_example as 
(
Select gender, 
Avg(salary) as avg_sal, 
max(salary) max_sal, 
min(salary) min_sal,
count(salary) count_sal
from employee_demographics dem
Join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
Select avg(avg_sal)
From cte_example
;


SELECT 
    AVG(avg_sal)
FROM
    (SELECT 
        gender,
            AVG(salary) AS avg_sal,
            MAX(salary) max_sal,
            MIN(salary) min_sal,
            COUNT(salary) count_sal
    FROM
        employee_demographics dem
    JOIN employee_salary sal ON dem.employee_id = sal.employee_id
    GROUP BY gender) AS example_subquery; 
## same result example_subquery, example cte

with cte_birth_date as
(
select employee_id, gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
cte_salary as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select * 
from cte_birth_date
join cte_salary
on cte_birth_date.employee_id = cte_salary.employee_id;



with cte_example (Gender, AVG_SAL,MAX_SAL, MIN_SAL, COUNT_SAL) as 
(
Select gender, 
Avg(salary) as avg_sal, 
max(salary) max_sal, 
min(salary) min_sal,
count(salary) count_sal
from employee_demographics dem
Join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
Select *
From cte_example
;
##OVER WRITE ALL THE AS


###TEMPORARY TABLES

CREATE TEMPORARY TABLE temp_table
(first_name varchar (50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT 
    *
FROM
    temp_table;

insert into temp_table
values('alex', 'freberg','Lord of the Rings; The Two Towers');


SELECT 
    *
FROM
    temp_table;

SELECT 
    UPPER(first_name)
FROM
    temp_table;
    
    
SELECT 
    *
FROM
    employee_salary
    ;
Create Temporary Table salary_over_50K    
Select *
from employee_salary
where salary >=50000;

SELECT 
    *
FROM
    salary_over_50K;
    
    
##stored procedures

SELECT 
    *
FROM
    employee_salary
WHERE
    salary >= 50000;
    

create procedure large_salaries()
SELECT 
    *
FROM
    employee_salary
WHERE
    salary >= 50000;
    
Call large_salaries();

Delimiter $$
Create procedure large_salary3()
Begin
	Select * 
	from employee_salary
	where salary >= 50000;
	select*
	from employee_salary
	where salary >=10000;
end $$
Delimiter ;
    
Delimiter $$
Create procedure large_salary5(p_employee_id int)
Begin
	Select salary
	from employee_salary
	where employee_id = p_employee_id;
	
end $$
Delimiter ;

call large_salary5(1);


###Triggers and events

SELECT 
    *
FROM
    employee_salary;
    
    
Delimiter $$
Create Trigger employee_insert
	after insert on employee_salary
	for each row
Begin 
	insert into employee_demographics ( employee_id,first_name, last_name)
	values(New.employee_id, New.first_name, new.Last_name);
end $$
Delimiter ;


Insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values (13,'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, Null);


SELECT 
    *
FROM
    employee_demographics;
    
    
###events 
SELECT 
    *
FROM
    employee_demographics;

Delimiter $$
Create event delete_retirees
on schedule every 30 second 
DO 
begin 
	SELECT 
    *
	FROM
    employee_demographics
    where age >= 60;
End $$
Delimiter ;


SELECT 
    *
FROM
    employee_demographics;

Delimiter $$
Create event delete_retirees
on schedule every 30 second 
DO 
Begin 
	SELECT 
    *
	FROM
    employee_demographics
    where age >= 60;
End $$
Delimiter ;

show variables;

show variables like 'event%';
