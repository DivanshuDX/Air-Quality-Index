--Creating table for Pollution table
CREATE TABLE Public."pollution"(Rank int, City varchar(100), Country varchar(100), Jan21 float, Feb21 float, Mar21 float, Apr21 float, 
								May21 float, Jun21 float, Jul21 float, Aug21 float, Sep21 float, Oct21 float, Nov21 float, Dec21 float, 
								Year_2021 float, Year_2020 float, Year_2019 float, Year_2018 float, Year_2017 float)

--Importing data into the table
COPY pollution FROM 'D:\B.A\SQL and data analysis\Final exam\pollution_edit.csv' DELIMITER ',' CSV HEADER;

--View Pollution Table
SELECT * FROM pollution

--1. Most polluted city in 2017.
SELECT rank, city, year_2017
FROM pollution
WHERE year_2017 = (SELECT MAX(year_2017) FROM pollution);

--2. Most polluted city in 2018.
SELECT rank, city, year_2018
FROM pollution
WHERE year_2018 = (SELECT MAX(year_2018) FROM pollution);

--3. Most polluted city in 2019.
SELECT rank, city, year_2019
FROM pollution
WHERE year_2019 = (SELECT MAX(year_2019) FROM pollution);

--4. Most polluted city in 2020.
SELECT rank, city, year_2020
FROM pollution
WHERE year_2020 = (SELECT MAX(year_2020) FROM pollution);

--5. Most polluted city in 2021.
SELECT rank, city, year_2021
FROM pollution
WHERE year_2021 = (SELECT MAX(year_2021) FROM pollution);

--6. Top 10 most polluted cities in last 5 years.
SELECT city, ROUND(SUM(year_2021 + year_2020 + year_2019 + year_2018 + year_2017) :: NUMERIC,2) AS total_years  
FROM pollution
group by city
ORDER BY 2 DESC
LIMIT 10;

--7. Creating criteria for most polluted cities in India in 2021, 2020, 2019, 2018, and 2017
-- 2021
SELECT city, year_2021,
CASE WHEN year_2021 >= 60.00 THEN 'HIGH'
	 WHEN year_2021 BETWEEN 30.00 AND 59.99 THEN 'MEDIUM'
	 ELSE 'LOW'
END AS Air_Quality
FROM pollution
WHERE city LIKE '%India';

-- 2020
SELECT city, year_2020,
CASE WHEN year_2020 >= 60.00 THEN 'HIGH'
	 WHEN year_2020 BETWEEN 30.00 AND 59.99 THEN 'MEDIUM'
	 ELSE 'LOW'
END AS Air_Quality
FROM pollution
WHERE city LIKE '%India';

-- 2019
SELECT city, year_2019,
CASE WHEN year_2019 >= 60.00 THEN 'HIGH'
	 WHEN year_2019 BETWEEN 30.00 AND 59.99 THEN 'MEDIUM'
	 ELSE 'LOW'
END AS Air_Quality
FROM pollution
WHERE city LIKE '%India';

-- 2018
SELECT city, year_2018,
CASE WHEN year_2018 >= 60.00 THEN 'HIGH'
	 WHEN year_2018 BETWEEN 30.00 AND 59.99 THEN 'MEDIUM'
	 ELSE 'LOW'
END AS Air_Quality
FROM pollution
WHERE city LIKE '%India';

-- 2017
SELECT city, year_2017,
CASE WHEN year_2017 >= 60.00 THEN 'HIGH'
	 WHEN year_2017 BETWEEN 30.00 AND 59.99 THEN 'MEDIUM'
	 ELSE 'LOW'
END AS Air_Quality
FROM pollution
WHERE city LIKE '%India';

--8. Top 5 most polluted countries quarterly wise in the year 2021.
-- First Quarter
SELECT country , ROUND(SUM(jan21 + feb21 + mar21) :: numeric,2) AS first_quarter   
FROM pollution
GROUP BY country
ORDER BY 2 DESC
LIMIT 5;

-- Second Quarter
SELECT country , ROUND(SUM(apr21 + may21 + jun21) :: numeric,2) AS second_quarter   
FROM pollution
GROUP BY country
ORDER BY 2 DESC
LIMIT 5;

-- Thrid Quarter
SELECT country , ROUND(SUM(jul21 + aug21 + sep21) :: numeric,2) AS third_quarter   
FROM pollution
GROUP BY country
ORDER BY 2 DESC
LIMIT 5;

-- Forth Quarter
SELECT country , ROUND(SUM(oct21 + nov21 + dec21) :: numeric,2) AS forth_quarter   
FROM pollution
GROUP BY country
ORDER BY 2 DESC
LIMIT 5;

--9. Creating criteria for most cleanest country in 2021, 2020, 2019, 2018, and 2017.

-- 2021
SELECT country, ROUND(SUM(year_2021) :: NUMERIC,2) AS total_2021,
CASE WHEN ROUND(SUM(year_2021) :: NUMERIC,2) >= 1000.00 THEN 'MOST'
	 WHEN ROUND(SUM(year_2021) :: NUMERIC,2) BETWEEN 100.00 and 999.99 THEN 'MEDIUM'
	 ELSE 'LOWEST'
END AS cleanest_band
FROM pollution
WHERE year_2021 <> 0
GROUP BY 1;

-- 2020
SELECT country, ROUND(SUM(year_2020) :: NUMERIC,2) AS total_2020,
CASE WHEN ROUND(SUM(year_2020) :: NUMERIC,2) >= 1000.00 THEN 'MOST'
	 WHEN ROUND(SUM(year_2020) :: NUMERIC,2) BETWEEN 100.00 and 999.99 THEN 'MEDIUM'
	 ELSE 'LOWEST'
END AS cleanest_band
FROM pollution
WHERE year_2020 <> 0
GROUP BY 1;

-- 2019
SELECT country, ROUND(SUM(year_2019) :: NUMERIC,2) AS total_2019,
CASE WHEN ROUND(SUM(year_2019) :: NUMERIC,2) >= 1000.00 THEN 'MOST'
	 WHEN ROUND(SUM(year_2019) :: NUMERIC,2) BETWEEN 100.00 and 999.99 THEN 'MEDIUM'
	 ELSE 'LOWEST'
END AS cleanest_band
FROM pollution
WHERE year_2019 <> 0
GROUP BY 1;

-- 2018
SELECT country, ROUND(SUM(year_2018) :: NUMERIC,2) AS total_2018,
CASE WHEN ROUND(SUM(year_2018) :: NUMERIC,2) >= 1000.00 THEN 'MOST'
	 WHEN ROUND(SUM(year_2018) :: NUMERIC,2) BETWEEN 100.00 and 999.99 THEN 'MEDIUM'
	 ELSE 'LOWEST'
END AS cleanest_band
FROM pollution
WHERE year_2018 <> 0
GROUP BY 1;

-- 2017
SELECT country, ROUND(SUM(year_2017) :: NUMERIC,2) AS total_2017,
CASE WHEN ROUND(SUM(year_2017) :: NUMERIC,2) >= 1000.00 THEN 'MOST'
	 WHEN ROUND(SUM(year_2017) :: NUMERIC,2) BETWEEN 100.00 and 999.99 THEN 'MEDIUM'
	 ELSE 'LOWEST'
END AS cleanest_band
FROM pollution
WHERE year_2017 <> 0
GROUP BY 1;

--------- THE END ----------