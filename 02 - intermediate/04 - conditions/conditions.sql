USE MyDatabase;

/* ---- WHERE OPERATORS ---- */
/*
	A- COMPARISON OPERATORS (compare two values)
		1- =      Equal
		2- <> / != Not equal
		3- >      Greater than
		4- >=     Greater than or equal
		5- <      Less than
		6- <=     Less than or equal

	B- LOGICAL OPERATORS (combine multiple conditions)
		1- AND
		2- OR
		3- NOT

	C- RANGE OPERATOR (check if a value is inside a range)
		1- BETWEEN

	D- MEMBERSHIP OPERATORS (check if a value exists in a list)
		1- IN
		2- NOT IN

	E- SEARCH OPERATOR (search for patterns inside text)
		1- LIKE
*/

-- COMPARISON OPERATORS
-- Comparing two expressions
-- Syntax:
--  [expression] [operator] [expression]
-- Examples:
--  first_name = last_name
--  first_name = 'IBRAHIM'
--  UPPER(first_name) = 'IBRAHIM'
--  price * quantity = 1000
--  (SELECT AVG(salary) FROM orders) = 1000

-- SQL TASK: Using the EQUAL operator
-- Retrieve all customers from Germany
SELECT *
FROM customers
WHERE LOWER(country) = 'germany'; -- Must match stored value exactly

-- SQL TASK: Using NOT EQUAL ( != or <> )
-- Customers NOT from Germany
SELECT *
FROM customers
WHERE LOWER(country) != 'germany';

SELECT *
FROM customers
WHERE LOWER(country) <> 'germany';

-- SQL TASK: GREATER THAN ( > )
-- Customers with score > 500
SELECT *
FROM customers
WHERE score > 500;

-- SQL TASK: GREATER THAN OR EQUAL ( >= )
-- Customers with score >= 500
SELECT *
FROM customers
WHERE score >= 500;

-- SQL TASK: LESS THAN ( < )
-- Customers with score < 500
SELECT *
FROM customers
WHERE score < 500;

-- SQL TASK: LESS THAN OR EQUAL ( <= )
-- Customers with score <= 500
SELECT *
FROM customers
WHERE score <= 500;

-- LOGICAL OPERATORS

-- AND operator → both conditions must be true
/*
	SYNTAX:
	WHERE condition1 AND condition2
*/

-- SQL TASK: Using AND
-- Customers from USA AND score > 500
SELECT *
FROM customers
WHERE LOWER(country) = 'usa' AND score > 500;

-- OR operator → at least one condition must be true
-- SQL TASK: Using OR
SELECT *
FROM customers
WHERE LOWER(country) = 'usa' OR score > 500;

-- NOT operator → negates a condition
-- SQL TASK: Using NOT
-- Customers not from USA
SELECT *
FROM customers
WHERE NOT country = 'USA';

/* Example Output:
	-------------------------------------
	| id | first_name | country | score |
	|------------------------------------|
	| 1  | Maria      | Germany | 350   |
	| 3  | Georg      | UK      | 750   |
	| 4  | Martin     | Germany | 500   |
	-------------------------------------
*/

-- Using NOT + AND
SELECT *
FROM customers
WHERE (LOWER(country) = 'germany' AND score >= 500);

/* Output:
	-------------------------------------
	| id | first_name | country | score |
	| 4  | Martin     | Germany | 500   |
	-------------------------------------
*/

SELECT *
FROM customers
WHERE NOT (LOWER(country) = 'germany' AND score >= 500);

/* Output:
	-------------------------------------
	| id | first_name | country | score |
	| 1  | Maria      | Germany | 350   |
	| 2  | John       | USA     | 900   |
	| 3  | Georg      | UK      | 750   |
	| 5  | Peter      | USA     | 0     |
	-------------------------------------
*/

-- RANGE OPERATOR (BETWEEN)
-- BETWEEN checks if a value is inside a range (inclusive)
/*
	Lower boundary ----> Upper boundary
	100 ---------------------- 500

	TRUE for:
	- 100
	- 500
	- Any value in between

	SYNTAX:
	SELECT columns
	FROM table
	WHERE column BETWEEN start AND end;
*/

-- SQL TASK
-- Customers with score between 100 and 500
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

/* Output:
	-------------------------------------
	| id | first_name | country | score |
	| 1  | Maria      | Germany | 350   |
	| 4  | Martin     | Germany | 500   |
	-------------------------------------
*/

-- Same solution using >= AND <=
SELECT *
FROM customers
WHERE score >= 100 AND score <= 500;

-- MEMBERSHIP OPERATORS (IN, NOT IN)

-- SQL TASK
-- Customers from Germany or USA
SELECT *
FROM customers
WHERE country = 'Germany' OR country = 'USA';

-- Same using IN
SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');

-- NOT IN
SELECT *
FROM customers
WHERE country NOT IN ('Germany', 'USA');

-- SEARCH OPERATOR (LIKE)
-- LIKE is used to search for patterns
-- Pattern characters:
--  %  = any number of characters (0 or more)
--  _  = exactly one character

-- Examples:
-- 'M%'  → starts with M
-- '%M'  → ends with M
-- '%r%' → contains r anywhere

-- SQL TASK: Countries starting with G
SELECT *
FROM customers
WHERE country LIKE 'G%';

-- SQL TASK: Customers whose name ends with "in"
SELECT *
FROM customers
WHERE first_name LIKE '%in';

-- SQL TASK: Customers whose name contains 'r'
SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- USING _ (single-character wildcard)
/*
	'_ _ b %' means:
	- Any letter in position 1
	- Any letter in position 2
	- 'b' in position 3
	- Anything afterwards
*/

-- SQL TASKS USING LIKE

-- Names starting with M
SELECT *
FROM customers
WHERE first_name LIKE 'M%';

-- Names ending with n
SELECT *
FROM customers
WHERE first_name LIKE '%n';

-- Names containing r
SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- Names with 'r' in the 3rd position
SELECT *
FROM customers
WHERE first_name LIKE '__r%';
