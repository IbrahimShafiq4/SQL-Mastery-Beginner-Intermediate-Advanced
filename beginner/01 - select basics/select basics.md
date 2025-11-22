# SQL Basics README

This README covers the fundamental SQL operations demonstrated in your queries, including selecting data, filtering, sorting, and using comments.

---

## 1. Switching Database

```sql
USE MyDatabase;
```

---

## 2. Comments in SQL

### Single-line comment:

```sql
-- This is a single-line comment
```

### Multi-line comment:

```sql
/*
   This is a multi-line comment
*/
```

---

## 3. Retrieving Data

### Retrieve all customers:

```sql
SELECT *
FROM customers;
```

### Retrieve specific columns with aliasing:

```sql
SELECT
    first_name AS CustomerName,
    country AS CustomerCountry,
    score AS CustomerScore
FROM customers;
```

---

## 4. Filtering Data (WHERE)

### Customers with score not equal to 0:

```sql
SELECT *
FROM customers c
WHERE c.score <> 0;
```

(Alternate equivalent syntax)

```sql
SELECT *
FROM customers c
WHERE c.score != 0;
```

### Customers from Germany:

```sql
SELECT *
FROM customers c
WHERE c.country LIKE 'Germany';
```

### Customers from Germany (specific columns):

```sql
SELECT
    first_name,
    country
FROM customers
WHERE country LIKE 'Germany';
```

---

## 5. Sorting Data (ORDER BY)

Sorting can be done in two ways:

* `ASC` (ascending, default)
* `DESC` (descending)

### Syntax:

```sql
SELECT *
FROM table_name
ORDER BY column_name [ASC | DESC];
```

### Sort by highest score first:

```sql
SELECT *
FROM customers
ORDER BY score DESC;
```

### Sort alphabetically by first name (Z → A):

```sql
SELECT *
FROM customers
ORDER BY first_name DESC;
```

### Sort by ascending score:

```sql
SELECT *
FROM customers
ORDER BY score ASC;
```

---

## 6. Filtering + Sorting

### Customers with score > 350 sorted by highest score:

```sql
SELECT *
FROM customers
WHERE score > 350
ORDER BY score DESC;
```

---

## 7. Sorting by Multiple Columns

The first column has the highest priority.

### Sort by country (A → Z), then by highest score:

```sql
SELECT *
FROM customers
ORDER BY
    country ASC,
    score DESC;
```

### Prioritize highest score first, then sort by country:

```sql
SELECT *
FROM customers
ORDER BY
    score DESC,
    country ASC;
```

---

## 8. Grouping Data (GROUP BY)

The `GROUP BY` clause groups rows that share the same values into summary rows. It is commonly used with aggregate functions such as:

* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* `COUNT()`

### Syntax:

```sql
SELECT 
    column,
    AGGREGATE_FUNCTION(another_column)
FROM table_name
GROUP BY column;
```

---

### Total score for each country:

```sql
SELECT 
    country,
    SUM(score)
FROM customers
GROUP BY country;
```

### Average score for each country:

```sql
SELECT
    country,
    AVG(score)
FROM customers
GROUP BY country;
```

### Average score for each country (sorted):

```sql
SELECT
    country,
    AVG(score)
FROM customers
GROUP BY country
ORDER BY AVG(score) DESC, country ASC;
```

### Highest score for each country:

```sql
SELECT
    country,
    MAX(score)
FROM customers
GROUP BY country;
```

### Highest score for each country (sorted):

```sql
SELECT
    country,
    MAX(score) AS highest_score
FROM customers
GROUP BY country
ORDER BY highest_score DESC, country ASC;
```

### Lowest score for each country (sorted):

```sql
SELECT
    country,
    MIN(score) AS lowest_score
FROM customers
GROUP BY country
ORDER BY lowest_score DESC, country ASC;
```

### Count of customers per country:

```sql
SELECT
    country,
    COUNT(score) AS counted_score
FROM customers
GROUP BY country
ORDER BY counted_score DESC, country ASC;
```

---

## 9. Query Execution Order

SQL queries have two orders:

* **Coding order** → the way you write SQL
* **Execution order** → the order SQL actually processes your query

### Coding Order (the order YOU write SQL)

```
SELECT
DISTINCT
TOP
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```

### Execution Order (the order SQL actually RUNS the query)

```
1 - FROM        (load table)
2 - WHERE       (filter rows BEFORE aggregation)
3 - GROUP BY    (group rows)
4 - HAVING      (filter rows AFTER aggregation)
5 - SELECT      (choose columns)
6 - DISTINCT    (remove duplicates)
7 - ORDER BY    (sort results)
8 - TOP         (limit rows)
```

---

## 10. DISTINCT (Removing Duplicates)

`DISTINCT` removes repeated values. It comes **immediately after SELECT**.

### Unique countries:

```sql
SELECT DISTINCT
    country
FROM customers;
```

### Using UPPER, LOWER, CONCAT with DISTINCT:

```sql
SELECT DISTINCT UPPER(country)
FROM customers;

SELECT DISTINCT LOWER(country)
FROM customers;

SELECT DISTINCT
    CONCAT(first_name, ' ', country) AS concated_text
FROM customers
ORDER BY concated_text DESC;
```

---

## 11. TOP (Limiting Returned Rows)

`TOP` restricts how many rows are returned. It comes right after `SELECT`.

### Top 3 rows:

```sql
SELECT TOP 3 *
FROM customers;
```

### Top 3 countries:

```sql
SELECT TOP 3
    id,
    country
FROM customers;
```

### Retrieve only 3 customers:

```sql
SELECT TOP 3
    id,
    first_name,
    country,
    score
FROM customers;
```

### Top 3 customers (distinct):

```sql
SELECT DISTINCT TOP 3 *
FROM customers;
```

### Top 3 highest scores:

```sql
SELECT DISTINCT TOP 3 *
FROM customers
ORDER BY score DESC;
```

### Lowest 3 customers:

```sql
SELECT DISTINCT TOP 3 *
FROM customers
ORDER BY score ASC;
```

### Two most recent orders:

```sql
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC;
```

---
