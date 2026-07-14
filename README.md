# Video Game Sales Analysis

SQL exploratory data analysis on a dataset of 16,000+ video games, uncovering insights on platform performance, genre trends, publisher dominance, and regional sales patterns.

---

## Dataset

- **Source:** [Video Game Sales Dataset (Kaggle)](https://www.kaggle.com/datasets/gregorut/videogamesales)
- **File:** `video_games_sales.csv`
- **Size:** 16,598 records
- **Columns:** Rank, Name, Platform, Year, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales

---

## Tools Used

- **MySQL** — querying and analysis
- **MySQL Workbench** — data import and execution
- **PopSQL** — query editor
- **Tableau** — data visualization
- **Excel** — pivot tables, charts, XLOOKUPS, and SUMIFS

---

## Questions Explored

1. Which platform has the highest average global sales?
2. Which genres had more than 1,000 total games released?
3. What percent of global sales came from North America per genre?
4. Which publisher dominates each region (NA vs. EU vs. JP)?
5. How many games were released per year, and which year had the most?
6. How have global sales trended over the years?
7. What are the top 3 games in each genre by global sales?
8. How does each game's global sales compare to the average for its genre?

---

## Key Findings

- **Game Boy** had the highest average global sales per title despite a smaller library
- **2009** was the peak year for game releases
- **Action** was the most prolific genre with over 3,000 titles released
- **North America** accounts for the largest share of global sales across nearly every genre
- **Nintendo** dominates globally and in every individual region
- Global sales peaked around **2008–2009** and steadily declined afterward
- **Wii Sports** performed dramatically above the Sports genre average — the clearest outlier in the dataset

---

## SQL Concepts Demonstrated

| Concept | Used In |
|---|---|
| `GROUP BY` + `HAVING` | Genre game count filter |
| Aggregations (`SUM`, `AVG`, `COUNT`) | Sales and publisher queries |
| Calculated fields | NA sales percentage |
| `ROW_NUMBER() OVER (PARTITION BY)` | Top 3 games per genre |
| CTEs (`WITH ... AS`) | Genre ranking and genre average queries |
| Window functions (`SUM() OVER`) | Cumulative sales trend |

---

## Excel Rebuild
Rebuilt the analysis in Excel: pivot tables, XLOOKUP lookup panel, and SUMIFS regional breakdowns.

**Global Sales by Genre Pivot Table + Chart**
<img width="2503" height="1050" alt="image" src="https://github.com/user-attachments/assets/8185ef8e-ace1-4df5-acf5-552190461c72" />

**Top 10 Platforms Pivot Table + Chart**
<img width="2459" height="1041" alt="image" src="https://github.com/user-attachments/assets/2d875599-5e6d-4f1a-813b-47dda3c5e6d7" />

**XLOOKUP / SUMIFS Summary Sheet**
<img width="953" height="594" alt="image" src="https://github.com/user-attachments/assets/dec53a7d-59bd-4d3a-8a77-d8565ed23aef" />


## Files

- `video_games_sales.csv` — raw dataset
- `video_game_sales_analysis.sql` — all queries with comments and answers
