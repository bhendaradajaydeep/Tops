-- SESSION 3: WHERE Clause and Operators (MySQL)

-- Task 1: Restaurants with rating 4.5 or higher
SELECT *
FROM restaurants
WHERE rating >= 4.5;

-- Task 2: Movies released after 2020 AND genre is Action
SELECT *
FROM movies
WHERE release_year > 2020
  AND genre = 'Action';

-- Task 3: Products that are NOT Electronics OR price is below 500
SELECT *
FROM products
WHERE category <> 'Electronics'
   OR price < 500;

-- Task 4: Users who are NOT from Ahmedabad AND have over 1000 followers
SELECT *
FROM users
WHERE NOT city = 'Ahmedabad'
  AND followers > 1000;

-- Extra examples of comparison and logical operators
SELECT *
FROM employees
WHERE salary > 50000
  AND department = 'IT';

SELECT *
FROM employees
WHERE department = 'HR'
   OR department = 'IT';

SELECT *
FROM employees
WHERE NOT department = 'Sales';
