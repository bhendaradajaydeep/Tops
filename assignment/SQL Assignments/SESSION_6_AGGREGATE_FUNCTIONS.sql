-- SESSION 6: Aggregate Functions (MySQL)
-- Topics: SUM(), COUNT(), AVG(), MIN(), MAX(), ROUND()

-- Demo: Overall revenue, average amount and highest order value
SELECT
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount), 2) AS average_order_value,
    MAX(amount) AS highest_order_value
FROM food_orders;

-- Task 1: Total amount spent on food orders
SELECT SUM(amount) AS total_amount_spent
FROM food_orders;

-- Task 2: Count songs added to playlists
SELECT COUNT(song_id) AS total_songs
FROM spotify_playlists;

-- Optional: Count songs for one user (change 1 to the required user_id)
SELECT COUNT(song_id) AS songs_added
FROM spotify_playlists
WHERE user_id = 1;

-- Task 3: Average movie rating rounded to 1 decimal place
SELECT ROUND(AVG(rating), 1) AS average_movie_rating
FROM bookmyshow_reviews;

-- Task 4: Minimum and maximum transaction values for one user
SELECT
    MIN(amount) AS minimum_transaction,
    MAX(amount) AS maximum_transaction
FROM paytm_transactions
WHERE user_id = 1;

-- Task 5: Order count, average order value and highest order value per user
SELECT
    user_id,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MAX(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;
