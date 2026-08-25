SELECT 
    *
FROM
    parks_departments;
    
SELECT 
    *
FROM
    employee_demographics;
    

SELECT 
    first_name, last_name, birth_date
FROM
    employee_demographics;
    
SELECT 
    first_name, 
    last_name, 
    birth_date, 
    age, 
    (age + 10) *10
FROM
    employee_demographics; 
##PEMDAS 

SELECT DISTINCT
    first_name
FROM
    employee_demographics; 

SELECT DISTINCT
    gender
FROM
    employee_demographics; 
    
SELECT *
FROM
    employee_demographics
WHERE
    first_name = 'leslie';
    
    
SELECT *
FROM
    employee_salary
WHERE
    first_name = 'leslie';

SELECT 
    *
FROM
    employee_salary
WHERE
    salary < 50000;
    
    
SELECT 
    *
FROM
    employee_salary
WHERE
    salary >= 50000;
    
    
SELECT 
    *
FROM
    employee_demographics
WHERE
    gender !='gender';
    
    
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01';
    
###---And or not ---logical Operators

SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01'
        AND gender = 'male'
;

SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01'
        OR gender = 'male'
;    
    
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date > '1985-01-01'
        OR NOT gender = 'male'
;    

SELECT 
    *
FROM
    employee_demographics
WHERE
    (first_name = 'leslie' AND age = 44) or age > 55
;    


##--Like statement-- (% and ___)

SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE 'jer%';
    
SELECT 
    *
FROM
    employee_demographics
WHERE
    first_name LIKE 'A__';
    
    
SELECT 
    *
FROM
    employee_demographics
WHERE
    birth_date LIKE '19%';
    
##group by 

SELECT 
    gender
FROM
    employee_demographics
GROUP BY gender;


SELECT 
    gender, AVG(age)
FROM
    employee_demographics
GROUP BY gender;

SELECT 
    *
FROM
    employee_salary
;

SELECT 
    occupation, AVG(salary)
FROM
    employee_salary
GROUP BY occupation
ORDER BY AVG(salary);

SELECT 
    gender, AVG(age), Max(age), Min(age), count(age)
FROM
    employee_demographics
GROUP BY gender;

#----order by--
SELECT 
    *
FROM
    employee_demographics
ORDER BY first_name;

SELECT 
    *
FROM
    employee_demographics
ORDER BY gender, first_name DESC;

SELECT 
    *
FROM
    employee_demographics
ORDER BY gender, age DESC;

SELECT 
    *
FROM
    employee_demographics
ORDER BY 5, 4 DESC;  
##use coloum number instead of colum number (but not recommend)

##having and where

SELECT 
    occupation, AVG(salary)
FROM
    employee_salary
WHERE
    occupation LIKE '%manager'
GROUP BY occupation
HAVING AVG(salary) > 75000;

##limit and aliasing

SELECT 
    *
FROM
    employee_demographics
ORDER BY age DESC
LIMIT 4;

SELECT 
    *
FROM
    employee_demographics
ORDER BY age DESC
LIMIT 3,1;

SELECT 
    gender, AVG(age) AS avg_age
FROM
    employee_demographics
GROUP BY gender
HAVING avg_age > 40;