USE MyDatabase;

/* ------------------------------------
   SELECT Basics
------------------------------------ */

-- Get all customers
SELECT *
FROM customers;

-- Select specific columns with aliases
SELECT
	first_name AS CustomerName,
	country AS CustomerCountry,
	score AS CustomerScore
FROM customers;

-- Score not equal to 0
SELECT *
FROM customers
WHERE score <> 0;

-- Customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Only name + country for Germany
SELECT first_name, country
FROM customers
WHERE country = 'Germany';

/* ------------------------------------
   ORDER BY (Sorting)
------------------------------------ */

-- Highest score first
SELECT *
FROM customers
ORDER BY score DESC;

-- Names Z → A
SELECT *
FROM customers
ORDER BY first_name DESC;

-- Score ascending
SELECT *
FROM customers
ORDER BY score;

-- Score > 350 sorted by score DESC
SELECT *
FROM customers
WHERE score > 350
ORDER BY score DESC;

/* Sort by multiple columns */
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

SELECT *
FROM customers
ORDER BY score DESC, country ASC;

/* ------------------------------------
   GROUP BY (Aggregations)
------------------------------------ */

-- Sum score per (country + name)
SELECT
	country,
	first_name,
	SUM(score) AS total_score
FROM customers
GROUP BY country, first_name;

-- Total score per country
SELECT
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country;

-- Avg score per country
SELECT country, AVG(score)
FROM customers
GROUP BY country;

-- Avg score sorted
SELECT country, AVG(score) AS avg_score
FROM customers
GROUP BY country
ORDER BY avg_score DESC, country ASC;

-- Max score per country
SELECT country, MAX(score)
FROM customers
GROUP BY country;

-- Max score sorted
SELECT
	country,
	MAX(score) AS highest_score
FROM customers
GROUP BY country
ORDER BY highest_score DESC, country ASC;

-- Min score per country
SELECT
	country,
	MIN(score) AS lowest_score
FROM customers
GROUP BY country
ORDER BY lowest_score DESC, country ASC;

-- Count customers per country
SELECT
	country,
	COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC, country ASC;

-- Total customers + total score per country
SELECT
	country,
	COUNT(*) AS total_customers,
	SUM(score) AS total_score
FROM customers
GROUP BY country
ORDER BY total_customers DESC, total_score DESC, country ASC;

/* Max absolute score per country */
SELECT
	country,
	COUNT(*) AS total_customers,
	MAX(ABS(score)) AS max_abs_score
FROM customers
GROUP BY country
ORDER BY max_abs_score DESC, total_customers DESC, country ASC;

/* Countries sorted by name length */
SELECT TOP 1
	country,
	LEN(country) AS len
FROM customers
ORDER BY LEN(country) DESC;

-- Same logic using a subquery
SELECT
	country,
	LEN(country) AS len
FROM customers
WHERE LEN(country) = (
	SELECT MAX(LEN(country))
FROM customers
);

/* ------------------------------------
   HAVING (Filter After Aggregation)
------------------------------------ */

-- WHERE filters before GROUP BY  
-- HAVING filters after GROUP BY
SELECT
	country,
	SUM(score) AS total_score
FROM customers
WHERE score > 400
GROUP BY country
HAVING SUM(score) > 800
ORDER BY total_score DESC, country ASC;

-- HAVING only
SELECT
	country,
	SUM(score) AS total_score
FROM customers
GROUP BY country
HAVING SUM(score) > 800
ORDER BY total_score DESC, country ASC;

-- Avg score > 430, ignoring zero scores
SELECT
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score <> 0
GROUP BY country
HAVING AVG(score) > 430
ORDER BY avg_score DESC, country ASC;

/* ------------------------------------
   DISTINCT (Remove duplicates)
------------------------------------ */

-- Distinct countries in uppercase
SELECT DISTINCT UPPER(country)
FROM customers;

-- Distinct countries lowercase
SELECT DISTINCT LOWER(country)
FROM customers;

-- Distinct concatenated text
SELECT DISTINCT
	CONCAT(first_name, ' ', country) AS combined
FROM customers
ORDER BY combined DESC;

/* ------------------------------------
   TOP (Limit Rows)
------------------------------------ */

SELECT TOP 3
	*
FROM customers;

SELECT TOP 3
	id, country
FROM customers;

SELECT TOP 3
	id, first_name, country, score
FROM customers;

SELECT DISTINCT TOP 3
	*
FROM customers;

-- Top 3 highest scores
SELECT DISTINCT TOP 3
	*
FROM customers
ORDER BY score DESC;

-- Lowest 3 scores
SELECT DISTINCT TOP 3
	*
FROM customers
ORDER BY score ASC;

/* Orders table */
SELECT TOP 2
	*
FROM orders
ORDER BY order_date DESC;

/* ------------------------------------
   SQL Coding Order (How you write it)
---------------------------------------

1. SELECT        -- choose columns
2. DISTINCT      -- remove duplicates
3. TOP           -- limit rows
4. Aggregate     -- SUM(), AVG(), MAX()...
5. FROM          -- choose table
6. WHERE         -- filter rows (before grouping)
7. GROUP BY      -- group rows
8. HAVING        -- filter groups (after grouping)
9. ORDER BY      -- sort results
--------------------------------------- */

/* ------------------------------------
   	SQL Execution Order (How SQL runs it)
---------------------------------------

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. TOP
--------------------------------------- */

