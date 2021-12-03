/* Do certain colleges produce more draft players than others? */

DROP TABLE IF EXISTS q2 CASCADE;

-- College's players participating in the draft
-- college is the college's name
-- total_players is the total numbers of draft players a college has produced over a specified number of years (in our scenario, 2018-2020)
-- rank_avg is the draft players average rank from the specified certain college
-- highest_rank is the highest rank draft player from the specified college
-- num_years is the total number of years a college had players participating in the draft over a specified number of years (in our scenario, max years is 3)
CREATE TABLE q2 (
    college TEXT NOT NULL,
    total_players INT,
    rank_avg INT,
    highest_rank INT,
    num_years INT
);

insert into q2
SELECT college, count(playerName) as total_players, sum(rank)/count(*) as rank_avg, min(rank) as highest_rank, count(DISTINCT year) as num_years
FROM PlayerInfoYearly
WHERE college is not NULL
GROUP BY college
HAVING count(playerName) > 1
ORDER BY count(DISTINCT year) DESC, count(playerName) DESC, min(rank);

SELECT * FROM q2;

DROP VIEW IF EXISTS HighestPlayerTotal CASCADE;

CREATE VIEW HighestPlayerTotal AS
SELECT max(total_players)
FROM q2;

-- This view shows us the college(s) with the top number or draft players
DROP VIEW IF EXISTS TopColleges CASCADE;

CREATE VIEW TopColleges AS
SELECT college, total_players, rank_avg, highest_rank, num_years
FROM q2, HighestPlayerTotal
WHERE total_players = max;

SELECT * FROM TopColleges;


/* EXPLORITORY WORK */

/*
New Question:
Do certain colleges produce more draft players than others?
How well did these college players do in comparison to others in the draft?
*/

/* This gives us the number of players drafted from
each college. It would be helpful to know how high these players 
ranked. Maybe find the average ranking of these players in 
colleges that had more than one draft player
*/

/* create table q2(
    total_players INT,
    college TEXT NOT NULL,
    rank_avg INT,
    highest_rank INT,
    lowest_rank INT	
);

insert into q2
SELECT count(*) total_players, college, sum(DraftInfo.rank)/count(*) as rank_avg, min(DraftInfo.rank) as highest_rank, max(DraftInfo.rank) as lowest_rank
FROM PlayerInfo 
LEFT JOIN DraftInfo ON PlayerInfo.PID = DraftInfo.PID
WHERE college is not NULL
GROUP BY college
HAVING count(*) > 1
ORDER BY count(*) DESC, rank_avg; */

/* ------------ 2018 RESULTS ------------ */
/*
 total_players |    college     | rank_avg | highest_rank | lowest_rank 
---------------+----------------+----------+--------------+-------------
             4 | Duke           |       16 |            2 |          37
             4 | Villanova      |       22 |           10 |          33
             4 | Kentucky       |       26 |            9 |          45
             2 | Michigan State |        8 |            4 |          12
             2 | Miami (FL)     |       30 |           18 |          42
             2 | Maryland       |       31 |           19 |          43
             2 | UCLA           |       40 |           23 |          58
             2 | Kansas         |       40 |           34 |          47
             2 | USC            |       47 |           46 |          49
(9 rows)
*/

/* ------------ 2019 RESULTS ------------ */
/*
 total_players |    college    | rank_avg | highest_rank | lowest_rank 
---------------+---------------+----------+--------------+-------------
             3 | Duke          |        4 |            1 |          10
             3 | UNC           |       14 |            7 |          25
             3 | Kentucky      |       18 |           12 |          29
             3 | Virginia      |       27 |            4 |          55
             3 | Tennessee     |       40 |           22 |          57
             2 | Gonzaga       |       15 |            9 |          21
             2 | Washington    |       31 |           20 |          43
             2 | Florida State |       37 |           27 |          48
             2 | Michigan      |       37 |           28 |          47
             2 | Iowa State    |       50 |           46 |          54
(10 rows)
*/

/* ------------ 2020 RESULTS ------------ */
/*
 total_players |      college      | rank_avg | highest_rank | lowest_rank 
---------------+-------------------+----------+--------------+-------------
             3 | Kentucky          |       29 |           21 |          42
             3 | Arizona           |       29 |           18 |          48
             3 | Duke              |       42 |           32 |          54
             2 | Florida State     |        7 |            4 |          11
             2 | Memphis           |       11 |            2 |          20
             2 | Washington        |       22 |           16 |          28
             2 | Vanderbilt        |       26 |           14 |          38
             2 | Michigan State    |       44 |           35 |          53
             2 | Mississippi State |       48 |           40 |          57
(9 rows)
*/

/* ------------ Findings Over 4 Years ------------ */
/*
We have noticed a trend with some universities over the past 4 years.
Kentucky and Duke have been consistently producing draftees between 2017-2020

Kentucky:

 total_players |      college      | rank_avg | highest_rank | lowest_rank 
---------------+-------------------+----------+--------------+-------------
2020
             3 | Kentucky          |       29 |           21 |          42
2019
             3 | Kentucky          |       18 |           12 |          29
2018
             4 | Kentucky          |       26 |            9 |          45

Total draftees from Kentucky (2018-2020): 10
Highest rank from Kentucky (2018-2020): 9

Duke:

 total_players |      college      | rank_avg | highest_rank | lowest_rank 
---------------+-------------------+----------+--------------+-------------
2020
             3 | Duke              |       42 |           32 |          54
2019
             3 | Duke              |        4 |            1 |          10
2018
             4 | Duke              |       16 |            2 |          37

Total draftees from Duke (2018-2020): 10
Highest rank from Duke (2018-2020): 1
*/


/*
Exploritory work idea: Change the schema such that the primary key is (year, rank/pid)
This way we can load in a dataset with the past five years without having to create their
own files.

Exploritory work idea: Find the average/median value for each university over the past 4/5 years
*/