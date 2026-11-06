-- SESSION 10: UNION and UNION ALL (MySQL)

CREATE DATABASE IF NOT EXISTS union_practice_db;
USE union_practice_db;

DROP TABLE IF EXISTS AppOrders;
DROP TABLE IF EXISTS InStoreOrders;

CREATE TABLE AppOrders (
    order_id INT,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE InStoreOrders (
    order_id INT,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

-- Task 1: Insert at least 3 sample records into each table
INSERT INTO AppOrders VALUES
(1, 'Aarav', 450.00, '2026-01-05'),
(2, 'Diya', 700.00, '2026-01-06'),
(3, 'Kabir', 550.00, '2026-01-07');

INSERT INTO InStoreOrders VALUES
(101, 'Diya', 300.00, '2026-01-05'),
(102, 'Meera', 900.00, '2026-01-08'),
(103, 'Jay', 650.00, '2026-01-09');

-- Task 2: UNION combines customer names and removes duplicates
SELECT customer_name FROM AppOrders
UNION
SELECT customer_name FROM InStoreOrders;

-- Task 3: UNION ALL combines every order and keeps duplicates
SELECT order_id, customer_name, amount, order_date FROM AppOrders
UNION ALL
SELECT order_id, customer_name, amount, order_date FROM InStoreOrders;

-- Task 4: Add a repeated customer name to both tables
INSERT INTO AppOrders VALUES
(4, 'Meera', 250.00, '2026-01-10');

INSERT INTO InStoreOrders VALUES
(104, 'Meera', 400.00, '2026-01-11');

-- Compare the number of rows returned by UNION and UNION ALL
SELECT COUNT(*) AS unique_customer_names
FROM (
    SELECT customer_name FROM AppOrders
    UNION
    SELECT customer_name FROM InStoreOrders
) AS unique_names;

SELECT COUNT(*) AS all_customer_name_rows
FROM (
    SELECT customer_name FROM AppOrders
    UNION ALL
    SELECT customer_name FROM InStoreOrders
) AS all_names;
