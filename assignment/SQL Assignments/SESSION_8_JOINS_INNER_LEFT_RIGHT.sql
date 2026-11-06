-- SESSION 8: INNER JOIN, LEFT JOIN and RIGHT JOIN (MySQL)
-- Run this setup first. It creates sample Users and Orders tables.

CREATE DATABASE IF NOT EXISTS joins_practice_db;
USE joins_practice_db;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    segment_id INT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2)
);

INSERT INTO Users (user_id, username, city, segment_id) VALUES
(1, 'Aarav', 'Ahmedabad', 1),
(2, 'Diya', 'Surat', 2),
(3, 'Kabir', 'Vadodara', 1),
(4, 'Meera', 'Junagadh', NULL);

INSERT INTO Orders (order_id, user_id, product, amount) VALUES
(101, 1, 'Headphones', 1200.00),
(102, 1, 'Keyboard', 800.00),
(103, 2, 'Shoes', 2500.00),
(104, 3, 'Backpack', 900.00),
(105, 99, 'Mouse', 450.00);

-- Task 2: INNER JOIN shows only users who have matching orders
SELECT u.username, o.product
FROM Users AS u
INNER JOIN Orders AS o
    ON u.user_id = o.user_id;

-- Task 3: LEFT JOIN shows every user; users without orders get NULL
SELECT u.username, o.product
FROM Users AS u
LEFT JOIN Orders AS o
    ON u.user_id = o.user_id;

-- Task 4: RIGHT JOIN shows every order; unmatched user gets NULL username
SELECT o.order_id, o.product, u.username
FROM Users AS u
RIGHT JOIN Orders AS o
    ON u.user_id = o.user_id;

-- Task 5: Create customer segments and connect them to Users
CREATE TABLE IF NOT EXISTS CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50) NOT NULL
);

INSERT INTO CustomerSegments (segment_id, segment_name) VALUES
(1, 'Premium'),
(2, 'Regular');

-- Add a foreign key relationship (run once; skip if already added)
-- ALTER TABLE Users
-- ADD CONSTRAINT fk_users_segment
-- FOREIGN KEY (segment_id) REFERENCES CustomerSegments(segment_id);

-- Show username, segment name and total order amount
SELECT
    u.username,
    cs.segment_name,
    COALESCE(SUM(o.amount), 0) AS total_order_amount
FROM Users AS u
LEFT JOIN CustomerSegments AS cs
    ON u.segment_id = cs.segment_id
LEFT JOIN Orders AS o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.username, cs.segment_name;
