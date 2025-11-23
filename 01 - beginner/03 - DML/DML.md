# DML Commands (INSERT, UPDATE, DELETE)

This README gives you a clean, simple, and clear explanation of **DML (Data Manipulation Language)** commands in SQL with examples. These commands allow you to add, modify, and delete data inside existing tables.

---

## 📌 What Is DML?

DML stands for **Data Manipulation Language**, and it includes commands used to *manipulate the data* stored in tables:

* **INSERT** → Add new rows
* **UPDATE** → Modify existing rows
* **DELETE** → Remove rows

---

# 1️⃣ INSERT

Used to add new data to a table.

### ✅ Syntax

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

### 🔹 Notes

* If you don’t specify column names, SQL expects values for *all* table columns.
* Number of columns must match number of values.
* Required (NOT NULL) columns must always have values.

### ✅ Example: Insert into `customers` table

```sql
INSERT INTO customers (id, first_name, country, score)
VALUES
    (6, 'ibrahim', 'USA', NULL),
    (7, 'Sam', NULL, 100);
```

### Another way (without specifying columns):

```sql
INSERT INTO customers
VALUES
    (8, 'SHAFIQ', 'USA', 1000);
```

---

# 2️⃣ INSERT Using SELECT

You can insert data from another table.

### Example

```sql
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
    id,
    first_name,
    NULL,
    'Unknown'
FROM customers;
```

This copies data from `customers` into `persons`.

---

# 3️⃣ UPDATE

Used to change data in existing rows.

### ✅ Syntax

```sql
UPDATE table_name
SET column1 = value1,
    column2 = value2
WHERE condition;
```

### ❗ Important

Always use **WHERE**, otherwise *all rows will be updated*. 😬

### Example: Update customer's score

```sql
UPDATE customers
SET score = 800
WHERE id = 6;
```

### Update multiple columns

```sql
UPDATE customers
SET score = 800,
    country = 'UK'
WHERE id = 6;
```

### Fixing NULL values

```sql
UPDATE customers
SET score = 0
WHERE score IS NULL;

UPDATE customers
SET country = 'Unknown'
WHERE country IS NULL;
```

---

# 4️⃣ DELETE

Used to remove rows.

### ✅ Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

### ❗ Warning

If you skip the **WHERE**, all table data will be deleted.

### Example: Delete customers with ID > 5

```sql
DELETE FROM customers
WHERE id > 5;
```

---

# 5️⃣ TRUNCATE

Used to delete **all data** from a table *very fast*.

### Example

```sql
TRUNCATE TABLE persons;
```

* Removes every row, but keeps the table structure.
* Faster than DELETE.

---

## 🎉 Summary Table

| Command      | Purpose                 | Deletes All?      | Uses WHERE? |
| ------------ | ----------------------- | ----------------- | ----------- |
| **INSERT**   | Add new rows            | ❌                 | Not used    |
| **UPDATE**   | Modify existing rows    | ❌                 | ✅ Required  |
| **DELETE**   | Remove selected rows    | ❌ unless no WHERE | ✅ Required  |
| **TRUNCATE** | Remove all rows quickly | ✅                 | ❌           |

---

If you want, I can also make a PDF version of this README. Just tell me 😄
