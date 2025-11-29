# SQL WHERE Operators — Complete Guide (Beginner → Intermediate)

This document explains everything related to the **WHERE clause** in SQL — from simple comparisons to pattern matching and ranges. It is designed to be included in the `intermediate/` section of your SQL concepts repository.

---

# 📌 What Is the `WHERE` Clause?

The `WHERE` clause is used to **filter rows** in a query. It allows you to return only the rows that meet specific conditions.

Example:

```sql
SELECT *
FROM customers
WHERE country = 'Germany';
```

---

# 🧩 Categories of WHERE Operators

The WHERE clause uses different families of operators:

1. **Comparison Operators**
2. **Logical Operators**
3. **Range Operator (BETWEEN)**
4. **Membership Operators (IN / NOT IN)**
5. **Search Operator (LIKE)**

Each one helps you filter data in its own way.

---

# 1️⃣ Comparison Operators

Used to compare values.

| Operator | Meaning               |
| -------- | --------------------- |
| =        | Equal                 |
| <> or != | Not equal             |
| >        | Greater than          |
| >=       | Greater than or equal |
| <        | Less than             |
| <=       | Less than or equal    |

### Examples

Retrieve all customers from Germany:

```sql
SELECT *
FROM customers
WHERE LOWER(country) = 'germany';
```

Retrieve customers with a score greater than 500:

```sql
SELECT *
FROM customers
WHERE score > 500;
```

---

# 2️⃣ Logical Operators

Used to combine multiple conditions.

| Operator | Meaning                             |
| -------- | ----------------------------------- |
| AND      | All conditions must be true         |
| OR       | At least one condition must be true |
| NOT      | Negates a condition                 |

### Examples

Find customers from USA **AND** score greater than 500:

```sql
SELECT *
FROM customers
WHERE LOWER(country) = 'usa' AND score > 500;
```

Find customers who are **NOT** from USA:

```sql
SELECT *
FROM customers
WHERE NOT country = 'USA';
```

Negating a group of conditions:

```sql
SELECT *
FROM customers
WHERE NOT (LOWER(country) = 'germany' AND score >= 500);
```

---

# 3️⃣ Range Operator — `BETWEEN`

Used to check if a value lies within a defined range.

📌 It is **inclusive**, meaning both boundaries are included.

### Example

Retrieve customers with scores between 100 and 500:

```sql
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;
```

Equivalent using comparison + logical operators:

```sql
SELECT *
FROM customers
WHERE score >= 100 AND score <= 500;
```

---

# 4️⃣ Membership Operators — `IN` / `NOT IN`

Used to check whether a value exists in a specific list.

### Examples

Find customers from Germany or USA:

```sql
SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');
```

Find customers NOT from Germany or USA:

```sql
SELECT *
FROM customers
WHERE country NOT IN ('Germany', 'USA');
```

💡 *Tip:* Use `IN` instead of multiple OR conditions.

---

# 5️⃣ Search Operator — `LIKE`

Used to search for patterns in text.

### Wildcards

| Symbol | Meaning                             |
| ------ | ----------------------------------- |
| %      | Any number of characters (0 → many) |
| _      | Exactly one character               |

### Examples

Starts with 'G':

```sql
SELECT *
FROM customers
WHERE country LIKE 'G%';
```

Ends with 'in':

```sql
SELECT *
FROM customers
WHERE first_name LIKE '%in';
```

Contains 'r' anywhere:

```sql
SELECT *
FROM customers
WHERE first_name LIKE '%r%';
```

'r' in the 3rd position:

```sql
SELECT *
FROM customers
WHERE first_name LIKE '__r%';
```

---

# ✨ Summary Table

| Category   | Operators               | Usage                              |
| ---------- | ----------------------- | ---------------------------------- |
| Comparison | =, !=, <>, >, >=, <, <= | Compare two values                 |
| Logical    | AND, OR, NOT            | Combine or invert conditions       |
| Range      | BETWEEN                 | Check if a value is inside a range |
| Membership | IN, NOT IN              | Check for value in a list          |
| Search     | LIKE                    | Pattern matching in text           |

---

# 🎉 Final Notes

* The `WHERE` clause is one of the **most important** parts of SQL.
* Almost every SELECT, UPDATE, or DELETE query relies on it.
* Mastering these operators will make you accurate and efficient with data filtering.
