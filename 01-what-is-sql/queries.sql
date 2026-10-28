-- Topic 1: What Is SQL?
-- Practice examples for MySQL.
-- Run these statements in order.

CREATE DATABASE IF NOT EXISTS sql_journey;
USE sql_journey;

-- Create a table to store product data.
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    in_stock BOOLEAN NOT NULL DEFAULT TRUE
);

-- Insert sample records.
-- ON DUPLICATE KEY UPDATE makes re-running this example safe for these IDs.
INSERT INTO products (product_id, product_name, category, price, in_stock)
VALUES
    (1, 'Keyboard', 'Electronics', 1200.00, TRUE),
    (2, 'Notebook', 'Stationery', 80.00, TRUE),
    (3, 'Headphones', 'Electronics', 1800.00, FALSE)
ON DUPLICATE KEY UPDATE
    product_name = VALUES(product_name),
    category = VALUES(category),
    price = VALUES(price),
    in_stock = VALUES(in_stock);

-- READ: Retrieve every column and row.
SELECT * FROM products;

-- READ: Retrieve only the columns you need.
SELECT product_name, price
FROM products;

-- READ: Filter records using WHERE.
SELECT *
FROM products
WHERE category = 'Electronics';

-- READ: Calculate a value from existing data.
SELECT product_name, price, price * 2 AS price_for_two
FROM products;

-- UPDATE: Change one product's price.
-- WHERE limits the update to product_id 2.
UPDATE products
SET price = 90.00
WHERE product_id = 2;

-- Verify the update.
SELECT *
FROM products
WHERE product_id = 2;

-- DELETE: Remove one sample record.
-- WHERE limits deletion to product_id 3.
DELETE FROM products
WHERE product_id = 3;

-- Verify the remaining records.
SELECT * FROM products;

-- Explore the table structure.
DESCRIBE products;

-- Optional cleanup: uncomment only if you want to delete the practice table.
-- DROP TABLE products;
