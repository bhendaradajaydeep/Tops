-- SESSION 1: Introduction to Databases (MySQL)
-- Run these commands in MySQL Workbench.

-- 1. Create the demo database
CREATE DATABASE IF NOT EXISTS analytics_db;

-- 2. Select the database
USE analytics_db;

-- 3. Create the database required in Task 2
CREATE DATABASE IF NOT EXISTS music_streaming_db;

-- 4. Create the database required in Task 3
CREATE DATABASE IF NOT EXISTS food_delivery_db;

-- 5. Display all databases
SHOW DATABASES;

-- 6. Confirm the currently selected database
SELECT DATABASE();

-- NOTES:
-- A database stores related information in an organized way.
-- RDBMS means Relational Database Management System.
-- MySQL, PostgreSQL and Oracle Database are examples of RDBMS.
-- SQL is important in analytics because it helps retrieve, filter,
-- combine, summarize and prepare data for reports and dashboards.

-- MySQL vs PostgreSQL: 3 simple differences
-- 1. MySQL is often used in web applications; PostgreSQL is known
--    for advanced SQL features and complex data operations.
-- 2. PostgreSQL supports more advanced data types and extensibility;
--    MySQL is often considered straightforward to set up for common apps.
-- 3. Both support transactions and relational data, but differ in
--    SQL features, indexing options and implementation details.
--
-- Examples (illustrative, not an exhaustive user list):
-- MySQL: WordPress uses MySQL-compatible database deployments.
-- PostgreSQL: Instagram has used PostgreSQL as part of its data systems.
