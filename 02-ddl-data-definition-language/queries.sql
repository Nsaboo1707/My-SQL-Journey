-- Topic 2: DDL (Data Definition Language)
-- PostgreSQL practice
--
-- First, start PostgreSQL in a terminal (Docker must be installed):
-- docker run -d --name sql_cc -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:18
--
-- Open the PostgreSQL terminal:
-- docker exec -it sql_cc psql -U postgres
--
-- While connected to the default "postgres" database, create the practice database:
-- CREATE DATABASE chaicode_ecom_db;
-- Then connect to it in psql:
-- \c chaicode_ecom_db
--
-- Run the SQL practice statements below only after connecting to chaicode_ecom_db.
-- This script is intended for a fresh practice database. If you run it again,
-- existing tables/records may cause duplicate-object or duplicate-data errors.
--
-- ------------------------------------------------------------
-- 1. CREATE TABLE: departments
-- ------------------------------------------------------------

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- INSERT is DML (not DDL). We insert sample data to practice the table.
INSERT INTO departments (department_name)
VALUES
    ('Sales'),
    ('Support'),
    ('Warehouse'),
    ('Tech');

-- SERIAL generates department IDs, so we leave department_id out of the INSERT.
SELECT * FROM departments;

-- ------------------------------------------------------------
-- 2. CREATE TABLE: employees
-- ------------------------------------------------------------

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    bio TEXT,
    job_title VARCHAR(50) NOT NULL,
    salary INT NOT NULL CHECK (salary > 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    hire_date DATE NOT NULL,
    last_login TIMESTAMP,
    employee_status VARCHAR(20) NOT NULL DEFAULT 'active'
        CHECK (employee_status IN ('active', 'on_leave', 'terminated')),
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    department_id INT REFERENCES departments(department_id),
    manager_id INT REFERENCES employees(employee_id)
);

-- INSERT is DML. The rows below give us data to inspect after creating the table.
-- Department IDs are 1=Sales, 2=Support, 3=Warehouse, 4=Tech.
-- Priya and James have no manager recorded, so their manager_id is NULL.
INSERT INTO employees
    (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date)
VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000, NULL, '2020-06-15'),
    ('Robert', 'Chen',      'robert.chen@techbazaar.com',     1, 'Sales Representative', 50000, 1,    '2024-01-01'),
    ('Marcus', 'Webb',      'marcus.webb@techbazaar.com',     1, 'Sales Representative', 58000, 1,    '2021-09-01'),
    ('Elena',  'Garcia',    'elena.garcia@techbazaar.com',    1, 'Senior Sales Rep',     68000, 1,    '2019-11-20'),
    ('James',  'Okafor',    'james.okafor@techbazaar.com',    2, 'Support Lead',          72000, NULL, '2018-05-10'),
    ('Lily',   'Zhang',     'lily.zhang@techbazaar.com',      2, 'Support Agent',         48000, 5,    '2022-02-14'),
    ('Diego',  'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent',         46000, 5,    '2023-01-09'),
    ('Sara',   'Osei',      'sara.osei@techbazaar.com',       3, 'Warehouse Lead',        55000, NULL, '2020-08-23');

SELECT * FROM employees;
SELECT * FROM departments;

-- ------------------------------------------------------------
-- 3. Constraint examples
-- ------------------------------------------------------------
-- The following INSERT statements are INTENTIONALLY invalid.
-- They should fail due to NOT NULL, UNIQUE, CHECK, or CHECK constraints.
-- Uncomment and run ONE at a time to read the error message.
-- Do not run these together with the valid setup statements.

-- NOT NULL: first_name cannot be NULL.
-- INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date)
-- VALUES (NULL, 'NoFirstName', 'nofirstname.demo@example.com', 1, 'Rep', 50000, '2024-01-01');

-- UNIQUE: this email already exists in the employee rows above.
-- INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date)
-- VALUES ('Robert', 'Chen', 'robert.chen@techbazaar.com', 1, 'Rep', 50000, '2024-01-01');

-- CHECK (salary > 0): salary cannot be zero or negative.
-- INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date)
-- VALUES ('Unpaid', 'Intern', 'unpaid.demo@example.com', 1, 'Intern', 0, '2024-01-01');

-- CHECK (employee_status IN (...)): 'retired' is not an allowed status.
-- INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date, employee_status)
-- VALUES ('Bad', 'Status', 'badstatus.demo@example.com', 1, 'Rep', 50000, '2024-01-01', 'retired');

-- FOREIGN KEY: department_id must refer to an existing department.
-- INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, hire_date)
-- VALUES ('Bad', 'Department', 'baddepartment.demo@example.com', 999, 'Rep', 50000, '2024-01-01');

-- ------------------------------------------------------------
-- 4. ALTER TABLE: add, rename, and drop a column
-- ------------------------------------------------------------

-- Add a column. Existing rows get the default 'N/A'.
ALTER TABLE employees
ADD COLUMN internal_note VARCHAR(100) NOT NULL DEFAULT 'N/A';

SELECT employee_id, first_name, internal_note
FROM employees;

-- Rename the new column.
ALTER TABLE employees
RENAME COLUMN internal_note TO hr_note;

-- Drop the column and its data.
ALTER TABLE employees
DROP COLUMN hr_note;

-- Check the final table structure and the records.
\d employees
SELECT * FROM employees;

-- End of Topic 2 DDL practice.
