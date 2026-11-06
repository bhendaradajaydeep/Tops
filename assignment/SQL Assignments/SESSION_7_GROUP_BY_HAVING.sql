-- SESSION 7: GROUP BY and HAVING (MySQL)
-- Topics: GROUP BY, HAVING, WHERE vs HAVING

-- Demo: Total revenue per region, only regions above 1,000,000
SELECT region, SUM(sales_amount) AS total_revenue
FROM sales
GROUP BY region
HAVING SUM(sales_amount) > 1000000;

-- Task 1: Number of orders placed by each user
SELECT user_id, COUNT(*) AS total_orders
FROM food_orders
GROUP BY user_id;

-- Task 2: Total amount spent by each payment method
SELECT
    payment_method,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY payment_method;

-- Task 3: Genres with total box office collection above 10 crore
SELECT
    genre,
    SUM(box_office_collection) AS total_collection
FROM movies
GROUP BY genre
HAVING SUM(box_office_collection) > 100000000;

-- Task 4: Users whose combined playlist duration is more than 2 hours
SELECT
    user_id,
    SUM(duration) AS total_duration_seconds
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;

-- WHERE filters rows before grouping; HAVING filters groups after GROUP BY.
