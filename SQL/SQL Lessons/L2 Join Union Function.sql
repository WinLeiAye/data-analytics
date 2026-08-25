use parks_and_recreation;

SELECT 
    *
FROM
    employee_demographics;


SELECT 
    *
FROM
    employee_salary;
    
SELECT 
    *
FROM
    employee_demographics
        JOIN
    employee_salary ON employee_demographics.employee_id = employee_salary.employee_id;
    
    
SELECT 
    *
FROM
    employee_salary AS sal
        JOIN
    employee_demographics AS dem ON dem.employee_id = sal.employee_id;
    
    
SELECT 
    dem.employee_id, age, occupation
FROM
    employee_salary AS sal
        JOIN
    employee_demographics AS dem ON dem.employee_id = sal.employee_id;
    
    
###outer Joins _ left , right join

SELECT 
    *
FROM
    employee_salary AS sal
        LEFT JOIN
    employee_demographics AS dem ON dem.employee_id = sal.employee_id;
    
SELECT 
    *
FROM
    employee_salary AS sal
        RIGHT OUTER JOIN
    employee_demographics AS dem ON dem.employee_id = sal.employee_id;
    
    
#self join

SELECT 
    *
FROM
    employee_salary;
    
 SELECT 
    *
FROM
    employee_salary emp1
        JOIN
    employee_salary emp2 
		ON emp1.employee_id + 1 = emp2.employee_id;   
        

SELECT 
    emp1.employee_id as emp_santa,
    emp1.first_name as first_name_santa,
    emp1.last_name as last_name_santa,
    emp2.employee_id as emp_name,
    emp2.first_name as first_name_emp,
    emp2.last_name as last_name_emp
FROM
    employee_salary emp1
        JOIN
    employee_salary emp2 
		ON emp1.employee_id + 1 = emp2.employee_id;   
        
        
##Joining multiple together

SELECT 
    *
FROM
    employee_demographics AS dem
        JOIN
    employee_salary AS sal ON dem.employee_id = sal.employee_id
        JOIN
    parks_departments pd ON sal.dept_id = pd.department_id;
    

###Union
SELECT 
    first_name, last_name
FROM
    employee_demographics 
UNION 
SELECT 
    first_name, last_name
FROM
    employee_salary;

SELECT 
    first_name, last_name
FROM
    employee_demographics 
UNION DISTINCT 
SELECT 
    first_name, last_name
FROM
    employee_salary;

SELECT 
    first_name, last_name
FROM
    employee_demographics 
UNION ALL 
SELECT 
    first_name, last_name
FROM
    employee_salary;
        
        
SELECT 
    first_name, last_name, 'old man' AS label
FROM
    employee_demographics
WHERE
    age > 40 and gender = 'male'
Union
SELECT 
    first_name, last_name, 'old woman' AS label
FROM
    employee_demographics
WHERE
    age > 40 and gender = 'female'
Union
SELECT 
    first_name, last_name, 'High paid employee' AS label
FROM
    employee_salary
WHERE
    salary > 70000 
order by first_name, last_name;


###string functions
SELECT LENGTH('skyfall');


SELECT 
    *
FROM
    employee_demographics;
    
SELECT 
    first_name, LENGTH(first_name)
FROM
    employee_demographics
ORDER BY 2
;

SELECT UPPER('sky');
SELECT LOWER('SKY');



SELECT 
    first_name, LOWER(first_name)
FROM
    employee_demographics;
    
    
SELECT TRIM('  sky    ');
SELECT LTRIM('  sky    ');
SELECT RTRIM('  sky    ');


SELECT 
    first_name,
    LEFT(first_name, 4),
    RIGHT(first_name, 4),
    SUBSTRING(first_name, 3, 2), 
    birth_date,
    SUBSTRING(birth_date, 6, 2)
FROM
    employee_demographics;
    
    
SELECT 
    first_name, REPLACE(first_name, 'a', 'z')
FROM
    employee_demographics;
    
SELECT Locate('X','Alexander'); 

SELECT Locate('W','WINLWI'); 


SELECT 
    first_name, Locate('An', first_name)
FROM
    employee_demographics;
    
    
SELECT 
    first_name, last_name, 
    concat(first_name, ' ', last_name) as full_name
FROM
    employee_demographics;
    
SELECT 
    first_name,
    last_name,
    age,
    CASE
        WHEN age <= 30 THEN 'Young'
    END
FROM
    employee_demographics;


SELECT 
    first_name,
    last_name,
    age,
    CASE
        WHEN age <= 30 THEN 'Young'
        WHEN age BETWEEN 31 AND 50 THEN 'old'
        WHEN age >= 60 THEN "on death's door"
    END as age_bracket
FROM
    employee_demographics;
    
##pay increase and bonus 
## < 50000 = 5%
##> 50000= 7%
##finance= 10% bonus

SELECT 
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 50000 THEN salary + (salary * 0.05)
    END AS New_salary
FROM
    employee_salary;
    
SELECT 
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 50000 THEN salary * 1.05
        WHEN salary > 50000 THEN salary * 1.07
    END AS New_salary,
    CASE
        WHEN dept_id = 6 THEN salary * 0.10
    END AS bonus
FROM
    employee_salary;
    
    
SELECT 
    *
FROM
    employee_salary;


SELECT 
    *
FROM
    employee_demographics
WHERE
    employee_id IN (SELECT 
            employee_id
        FROM
            employee_salary
        WHERE
            dept_id = 1);
            
            
SELECT 
    first_name, salary, AVG(salary)
FROM
    employee_salary
GROUP BY first_name, salary;


SELECT 
    first_name,
    salary,
    (SELECT 
            AVG(salary)
        FROM
            employee_salary)
FROM
    employee_salary
GROUP BY first_name , salary
;



SELECT 
    first_name,
    salary,
    dept_id,
    (SELECT 
            AVG(age)
        FROM
            employee_demographics)
FROM
    employee_salary;
    
    
SELECT 
		*
        FROM
            employee_demographics;
            
            
SELECT 
    AVG(max_age)
FROM
    (SELECT 
        gender,
            AVG(age) AS avg_age,
            MAX(age) AS max_age,
            MIN(age) AS min_age,
            COUNT(age) AS number_gender
    FROM
        employee_demographics
    GROUP BY gender) AS agg_table
;

SELECT 
        gender,
            AVG(age) AS avg_age,
            MAX(age) AS max_age,
            MIN(age) AS min_age,
            COUNT(age) AS number_gender
    FROM
        employee_demographics
    GROUP BY gender;
    
SELECT 
    gender, AVG(max_age)
FROM
    (SELECT 
        gender,
            AVG(age) AS avg_age,
            MAX(age) AS max_age,
            MIN(age) AS min_age,
            COUNT(age) AS number_gender
    FROM
        employee_demographics
    GROUP BY gender) AS agg_table
GROUP BY gender;
    
SELECT 
    occupation, AVG(avg_salary)
FROM
    (SELECT 
        occupation,
            AVG(salary) AS avg_salary,
            COUNT(dept_id) AS dept_Num
    FROM
        employee_salary
    GROUP BY occupation) AS avg_salary_occu
GROUP BY occupation;

SELECT 
    occupation, AVG(avg_salary)
FROM
    (SELECT 
            AVG(salary) AS avg_salary
    FROM
        employee_salary
    GROUP BY occupation) AS avg_salary_occu
GROUP BY occupation;


SELECT 
    occupation,avg_salary, AVG(avg_salary)
FROM
    (SELECT 
        occupation, AVG(salary) AS avg_salary
    FROM
        employee_salary
    GROUP BY occupation) AS table_sal
GROUP BY occupation
ORDER BY avg_salary;
    
    
SELECT 
    occupation, AVG(salary) AS avg_salary
FROM
    employee_salary
GROUP BY occupation
ORDER BY avg_salary;

SELECT 
    gender, 
    max_age,
    min_age, 
    avg_age, 
    number_gender,
    AVG(max_age)
FROM
    (SELECT 
        gender,
            AVG(age) AS avg_age,
            MAX(age) AS max_age,
            MIN(age) AS min_age,
            COUNT(age) AS number_gender
    FROM
        employee_demographics
    GROUP BY gender) AS agg_table
GROUP BY gender;


SELECT 
    AVG(max_age)
FROM
    (SELECT 
        gender,
            AVG(age) AS avg_age,
            MAX(age) AS max_age,
            MIN(age) AS min_age,
            COUNT(age) AS number_gender
    FROM
        employee_demographics
    GROUP BY gender) AS agg_table;
    
    
    SELECT 
    gender, AVG(salary)
FROM
    employee_demographics dem
        JOIN
    employee_salary sal 
		ON dem.employee_id = sal.employee_id
GROUP BY gender;
    
    ##window function _ partion, 
    
      
    SELECT 
    gender, dem.first_name, dem.last_name, AVG(salary) over(partition by gender)
FROM
    employee_demographics dem
        JOIN
    employee_salary sal 
		ON dem.employee_id = sal.employee_id;
        
        
        
SELECT 
    dem.employee_id, gender, dem.first_name, dem.last_name, salary,
    sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
FROM
    employee_demographics dem
        JOIN
    employee_salary sal 
		ON dem.employee_id = sal.employee_id;
        
        
	SELECT 
    dem.employee_id, gender, dem.first_name, dem.last_name, salary,
    row_number() over()
FROM
    employee_demographics dem
        JOIN
    employee_salary sal 
		ON dem.employee_id = sal.employee_id;
        
        
        
SELECT 
    dem.employee_id, gender, dem.first_name, dem.last_name, salary,
    avg(salary) over(partition by gender order by dem.employee_id) as rolling_total
FROM
    employee_demographics dem
        JOIN
    employee_salary sal 
		ON dem.employee_id = sal.employee_id;
        
        
SELECT 
    dem.employee_id, gender, dem.first_name, dem.last_name, salary,
    Row_number() over(partition by gender)as row_num,
    Row_number() over(partition by gender order by salary desc)as row_num,
    Rank() over(partition by gender order by salary desc) as rank_num,
    Dense_Rank() over(partition by gender order by salary desc) as den_rank_num
FROM
    employee_demographics dem
        JOIN
    employee_salary sal 
		ON dem.employee_id = sal.employee_id;