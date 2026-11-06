-- SESSION 11: Subqueries (Scalar, Row and Table) - MySQL

-- Demo: Employees earning above the company average salary
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Task 1: Restaurants rated above the overall average rating
SELECT restaurant_name, rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);

-- Task 2: Product name with its category's average price (scalar subquery)
SELECT
    p.name,
    p.price,
    p.category,
    (
        SELECT AVG(p2.price)
        FROM Products AS p2
        WHERE p2.category = p.category
    ) AS category_average_price
FROM Products AS p;

-- Task 3: Users whose playlist count is above the average count per user
SELECT
    u.username,
    pc.playlist_count
FROM Users AS u
JOIN (
    SELECT user_id, COUNT(*) AS playlist_count
    FROM Playlists
    GROUP BY user_id
) AS pc
    ON u.user_id = pc.user_id
WHERE pc.playlist_count > (
    SELECT AVG(user_playlist_count)
    FROM (
        SELECT COUNT(*) AS user_playlist_count
        FROM Playlists
        GROUP BY user_id
    ) AS playlist_counts
);

-- Task 4: User IDs with at least one order above the average order amount
SELECT DISTINCT user_id
FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
);
