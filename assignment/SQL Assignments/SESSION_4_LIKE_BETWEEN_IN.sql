-- SESSION 4: LIKE, BETWEEN and IN (MySQL)

-- Task 1: Restaurant names ending with Cafe
SELECT *
FROM restaurants
WHERE restaurant_name LIKE '%Cafe';

-- Task 2: Products priced between Rs. 500 and Rs. 1500 (inclusive)
SELECT *
FROM products
WHERE price BETWEEN 500 AND 1500;

-- Task 3: Users from Ahmedabad, Surat or Vadodara
SELECT *
FROM users
WHERE city IN ('Ahmedabad', 'Surat', 'Vadodara');

-- Task 4: Songs where artist name contains 'ar' anywhere
SELECT song_name, artist_name
FROM songs
WHERE artist_name LIKE '%ar%';

-- Extra LIKE patterns:
-- 'M%'  = starts with M
-- '%a'  = ends with a
-- '%ar%' = contains ar
SELECT *
FROM customers
WHERE customer_name LIKE 'M%';
