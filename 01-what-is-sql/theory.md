# Topic 1: What Is SQL?

## 1. What is Data?

**Data** is a collection of raw facts and figures that can be stored, processed, and used to produce meaningful information.

Data can be represented in different forms:
- **Text:** `'Nakshatra'`
- **Numbers:** `100`, `5000`
- **Boolean values:** `TRUE` or `FALSE`

**Example:** A product's name, price, and quantity are data in a shopping application.

## 2. What is Information?

**Information** is data that has been processed or organized so that it has meaning and is useful.

**Example:**
- Data: Price = ₹500, quantity sold = 10
- Information: Total sales = ₹5,000

In simple words, data is the raw input; information is the meaningful result.

## 3. Why Do We Need to Store Data?

Applications such as shopping websites must remember products, customers, orders, and payments.

Some data can be kept temporarily in **RAM**, but RAM is volatile: its contents are generally lost when power is turned off. For data that must remain available, we use **persistent storage**, such as an SSD or hard disk, often managed by a database system.

## 4. What is a Database?

A **database** is an organized collection of related data that can be stored, accessed, and managed efficiently.

For example, an online shopping database may contain information about:
- Products
- Categories
- Customers
- Orders
- Payments

A relational database usually organizes data into tables containing rows and columns.

## 5. What is a DBMS?

**DBMS** stands for **Database Management System**.

A DBMS is software used to create, store, retrieve, update, and manage data in a database. It can also help with security, data integrity, concurrency, and recovery.

**Examples:** MySQL, PostgreSQL, Oracle Database, and Microsoft SQL Server.

### Database vs. DBMS

| Database | DBMS |
|---|---|
| An organized collection of data. | Software used to manage the data. |
| Contains the records being stored. | Provides ways to access and modify those records. |
| Example: student records. | Example: MySQL managing student records. |

## 6. What is an RDBMS?

**RDBMS** stands for **Relational Database Management System**.

An RDBMS is a type of DBMS that stores data in related tables made up of rows and columns. Relationships between tables are commonly represented using keys.

Example: a `students` table can store student details, while a `departments` table stores department details. A department ID can connect the two tables.

Examples include MySQL, PostgreSQL, Oracle Database, and Microsoft SQL Server.

## 7. What is SQL?

**SQL** stands for **Structured Query Language**.

SQL is a language used to communicate with relational databases. It lets us create database objects, retrieve data, insert records, update existing records, delete records, and define rules for data.

In simple words, **SQL tells a database what operation we want to perform on the data**.

Example:
```sql
SELECT * FROM students;
```

This query retrieves all columns and rows from the table named `students`.

SQL is described as a **declarative language** because we usually specify what result we want instead of writing every step the database must take to produce it.

## 8. Why Do We Need SQL?

SQL helps us:
1. Insert new records.
2. Retrieve the required information.
3. Update existing records.
4. Delete records.
5. Create and modify tables and other database objects.
6. Define relationships between tables.
7. Apply constraints to help maintain accurate and consistent data.
8. Query and manage large amounts of data, including in systems used by multiple people.

SQL is used in systems such as banking applications, college management systems, e-commerce websites, and hospital management systems.

## 9. CRUD Operations

**CRUD** stands for **Create, Read, Update, and Delete**—the four basic operations for managing records.

| CRUD operation | Purpose | Common SQL command |
|---|---|---|
| Create | Add a new record | `INSERT` |
| Read | Retrieve records | `SELECT` |
| Update | Change existing records | `UPDATE` |
| Delete | Remove records | `DELETE` |

Note: SQL's `CREATE` statement is used to create database objects such as tables. In the CRUD acronym, “Create” commonly means creating a record, which is done with `INSERT`.

**Be careful:** An `UPDATE` or `DELETE` statement without an appropriate `WHERE` clause can affect every row in a table.

## 10. SQL and JavaScript: What Is the Difference?

| SQL | JavaScript |
|---|---|
| Communicates with a relational database. | Implements application logic and interactive behaviour. |
| Retrieves and manipulates database data. | Handles events, validation, calculations, and user interactions. |
| Example: `SELECT * FROM students;` | Example: `console.log("Hello");` |

A JavaScript application can communicate with a database through a suitable backend or database driver. The application and database have different roles.

## 11. How Does an Application Use SQL?

A common flow is:

1. A user interacts with an application.
2. The application's backend receives the request.
3. The backend sends a database query using a suitable database driver.
4. The DBMS processes the query and reads or changes the database.
5. The result is returned to the application.

For example, when a customer opens a product page, the application can request that product's details from the database.

## 12. Important Terms

| Term | Easy definition |
|---|---|
| Data | Raw facts and figures. |
| Information | Processed data with meaning. |
| Database | An organized collection of data. |
| DBMS | Software used to manage a database. |
| RDBMS | A DBMS designed to manage relational data in tables. |
| SQL | Language used to communicate with relational databases. |
| Table | Data arranged in rows and columns. |
| Row | One record in a table. |
| Column | An attribute or field in a table. |
| CRUD | Create, Read, Update, Delete. |
| Persistent storage | Storage that retains data when power is off. |
| Constraint | A rule applied to data in a database. |
| Primary key | A column or set of columns that uniquely identifies each row. |
| Foreign key | A column or set of columns that refers to a key in another or the same table. |

## Quick Revision

- **Data:** Raw facts and figures.
- **Information:** Meaningful, processed data.
- **Database:** Organized collection of data.
- **DBMS:** Software that manages a database.
- **RDBMS:** A DBMS that manages related tables.
- **SQL:** Structured Query Language, used to communicate with relational databases.
- **CRUD:** Create, Read, Update, Delete.
- **Examples of RDBMSs:** MySQL, PostgreSQL, Oracle Database, and Microsoft SQL Server.

## Self-Test

1. What is the full form of SQL?
2. What is the difference between data and information?
3. How is a database different from a DBMS?
4. What do rows and columns represent in a table?
5. What does CRUD stand for?
6. Which SQL command retrieves records?
7. Why must we be careful when using `UPDATE` and `DELETE` without a `WHERE` clause?

See [queries.sql](queries.sql) for practical examples related to this topic.
