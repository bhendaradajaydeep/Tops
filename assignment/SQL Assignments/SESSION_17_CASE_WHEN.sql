-- SESSION 17: CASE WHEN (Conditional Logic) - MySQL

-- Demo: Classify customers by total purchase value
SELECT
    customer_id,
    total_purchase,
    CASE
        WHEN total_purchase >= 50000 THEN 'High'
        WHEN total_purchase >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS customer_category
FROM customers;

-- Task 1: Classify food orders by total amount
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount < 300 THEN 'Small'
        WHEN total_amount < 1000 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM FoodOrders;

-- Task 2: Movie popularity based on rating out of 10
SELECT
    movie_id,
    rating,
    CASE
        WHEN rating >= 8 THEN 'Blockbuster'
        WHEN rating >= 5 THEN 'Hit'
        ELSE 'Average'
    END AS popularity
FROM Movies;

-- Task 3: Flipkart-style product price categories
SELECT
    product_id,
    name,
    price,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price <= 2000 THEN 'Standard'
        ELSE 'Premium'
    END AS price_category
FROM FlipkartProducts;

-- Task 4: Spotify track duration labels
SELECT
    track_id,
    duration_sec,
    CASE
        WHEN duration_sec < 180 THEN 'Short'
        WHEN duration_sec <= 300 THEN 'Medium'
        ELSE 'Long'
    END AS duration_label
FROM SpotifyTracks;
