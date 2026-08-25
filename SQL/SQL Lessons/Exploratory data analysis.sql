##Exploratory data analysis

SELECT 
    *
FROM
    layoffs3;

SELECT 
    Max(total_laid_off), Max(percentage_laid_off)
FROM
    layoffs3;
    
SELECT 
    *
FROM
    layoffs3
WHERE
    percentage_laid_off = 1
ORDER BY total_laid_off;

SELECT 
    *
FROM
    layoffs3
WHERE
    percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
    

SELECT 
    company, SUM(total_laid_off)
FROM
    layoffs3
GROUP BY company 
Order by SUM(total_laid_off) DESC;


SELECT 
    company, MAX(`date`), MIN(`date`)
FROM
    layoffs3
GROUP BY company
ORDER BY MAX(`date`) DESC;

SELECT 
    industry, SUM(total_laid_off)
FROM
    layoffs3
GROUP BY industry 
Order by SUM(total_laid_off) DESC;   

SELECT 
    country, SUM(total_laid_off)
FROM
    layoffs3
GROUP BY country 
Order by SUM(total_laid_off) DESC;   

SELECT 
    `date`, SUM(total_laid_off)
FROM
    layoffs3
GROUP BY `date`
Order by `date` DESC;   


SELECT 
    Year(`date`), SUM(total_laid_off)
FROM
    layoffs3
GROUP BY  Year(`date`)
Order by  Year(`date`) DESC;   

SELECT 
    stage, SUM(total_laid_off)
FROM
    layoffs3
GROUP BY  stage
Order by  2 DESC;   

SELECT 
    company, SUM(percentage_laid_off)
FROM
    layoffs3
GROUP BY  company
Order by  2 DESC;   

SELECT 
    company, SUM(percentage_laid_off)
FROM
    layoffs3
GROUP BY  company
Order by  2 DESC;   


SELECT 
    company, SUM(percentage_laid_off)
FROM
    layoffs3
GROUP BY  company
Order by  2 DESC;   

SELECT 
    SUBSTRING(`date`,1,7) AS `month`, SUM(total_laid_off)
FROM
    layoffs3
WHERE
    `date` IS NOT NULL
GROUP BY `month`
ORDER BY `month`;

SELECT 
    *
FROM
    layoffs3;
    
with Rolling_total As 
(SELECT 
    SUBSTRING(`date`,1,7) AS `month`, SUM(total_laid_off) as total_off
FROM
    layoffs3
WHERE
    SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `month`
ORDER BY `month`)
SELECT `month`, total_off,
sum(total_off) over (order by `month`) as rolling_total
FROM Rolling_total;


SELECT 
    company, YEAR(`date`), SUM(total_laid_off)
FROM
    layoffs3
GROUP BY company , YEAR(`date`)
ORDER BY company;


SELECT 
    company, YEAR(`date`), SUM(total_laid_off)
FROM
    layoffs3
GROUP BY company , YEAR(`date`)
ORDER BY 3 DESC;

with company_year (company, years, total_laid_off) as
(SELECT 
    company, YEAR(`date`), SUM(total_laid_off)
FROM
    layoffs3
GROUP BY company , YEAR(`date`))
select *, dense_rank() over (partition by years order by total_laid_off desc) as Ranking
from company_year
where years is not null
order by Ranking Asc;



with company_year (company, years, total_laid_off) as
(SELECT 
    company, YEAR(`date`), SUM(total_laid_off)
FROM
    layoffs3
GROUP BY company , YEAR(`date`)), 
Company_year_rank as
(select *, dense_rank() over (partition by years order by total_laid_off desc) as Ranking
from company_year
where years is not null)
Select * 
from Company_year_rank 
where ranking <= 5;





