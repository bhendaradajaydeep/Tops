-- SESSION 14: Window Functions Part 2
-- ROW_NUMBER(), RANK(), DENSE_RANK() - MySQL 8.0+

-- Task 1: Number each user's orders from newest to oldest
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY order_date DESC
    ) AS order_number
FROM Orders;

-- Task 2: Rank songs by streams within each artist
SELECT
    song_id,
    artist,
    streams,
    RANK() OVER (
        PARTITION BY artist
        ORDER BY streams DESC
    ) AS song_rank
FROM Songs;

-- Task 3: Rank movies by rating within each genre
SELECT
    movie_id,
    genre,
    rating,
    DENSE_RANK() OVER (
        PARTITION BY genre
        ORDER BY rating DESC
    ) AS genre_rank
FROM Movies;

-- Task 4: Top 3 influencers on each platform
WITH RankedInfluencers AS (
    SELECT
        id,
        platform,
        followers,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM Influencers
)
SELECT id, platform, followers, row_num
FROM RankedInfluencers
WHERE row_num <= 3
ORDER BY platform, row_num;

-- Difference:
-- ROW_NUMBER gives every row a unique number.
-- RANK gives tied rows the same rank and leaves gaps after ties.
-- DENSE_RANK gives tied rows the same rank but does not leave gaps.
