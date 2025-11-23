# SQL DDL (Data Definition Language) – Quick Reference

This README covers the core SQL DDL commands: **CREATE**, **ALTER**, and **DROP**, along with explanations and examples based on your code.

---

## 📌 What is DDL?

DDL (Data Definition Language) includes commands that define or modify the structure of database objects—tables, columns, keys, etc.

### DDL Commands:

* **CREATE** → create new tables or objects
* **ALTER** → modify existing tables
* **DROP** → delete tables or specific columns

---

## 🏗️ CREATE – Creating Tables

### Example:

```sql
CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
);
```

### Notes:

* `VARCHAR(n)` defines a text field with max length **n**.
* `NOT NULL` ensures the column must always contain a value.
* A **PRIMARY KEY** uniquely identifies each row.
* Constraints can be named (recommended):

  ```sql
  CONSTRAINT pk_persons PRIMARY KEY (id)
  ```

---

## 🔧 ALTER – Updating Table Structure

### Add a New Column

```sql
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;
```

### Drop a Column

```sql
ALTER TABLE persons
DROP COLUMN email;
```

Another example:

```sql
ALTER TABLE persons
DROP COLUMN phone;
```

### View Current Table Structure

```sql
SELECT * FROM persons;
```

---

## 🗑️ DROP – Removing Tables

### Delete a Table Entirely

```sql
DROP TABLE persons;
```

⚠️ This permanently removes the table AND all data inside it.

---

## ✔️ Summary

| Command                   | Purpose              |
| ------------------------- | -------------------- |
| `CREATE TABLE`            | Creates a new table  |
| `ALTER TABLE ADD`         | Adds new columns     |
| `ALTER TABLE DROP COLUMN` | Removes columns      |
| `DROP TABLE`              | Deletes a full table |

If you want to extend this README with **constraints**, **foreign keys**, **data types**, **table relationships**, or **best practices**, just tell me!
