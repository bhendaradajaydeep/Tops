-- SESSION 18: Views (MySQL)
-- Topics: CREATE VIEW, replace/update view definition, view limitations

-- Assumed tables:
-- restaurants(restaurant_id, restaurant_name, city)
-- restaurant_reviews(review_id, restaurant_id, rating)

-- Task 1: Create a view for restaurants with average rating above 4.0
CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    AVG(rv.rating) AS average_rating,
    COUNT(rv.review_id) AS total_reviews
FROM restaurants AS r
INNER JOIN restaurant_reviews AS rv
    ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
HAVING AVG(rv.rating) > 4.0;

-- View the result
SELECT * FROM TopRatedRestaurants;

-- Task 2: Replace the view definition to include city
CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    r.city,
    AVG(rv.rating) AS average_rating,
    COUNT(rv.review_id) AS total_reviews
FROM restaurants AS r
INNER JOIN restaurant_reviews AS rv
    ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name, r.city
HAVING AVG(rv.rating) > 4.0;

SELECT * FROM TopRatedRestaurants;

-- Task 3: Test an update attempt on the aggregate view.
-- Uncomment and run this statement separately to observe the MySQL error:
-- UPDATE TopRatedRestaurants
-- SET average_rating = 4.8
-- WHERE restaurant_name = 'Sample Restaurant';
--
-- Explanation: This view contains AVG(), COUNT(), GROUP BY and HAVING.
-- Aggregate/grouped views are not directly updatable in MySQL.
-- Record the exact error shown by your own MySQL version.

-- Task 4: Daily order count and revenue for the last 30 days
CREATE OR REPLACE VIEW DailyOrderSummary AS
SELECT
    DATE(order_date) AS order_day,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM food_orders
WHERE order_date >= CURDATE() - INTERVAL 29 DAY
  AND order_date < CURDATE() + INTERVAL 1 DAY
GROUP BY DATE(order_date);

SELECT * FROM DailyOrderSummary
ORDER BY order_day;

-- Task 5: Good practices for analytics views
-- 1. Use clear column names:
--    SELECT SUM(amount) AS total_sales FROM orders;
-- 2. Select only required columns to keep dashboard data focused.
-- 3. Keep business rules consistent and document filters/definitions.
