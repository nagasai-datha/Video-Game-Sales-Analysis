CREATE DATABASE video_game_analysis;
USE video_game_analysis;
CREATE TABLE video_game_data (
    title VARCHAR(255),
    platform VARCHAR(50),
    publisher VARCHAR(100),
    sales_genre VARCHAR(50),
    release_year INT,
    rating FLOAT,

    na_sales FLOAT,
    eu_sales FLOAT,
    jp_sales FLOAT,
    other_sales FLOAT,
    global_sales FLOAT,

    plays INT,
    playing INT,
    backlogs INT,
    wishlist INT,

    num_reviews INT,
    sales_per_review FLOAT,
    engagement_ratio FLOAT
);
SHOW TABLES;
USE video_game_analysis;

SELECT COUNT(*) FROM video_game_data;

SELECT * FROM video_game_data LIMIT 10;

ALTER TABLE video_game_data
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

SELECT COUNT(*) AS total_games
FROM video_game_data;

SELECT title, platform, global_sales
FROM video_game_data
ORDER BY global_sales DESC
LIMIT 10;

SELECT platform, SUM(global_sales) AS total_sales
FROM video_game_data
GROUP BY platform
ORDER BY total_sales DESC;

SELECT sales_genre, SUM(global_sales) AS genre_sales
FROM video_game_data
GROUP BY sales_genre
ORDER BY genre_sales DESC;

SELECT COUNT(*) FROM video_game_data;

SELECT * FROM video_game_data LIMIT 5;

SELECT 
COUNT(*) AS total_rows,
SUM(title IS NULL) AS null_title,
SUM(global_sales IS NULL) AS null_global_sales,
SUM(platform IS NULL) AS null_platform
FROM video_game_data;

SELECT
ROUND(SUM(global_sales),2) AS total_global_sales,
ROUND(AVG(global_sales),2) AS avg_game_sales,
MAX(global_sales) AS highest_game_sales,
MIN(global_sales) AS lowest_game_sales
FROM video_game_data;

SELECT
platform,
ROUND(SUM(global_sales),2) AS platform_total_sales
FROM video_game_data
GROUP BY platform
ORDER BY platform_total_sales DESC limit 10;

SELECT
sales_genre,
ROUND(SUM(global_sales),2) AS genre_total_sales
FROM video_game_data
GROUP BY sales_genre
ORDER BY genre_total_sales DESC limit 10;

SELECT
release_year,
ROUND(SUM(global_sales),2) AS year_total_sales
FROM video_game_data
GROUP BY release_year
ORDER BY year_total_sales DESC
LIMIT 10;

select platform , sales_genre , release_year , round(sum(global_sales),2) as total_sales
from video_game_data group by platform , sales_genre , release_year limit 10;