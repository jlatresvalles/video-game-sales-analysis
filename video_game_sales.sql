-- Load up the file in MySQL Workbench

-- Check if it works
SELECT *
FROM video_game_sales;

-- Which platform has the highest average global sales?
SELECT platform, ROUND(AVG(global_sales), 2) AS avg_sales
FROM video_game_sales
GROUP BY platform
ORDER BY avg_sales DESC;
-- Answer: The Game Boy was the platform with the highest average global sales.

-- Which genres had more than 1000 total games released?
SELECT genre, COUNT(*) AS num_games_released
FROM video_game_sales
GROUP BY genre
HAVING num_games_released > 1000
ORDER BY num_games_released DESC;
-- Answer: Action, Sports, Misc, Role-Playing, Shooter, Adventure, Racing

-- What percent of global sales came from North America per genre?
SELECT  genre, 
        ROUND(SUM(na_sales), 2) AS na_sales, 
        ROUND(SUM(global_sales), 2) AS global_sales, 
        ROUND(SUM(na_sales) / SUM(global_sales) * 100, 2) AS na_sale_percentage
FROM video_game_sales
GROUP BY genre
ORDER BY na_sale_percentage DESC;
-- Answer: Run the query.

-- Which publisher dominates each region (NA vs. EU vs. JP)?
SELECT publisher,
        ROUND(SUM(na_sales), 2) AS na_sales,
        ROUND(SUM(jp_sales), 2) AS jp_sales,
        ROUND(SUM(eu_sales), 2) AS eu_sales,
        ROUND(SUM(global_sales), 2) AS global_sales
FROM video_game_sales
GROUP BY publisher
ORDER BY global_sales DESC;
-- Answer: Nintendo globally dominates globally and in each region.

-- How many games were released per year, and which year had the most?
SELECT release_year, COUNT(*) AS num_games_per_year
FROM video_game_sales
GROUP BY release_year
ORDER BY num_games_per_year DESC;
-- Answer: 2009 was the year with the most games released.

-- How have global sales trended over the years?
SELECT  release_year,
        ROUND(SUM(global_sales), 2) AS yearly_sales,
        ROUND(SUM(SUM(global_sales)) OVER (ORDER BY release_year), 2) AS cumulative_sales
FROM video_game_sales
GROUP BY release_year
ORDER BY release_year ASC;
-- Answer: Sales peaked at around 2008-2009 and declined afterwards.

-- What are the top 3 games in each genre by global sales?
WITH ranked AS (
    SELECT  name, genre, global_sales,
        ROW_NUMBER() OVER (PARTITION BY genre ORDER BY global_sales DESC) as ranking
    FROM video_game_sales
)
SELECT genre, name, global_sales
FROM ranked
WHERE ranking <= 3
ORDER BY genre, ranking;
-- Answer: Run the query.

-- How does each game's global sales compare to the average for its genre?
SELECT  name, genre, global_sales,
        ROUND(AVG(global_sales) OVER (PARTITION BY genre), 2) AS avg_genre_sales
FROM video_game_sales;

WITH genre_avg AS (
    SELECT  name, genre, global_sales,
        ROUND(AVG(global_sales) OVER (PARTITION BY genre), 2) AS avg_genre_sales
    FROM video_game_sales
)
SELECT  name, genre, global_sales, avg_genre_sales,
        ROUND(global_sales - avg_genre_sales, 2) AS diff_from_avg_sales
FROM genre_avg
ORDER BY diff_from_avg_sales DESC;
-- Answer: Wii Sports performed way better than any Sports genre.