-- SESSION 9: FULL OUTER JOIN, SELF JOIN and CROSS JOIN (MySQL)
-- MySQL does not directly support FULL OUTER JOIN.
-- Use LEFT JOIN UNION RIGHT JOIN to simulate it.

CREATE DATABASE IF NOT EXISTS advanced_joins_db;
USE advanced_joins_db;

DROP TABLE IF EXISTS influencers;
DROP TABLE IF EXISTS brands;

CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    influencer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO influencers VALUES
(1, 'Riya', 'Ahmedabad'),
(2, 'Arjun', 'Surat'),
(3, 'Neha', 'Rajkot');

INSERT INTO brands VALUES
(1, 'StyleHub', 'Ahmedabad'),
(2, 'TechWorld', 'Vadodara'),
(3, 'Foodies', 'Surat');

-- Task 1: FULL OUTER JOIN equivalent in MySQL
SELECT i.influencer_name, b.brand_name, i.city
FROM influencers AS i
LEFT JOIN brands AS b ON i.city = b.city
UNION
SELECT i.influencer_name, b.brand_name, b.city
FROM influencers AS i
RIGHT JOIN brands AS b ON i.city = b.city;

-- Task 2: Playlist SELF JOIN (playlist linked to its parent)
-- Assumes playlists(id, playlist_name, parent_playlist_id) exists.
SELECT
    child.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM playlists AS child
LEFT JOIN playlists AS parent
    ON child.parent_playlist_id = parent.id;

-- Task 3: CROSS JOIN: every user paired with every offer
-- Useful for preparing all possible user-offer combinations for a campaign.
-- Assumes users(user_name) and offers(offer_title) exist.
SELECT u.user_name, o.offer_title
FROM users AS u
CROSS JOIN offers AS o;

-- Task 4: Employee and manager names using SELF JOIN
SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.id;

-- Only top-level employees who do not have a manager
SELECT
    e.name AS top_level_manager
FROM employees AS e
WHERE e.manager_id IS NULL;

-- Task 5: All unique pairs of users in the same city (no self-pairs)
SELECT
    u1.user_name AS user_one,
    u2.user_name AS user_two,
    u1.city
FROM users AS u1
INNER JOIN users AS u2
    ON u1.city = u2.city
   AND u1.user_id < u2.user_id;
