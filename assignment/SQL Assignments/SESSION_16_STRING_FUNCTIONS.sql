-- SESSION 16: String Functions (MySQL)
-- Topics: CONCAT, LOWER, UPPER, SUBSTR, LEFT, RIGHT, REPLACE, TRIM

-- Demo: Clean inconsistent product codes
SELECT
    item_code,
    TRIM(item_code) AS cleaned_item_code,
    UPPER(TRIM(item_code)) AS standardized_item_code
FROM food_items;

-- Task 1: Combine first and last names into full_name
SELECT
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM users;

-- Task 2: Display song titles in uppercase
SELECT UPPER(song_title) AS uppercase_song_title
FROM playlists;

-- Task 3: Remove leading and trailing spaces from item codes
SELECT
    item_code,
    TRIM(item_code) AS cleaned_item_code
FROM food_items;

-- Task 4: Extract the last 7 characters from IMDb ID
SELECT
    imdb_id,
    RIGHT(imdb_id, 7) AS movie_number
FROM movies;

-- Task 5: Replace dashes with underscores in SKU codes
SELECT
    sku_code,
    REPLACE(sku_code, '-', '_') AS updated_sku_code
FROM products;

-- Extra practice: LOWER, LEFT, SUBSTRING
SELECT
    LOWER(song_title) AS lowercase_title,
    LEFT(song_title, 5) AS first_five_characters,
    SUBSTRING(song_title, 1, 5) AS first_five_using_substring
FROM playlists;
