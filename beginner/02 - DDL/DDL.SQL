USE MyDatabase;

-- DDL (DATA DEFINITION LANGUAGE)
-- Commands: CREATE, ALTER, DROP
-- CREATE: Create new tables
-- ALTER : Modify existing tables (add/remove columns, change definitions)
-- DROP  : Delete tables

-- CREATE
-- Create a table named 'persons' with the columns:
-- id, person_name, birth_date, phone
CREATE TABLE persons (
	-- Column definitions: name, data type, and constraints
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,

	-- Primary key constraint on the 'id' column
	CONSTRAINT pk_persons PRIMARY KEY (id)
);

-- ALTER
-- Add a new column 'email' to the 'persons' table
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;

-- Retrieve all columns from 'persons'
SELECT * FROM persons;

-- ALTER
-- Remove the 'email' column from the 'persons' table
ALTER TABLE persons
DROP COLUMN email;

-- Remove the 'phone' column from the 'persons' table
ALTER TABLE persons
DROP COLUMN phone;

-- Check table structure after modifications
SELECT * FROM persons;

-- DROP
-- Delete the entire 'persons' table from the database
DROP TABLE persons;
