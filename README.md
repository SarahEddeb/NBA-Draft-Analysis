# NBA Draft Analysis
A comprehensive SQL-based system for analyzing player physique data and comparing top draft prospects.

## Overview
This project analyzes trends in the NBA draft using SQL and data visualization to answer key investigative questions about players' physiques, college contributions, and the success of top draft picks. The analysis spans the 2018–2020 NBA drafts, utilizing data from combined measurements, player statistics, and draft results.

## Investigative Questions
### 1. Is there an ideal physique for NBA draft players?
We analyzed combine measurements, focusing on trends in height, weight, and body fat percentage among top-ranked players.

**Findings:**
- Height: No significant trends; heights remained consistent due to the nature of basketball.\
- Weight and Body Fat: An increase in both metrics among 2020 draft players, potentially linked to the NBA’s shift to more aggressive gameplay, which favors heavier players for physical matchups.
### 2. Do certain colleges produce more NBA draft players?
- We evaluated draft data to identify colleges that produce the most NBA draft players and their overall performance.

**Approach:**

- Aggregated data from 2018–2020 drafts.
- Created a table with player details, including year, rank, and college affiliation.

**Findings:**

- Duke and Kentucky were the top-performing colleges, each producing 10 draft players over three years.
- Duke outperformed Kentucky in average player rank (20 vs. 24) and had the highest-ranked draft player at #1.
  
### 3. Are number-one picks the most successful players from their draft year?
We examined player success through key performance statistics rather than subjective measures like championships or All-Star appearances.

**Metrics Used:**

- Shooting percentages (efficiency).
- Points, assists, and rebounds per game.
  
**Findings:**

Higher-drafted players generally outperformed lower-ranked ones.
Top 10 players in metrics like field goal percentage and points per game had an average rank of 13, making them the most successful performers.

## Key SQL Queries
The following SQL files contain the queries used for our analysis:

1. queries_q1.sql: Ideal physique trends.
2. queries_q2.sql: College contributions.
3. queries_q3.sql: Player success metrics.

## Project Structure
- /data: Raw data files used for analysis.
- /sql: SQL scripts for querying and analysis.
- /results: Output tables and visualizations.

## Usage
1. Clone the repository:
```
git clone https://github.com/SarahEddeb/NBA-Draft-Analysis.git
```
2. Navigate to the project directory:
```
cd NBA-Draft-Analysis
```
3. Load the data and execute the queries using your preferred SQL environment.\

## Contributors
Sarah Eddeb\
Danyal Khan

