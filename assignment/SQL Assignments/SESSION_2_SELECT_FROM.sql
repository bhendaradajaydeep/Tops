-- SESSION 2: Basic SELECT and FROM (MySQL)

-- Task 1: Select every column from restaurants
SELECT *
FROM restaurants;

-- Task 2: Display only name and rating from zomato_reviews
SELECT name, rating
FROM zomato_reviews;

-- Task 3: Rename columns using AS
SELECT
    movie_name AS 'Title',
    release_year AS 'Year Released'
FROM movies;

-- Task 4: Select all columns from products with a comment
-- This query displays every column and every row from the products table.
SELECT *
FROM products;

-- Extra practice: Select selected columns from employees
SELECT employee_id, employee_name, department
FROM employees;
