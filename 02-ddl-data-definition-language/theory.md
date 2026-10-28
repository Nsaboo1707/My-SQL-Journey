# Topic 2: DDL — Data Definition Language

## What is DDL?

**DDL (Data Definition Language)** is a category of SQL commands used to define or change the structure of database objects, such as databases and tables.

In simple words, **DDL changes the design or structure of the database**, rather than adding or editing the actual records.

## Common DDL Commands

| Command | Purpose | Example |
|---|---|---|
| `CREATE` | Creates a database object, such as a table. | `CREATE TABLE departments (...);` |
| `ALTER` | Changes an existing object's structure. | `ALTER TABLE employees ADD COLUMN hr_note TEXT;` |
| `DROP` | Removes a database object and its structure. | `DROP TABLE employees;` |
| `TRUNCATE` | Removes all rows from a table while keeping the table structure. | `TRUNCATE TABLE employees;` |

**Important:** `TRUNCATE` removes data, not the table definition. It is often taught alongside DDL commands.

## 1. CREATE TABLE

`CREATE TABLE` creates a new table and defines its columns, data types, and constraints.

Example:
```sql
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);
```

- `department_id` is an integer-like ID generated using PostgreSQL's `SERIAL` shorthand.
- `PRIMARY KEY` means the ID must be unique and cannot be `NULL`.
- `VARCHAR(50)` stores text up to 50 characters.
- `NOT NULL` prevents the department name from being missing.

## 2. Constraints

**Constraints** are rules on a table's data. They help prevent invalid or inconsistent records.

| Constraint | Meaning | Example from this topic |
|---|---|---|
| `PRIMARY KEY` | Uniquely identifies each row; it is unique and not null. | `employee_id SERIAL PRIMARY KEY` |
| `NOT NULL` | A value must be supplied. | `first_name VARCHAR(50) NOT NULL` |
| `UNIQUE` | Prevents duplicate values in a column or column combination. | `email VARCHAR(150) UNIQUE` |
| `CHECK` | Requires a condition to be satisfied. | `CHECK (salary > 0)` |
| `DEFAULT` | Supplies a value when an insert does not provide one. | `DEFAULT TRUE` |
| `REFERENCES` | Creates a foreign-key relationship to another table's key. | `department_id INT REFERENCES departments(department_id)` |

### A note about `SERIAL`

In PostgreSQL, `SERIAL` is a convenient shorthand that uses a sequence to supply generated integer values. It does **not** itself guarantee uniqueness: the `PRIMARY KEY` constraint does that. In newer designs, identity columns are another option.

## 3. Relationships Between Tables

The `employees` table uses:

```sql
department_id INT REFERENCES departments(department_id),
manager_id INT REFERENCES employees(employee_id)
```

- The first foreign key connects an employee to a valid department.
- The second is a **self-referencing foreign key**: a manager is also an employee.
- A nullable `manager_id` allows an employee to have no manager recorded.

The referenced department or manager must exist when a non-`NULL` foreign-key value is supplied.

## 4. ALTER TABLE

`ALTER TABLE` changes the structure of an existing table.

### Add a column
```sql
ALTER TABLE employees
ADD COLUMN internal_note VARCHAR(100) NOT NULL DEFAULT 'N/A';
```

Existing rows receive the default value for the new column.

### Rename a column
```sql
ALTER TABLE employees
RENAME COLUMN internal_note TO hr_note;
```

### Drop a column
```sql
ALTER TABLE employees
DROP COLUMN hr_note;
```

Dropping a column removes that column and its data. Be careful before running it.

## 5. DDL vs. DML

DDL defines or changes the structure; **DML (Data Manipulation Language)** works with the records stored in that structure.

| DDL | DML |
|---|---|
| `CREATE`, `ALTER`, `DROP` | `INSERT`, `UPDATE`, `DELETE` |
| Defines or changes database objects. | Adds, changes, or removes table records. |
| Example: create the `employees` table. | Example: insert a new employee. |

`SELECT` retrieves records; it is commonly called DQL (Data Query Language), although some learning materials group it with DML.

## Quick Revision

- **DDL:** Defines and changes database structure.
- **CREATE:** Creates a database object.
- **ALTER:** Changes an object's structure.
- **DROP:** Removes the object itself.
- **TRUNCATE:** Removes all rows but keeps the table.
- **Constraints:** Rules that protect the validity of data.
- **Foreign key:** Connects a column to a key in another table, or in the same table.
- **DML:** Commands such as `INSERT`, `UPDATE`, and `DELETE` that manipulate records.

## Self-Test

1. What is the full form of DDL?
2. What is the difference between `DROP` and `TRUNCATE`?
3. What do `PRIMARY KEY` and `NOT NULL` enforce?
4. What is the purpose of a `CHECK` constraint?
5. How does `ALTER TABLE` change a table?
6. What is the difference between DDL and DML?

See [queries.sql](queries.sql) for the practice script based on this topic.
