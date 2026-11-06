-- SESSION 20: Import/Export Data (CSV, Excel, Python, Power BI) - MySQL
-- This file contains MySQL commands and comments for the external-tool steps.

CREATE DATABASE IF NOT EXISTS data_import_export_db;
USE data_import_export_db;

-- Task 1: Create a destination table for IPL match CSV data.
-- Adjust column names/types to match the exact CSV headers and dataset.
CREATE TABLE IF NOT EXISTS ipl_matches (
    match_id INT,
    season VARCHAR(20),
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    winner VARCHAR(100),
    match_date DATE,
    venue VARCHAR(150)
);

-- Import the CSV using MySQL Workbench:
-- 1. Right-click the target table (or use Table Data Import Wizard).
-- 2. Choose the CSV file and map the CSV columns to table columns.
-- 3. Review the preview and finish the import.
--
-- Alternative LOAD DATA LOCAL INFILE template (edit the file path and columns):
-- LOAD DATA LOCAL INFILE 'C:/your_folder/ipl_matches.csv'
-- INTO TABLE ipl_matches
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (match_id, season, team1, team2, winner, match_date, venue);

-- Task 2: Select matches involving Mumbai Indians.
-- Assumes team1 and team2 contain participating team names.
SELECT *
FROM ipl_matches
WHERE team1 = 'Mumbai Indians'
   OR team2 = 'Mumbai Indians';

-- Export as mi_matches.csv from MySQL Workbench:
-- Run the SELECT query, then use the Result Grid export option
-- and choose CSV format with the filename mi_matches.csv.

-- Task 3: Excel connection steps (not SQL commands):
-- Excel > Data > Get Data > From Database > From MySQL Database.
-- Enter server/database details, select ipl_matches, then Load.
-- Create a PivotTable with team name in Rows and match count in Values.
-- If counting appearances, use team1 and team2 as separate source fields
-- or reshape them into one team column in Power Query.

-- Task 4: Power BI connection steps (not SQL commands):
-- Get Data > MySQL database, enter server/database, choose Import or DirectQuery.
-- Load ipl_matches. Build a team-wise wins visual using winner as the category
-- and count of match_id as the value; exclude blank winners if needed.

-- Task 5: Python/pandas workflow (Python code belongs in a .py or notebook file):
-- import pandas as pd
-- from sqlalchemy import create_engine
-- engine = create_engine("mysql+pymysql://USER:PASSWORD@HOST:3306/data_import_export_db")
-- mi = pd.read_csv("mi_matches.csv")
-- mi_wins = mi[mi["winner"] == "Mumbai Indians"]
-- mi_wins.to_sql("mi_wins", con=engine, if_exists="replace", index=False)
--
-- Note: Install compatible pandas, SQLAlchemy and PyMySQL packages first.
