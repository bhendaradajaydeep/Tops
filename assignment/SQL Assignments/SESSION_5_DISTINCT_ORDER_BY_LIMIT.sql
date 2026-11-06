-- SESSION 5: DISTINCT, ORDER BY and LIMIT (MySQL)

-- Task 1: Unique payment methods
SELECT DISTINCT payment_method
FROM orders;

-- Task 2: Unique cities in alphabetical order
SELECT DISTINCT city
FROM users
ORDER BY city ASC;

-- Task 3: Five most recent bookings
SELECT *
FROM bookings
ORDER BY booking_date DESC
LIMIT 5;

-- Task 4: Top 10 products by sold_count
SELECT name, sold_count
FROM products
ORDER BY sold_count DESC
LIMIT 10;

-- Extra examples:
-- Sort employees by salary from highest to lowest
SELECT *
FROM employees
ORDER BY salary DESC;

-- Show only the first 10 employees
SELECT *
FROM employees
LIMIT 10;
