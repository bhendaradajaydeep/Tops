-- SESSION 19: Indexing and Query Optimization (MySQL)
-- Topics: CREATE INDEX, EXPLAIN, EXPLAIN ANALYZE

-- Task 1: Run the query before creating an index.
-- In MySQL Workbench, note the execution time shown after running it.
SELECT *
FROM orders
WHERE user_id = 101;

-- Task 2: Create an index on user_id, then run the same query again.
CREATE INDEX idx_orders_user_id
ON orders(user_id);

SELECT *
FROM orders
WHERE user_id = 101;

-- Task 3: Compare the execution plan before/after the index.
-- Run EXPLAIN before and after CREATE INDEX and compare type, key, rows.
EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

-- MySQL 8.0.18+: EXPLAIN ANALYZE executes the query and reports actual timing.
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE user_id = 101;

-- Task 4: Fetch products from a specific category.
-- Create the index once; if it already exists, do not create it again.
CREATE INDEX idx_products_category
ON products(category);

SELECT *
FROM products
WHERE category = 'Electronics';

EXPLAIN
SELECT *
FROM products
WHERE category = 'Electronics';

-- Task 5: Other optimization examples
-- Select only needed columns instead of SELECT *.
SELECT order_id, order_date, total_amount
FROM orders
WHERE user_id = 101;

-- Avoid applying a function to an indexed date column in the WHERE clause.
-- Prefer a date range such as the following:
SELECT order_id, order_date, total_amount
FROM orders
WHERE order_date >= '2026-01-01'
  AND order_date < '2026-02-01';

-- Note: The optimizer chooses whether to use an index.
-- An index does not guarantee a faster query for every table or filter.
