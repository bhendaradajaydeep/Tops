-- SESSION 15: Date Functions (MySQL)
-- Topics: DATE, YEAR(), MONTH(), DAY(), NOW(), DATE_ADD(), DATE_SUB(), DATEDIFF()

-- Task 1: Display current date and time
SELECT NOW() AS CurrentDateTime;

-- Task 2: Show year, month and day from each order date
SELECT
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM Orders;

-- Task 3: Expected pickup date is 2 days before delivery date
SELECT
    delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM Deliveries;

-- Extra example: Add 7 days to a date
SELECT
    delivery_date,
    DATE_ADD(delivery_date, INTERVAL 7 DAY) AS date_after_7_days
FROM Deliveries;

-- Task 4: Calculate subscription duration in days
SELECT
    user_id,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS subscription_days
FROM Subscriptions;

-- Task 5: Users who have not logged in for more than 30 days
SELECT user_id, last_login_date
FROM AppLogins
WHERE DATEDIFF(CURDATE(), last_login_date) > 30;
