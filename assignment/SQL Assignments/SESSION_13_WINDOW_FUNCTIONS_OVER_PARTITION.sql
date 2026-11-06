-- SESSION 13: Window Functions Part 1 - OVER() and PARTITION BY
-- MySQL 8.0+

CREATE DATABASE IF NOT EXISTS window_practice_db;
USE window_practice_db;

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_amount DECIMAL(10,2),
    app_name VARCHAR(30)
);

-- Task 1 setup: Insert 10 sample orders
INSERT INTO Orders VALUES
(1, 101, 450.00, 'Zomato'),
(2, 102, 700.00, 'Swiggy'),
(3, 101, 300.00, 'Flipkart'),
(4, 103, 1200.00, 'Zomato'),
(5, 102, 550.00, 'Swiggy'),
(6, 104, 900.00, 'Flipkart'),
(7, 103, 650.00, 'Zomato'),
(8, 101, 800.00, 'Swiggy'),
(9, 104, 350.00, 'Flipkart'),
(10, 102, 1000.00, 'Zomato');

-- Task 1: Each order amount with grand total of all orders
SELECT
    order_id,
    user_id,
    order_amount,
    SUM(order_amount) OVER () AS grand_total
FROM Orders;

-- Task 2: Each order with average order amount for that user
SELECT
    user_id,
    order_id,
    order_amount,
    ROUND(AVG(order_amount) OVER (PARTITION BY user_id), 2) AS user_average
FROM Orders;

-- Task 3: Song duration and total duration per user
-- Assumes Playlist(song_id, user_id, duration_sec) exists.
SELECT
    song_id,
    user_id,
    duration_sec,
    SUM(duration_sec) OVER (PARTITION BY user_id) AS user_total_duration
FROM Playlist;

-- Task 4: Rating, movie average and difference from average
-- Assumes MovieRatings(rating_id, user_id, movie_name, rating) exists.
SELECT
    rating_id,
    user_id,
    movie_name,
    rating,
    ROUND(AVG(rating) OVER (PARTITION BY movie_name), 2) AS movie_average_rating,
    ROUND(rating - AVG(rating) OVER (PARTITION BY movie_name), 2) AS difference_from_average
FROM MovieRatings;
