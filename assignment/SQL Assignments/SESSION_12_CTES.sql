-- SESSION 12: Common Table Expressions (CTEs) - MySQL 8.0+
-- CTEs use the WITH keyword and exist only for the statement that follows.

-- Task 1: Top 3 most-followed artists
WITH TopArtists AS (
    SELECT artist_id, name, followers
    FROM SpotifyArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT *
FROM TopArtists;

-- Task 2: Month-wise sales in 2023, then show the highest-sales month
WITH MonthlyTotals AS (
    SELECT
        MONTH(order_date) AS sales_month,
        SUM(total_amount) AS monthly_sales
    FROM FlipkartOrders
    WHERE order_date >= '2023-01-01'
      AND order_date < '2024-01-01'
    GROUP BY MONTH(order_date)
)
SELECT sales_month, monthly_sales
FROM MonthlyTotals
ORDER BY monthly_sales DESC
LIMIT 1;

-- Task 3: Recursive CTE for today and the next 6 days (7 dates total)
WITH RECURSIVE CalendarDays AS (
    SELECT CURDATE() AS day_date
    UNION ALL
    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM CalendarDays
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT day_date
FROM CalendarDays;

-- Task 4: Restaurants in cities where average rating is above 4.0
WITH CityAverage AS (
    SELECT city, AVG(rating) AS average_rating
    FROM ZomatoRestaurants
    GROUP BY city
)
SELECT
    r.id,
    r.name,
    r.city,
    r.rating,
    ca.average_rating
FROM ZomatoRestaurants AS r
JOIN CityAverage AS ca
    ON r.city = ca.city
WHERE ca.average_rating > 4.0;

-- Task 5: Teams scoring more than 2000 runs in 2023
WITH TeamRuns AS (
    SELECT team, SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT team, total_runs
FROM TeamRuns
WHERE total_runs > 2000;
