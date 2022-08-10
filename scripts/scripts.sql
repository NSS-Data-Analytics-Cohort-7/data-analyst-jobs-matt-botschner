/* multiline comment
Uses these
Symbols*/

--single line comments like this

/*1)How many rows are in the data_analyst_jobs table?*/
SELECT count(*)
From data_analyst_jobs;
--1) 1793

/*2)Write a query to look at just the first 10 rows. 
What company is associated with the job posting on the 10th row?*/
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--2)ExxonMobil

/*3)How many postings are in Tennessee? 
How many are there in either Tennessee or Kentucky?*/
SELECT count(location)
FROM data_analyst_jobs
WHERE location = 'TN';

--3) TN = 21

SELECT count(location)
FROM data_analyst_jobs
WHERE location = 'KY'
    OR location = 'TN';

-- KY or TN=27

/*4)How many postings in Tennessee have a star rating above 4?*/
SELECT count(location)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;
--4) 3

/*5)How many postings in the dataset have a review count between 500 and 1000?*/
SELECT count(*)
FROM data_analyst_jobs
WHERE review_count >= 500
AND review_count <=1000;
--5)151

/*6)Show the average star rating for companies in each state. 
    The output should show the state as state 
    and the average rating for the state as avg_rating. 
    Which state shows the highest average rating?*/
SELECT location, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
--6) New Englend

/*7)Select unique job titles from the data_analyst_jobs table. How many are there?*/
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;
--7)881

/*8)How many unique job titles are there for California companies?*/
SELECT COUNT(DISTINCT (title))
FROM data_analyst_jobs
WHERE location = 'CA';
--8)230

/*9)Find the name of each company and its average star rating for all companies 
    that have more than 5000 reviews across all locations. 
    How many companies are there with more that 5000 reviews across all locations?*/
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
Group by company;
--9) 41

/*10)Add the code to order the query in #9 from highest to lowest average star rating. 
    Which company with more than 5000 reviews across all locations in the dataset 
    has the highest star rating? What is that rating?*/
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
Group by company
ORDER BY avg_rating DESC;
--10) General Motors, Unilever, Microsoft, Nike, American Express
 --Kaiser Permanente tied at 4.1999998090000000

/*11)Find all the job titles that contain the word ‘Analyst’. 
    How many different job titles are there?*/
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILike '%Analyst%';
--11)774

/*12)How many different job titles do not contain either 
    the word ‘Analyst’ or the word ‘Analytics’? 
    What word do these positions have in common?*/
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' 
AND title NOT ILIKE '%Analytics%';
--12) 4, Tableau

/* Bonus) You want to understand which jobs requiring SQL are hard to fill. 
    Find the number of jobs by industry (domain) that require SQL and have been 
    posted longer than 3 weeks.
        Disregard any postings where the domain is NULL.
        Order your results so that the domain with the greatest number of 
        hard to fill jobs is at the top.
        Which three industries are in the top 4 on this list? 
        How many jobs have been listed for more than 3 weeks for each of the top 4?*/
SELECT title, days_since_posting, domain 
FROM data_analyst_jobs
WHERE days_since_posting > 21
AND domain IS NOT null
GROUP BY title, days_since_posting, domain
ORDER BY days_since_posting desc, domain;
--Bonus) Aerospace and Defense 9
--Agriculture and Extraction 1
--Auto 5
--Banks and Financial Services 39













