USE MyDatabase;

-- DML COMMANDS (INSERT, UPDATE, DELETE)

-- INSERT
/*
	Used to add new rows of data into a table.

	SYNTAX:
	INSERT INTO table_name (column1, column2, column3, ...)
	VALUES
		(value1, value2, value3, ...),
		(value1, value2, value3, ...)   -- multiple rows allowed

	If you don't specify the column names, SQL expects values
	for ALL columns in the table in their exact defined order.

	Important:
	- The number of columns must match the number of values.
	- Required (NOT NULL) columns must always receive valid data.
*/

-- Insert new data into the customers table
INSERT INTO 
	customers (id, first_name, country, score)
VALUES 
	(6, 'ibrahim', 'USA', NULL),
	(7, 'Sam', NULL, 100);

-- Insert values following the exact table column order
INSERT INTO customers
VALUES
	(8, 'SHAFIQ', 'USA', 1000);

SELECT * FROM customers;

-- Another way to insert data:
-- Insert results from a SELECT query into another table
-- (INSERT INTO ... SELECT ...)
SELECT * FROM customers;
SELECT * FROM orders;

CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
);

-- Insert data from the customers table into persons
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
	id,
	first_name AS person_name,
	NULL AS birth_date,
	'UnKnown' AS phone
FROM customers;

SELECT * FROM persons;

-- UPDATE
-- Used to modify existing rows in a table.
/*
	SYNTAX:
	UPDATE table_name
	SET column1 = value1,
	    column2 = value2
	WHERE <condition>

	Important:
	ALWAYS include a WHERE clause, or you will update every row in the table.
*/

-- SQL Task:
-- Change the score of customer with id = 6 to 800
UPDATE customers
SET score = 800
WHERE id = 6;

-- Without WHERE, this would update ALL scores to 800
/*
	UPDATE customers
	SET score = 800;
*/

-- Update score and country of the customer with id = 6
UPDATE customers
SET score = 800,
	country = 'UK'
WHERE id = 6;

SELECT *
FROM customers
WHERE id = 6;

-- Update all NULL scores to 0 (incorrect version)
UPDATE customers
SET score = 0
WHERE score = NULL;    -- This does NOT work because NULL cannot be compared with =

-- Correct version
UPDATE customers
SET score = 0
WHERE score IS NULL;

-- Update NULL countries to 'UnKnown'
UPDATE customers
SET country = 'UnKnown'
WHERE country IS NULL;

SELECT * FROM customers;

-- DELETE
-- Used to remove existing rows from a table.
/*
	SYNTAX:
	DELETE FROM table_name
	WHERE <condition>

	Important:
	Without WHERE, all rows will be deleted.
*/

-- SQL Task:
-- Delete all customers with id > 5
DELETE FROM customers
WHERE id > 5;

-- Delete all data from the persons table (faster than DELETE)
TRUNCATE TABLE persons;

SELECT *
FROM customers;
