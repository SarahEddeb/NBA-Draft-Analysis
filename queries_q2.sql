/* Do certain colleges produce more draft players than others? Has it changed over the years? */

/* This gives us the number of players drafted from
each college. It would be helpful to know how high these players 
ranked. Maybe find the average ranking of these players in 
colleges that had more than one draft player

Currently we are only looking at 2020 stats 
*/
SELECT count(*), college, sum(DraftInfo.rank)/count(*) as rankavg, min(DraftInfo.rank), max(DraftInfo.rank)
FROM PlayerInfo 
LEFT JOIN DraftInfo ON PlayerInfo.PID = DraftInfo.PID
WHERE college is not NULL
GROUP BY college
HAVING count(*) > 1
ORDER BY count(*) DESC, rankavg;

/* ------------ 2017 RESULTS ------------ */
/*
 count |    college    | rankavg | min | max 
-------+---------------+---------+-----+-----
     4 | Duke          |      16 |   3 |  31
     4 | Oregon        |      42 |  38 |  45
     3 | Kentucky      |      10 |   5 |  14
     3 | UCLA          |      22 |   2 |  47
     2 | Kansas        |      19 |   4 |  34
     2 | UNC           |      21 |  15 |  28
     2 | Florida State |      23 |   6 |  40
     2 | Arizona       |      30 |   7 |  53
     2 | Gonzaga       |      32 |  10 |  55
     2 | Indiana       |      32 |  23 |  42
     2 | SMU           |      41 |  37 |  46
     2 | California    |      45 |  35 |  56
(12 rows)
*/

/* ------------ 2018 RESULTS ------------ */
/*
 count |    college     | rankavg | min | max 
-------+----------------+---------+-----+-----
     4 | Duke           |      16 |   2 |  37
     4 | Villanova      |      22 |  10 |  33
     4 | Kentucky       |      26 |   9 |  45
     2 | Michigan State |       8 |   4 |  12
     2 | Miami (FL)     |      30 |  18 |  42
     2 | Maryland       |      31 |  19 |  43
     2 | UCLA           |      40 |  23 |  58
     2 | Kansas         |      40 |  34 |  47
     2 | USC            |      47 |  46 |  49
(9 rows)
*/

/* ------------ 2019 RESULTS ------------ */
/*
 count |    college    | rankavg | min | max 
-------+---------------+---------+-----+-----
     3 | Duke          |       4 |   1 |  10
     3 | UNC           |      14 |   7 |  25
     3 | Kentucky      |      18 |  12 |  29
     3 | Virginia      |      27 |   4 |  55
     3 | Tennessee     |      40 |  22 |  57
     2 | Gonzaga       |      15 |   9 |  21
     2 | Washington    |      31 |  20 |  43
     2 | Michigan      |      37 |  28 |  47
     2 | Florida State |      37 |  27 |  48
     2 | Iowa State    |      50 |  46 |  54
(10 rows)
*/

/* ------------ 2020 RESULTS ------------ */
/*
 count |      college      | rankavg | min | max 
-------+-------------------+---------+-----+-----
     3 | Kentucky          |      29 |  21 |  42
     3 | Arizona           |      29 |  18 |  48
     3 | Duke              |      42 |  32 |  54
     2 | Florida State     |       7 |   4 |  11
     2 | Memphis           |      11 |   2 |  20
     2 | Washington        |      22 |  16 |  28
     2 | Vanderbilt        |      26 |  14 |  38
     2 | Michigan State    |      44 |  35 |  53
     2 | Mississippi State |      48 |  40 |  57
(9 rows)
*/

/* ------------ Findings Over 4 Years ------------ */
/*
We have noticed a trend with some universities over the past 4 years.
Kentucky and Duke have been consistently producing draftees between 2017-2020

Kentucky:

 count |      college      | rankavg | min | max 
-------+-------------------+---------+-----+-----
2020
     3 | Kentucky          |      29 |  21 |  42
2019
     3 | Kentucky          |      18 |  12 |  29
2018
     4 | Kentucky          |      26 |   9 |  45
2017
     3 | Kentucky          |      10 |   5 |  14

Total draftees from Kentucky (2017-2020): 13

Duke:

 count |      college      | rankavg | min | max 
-------+-------------------+---------+-----+-----
2020
     3 | Duke              |      42 |  32 |  54
2019
     3 | Duke              |       4 |   1 |  10
2018
     4 | Duke              |      16 |   2 |  37
2017
     4 | Duke              |      16 |   3 |  31

Total draftees from Duke (2017-2020): 14
*/


/*
Exploritory work idea: Change the schema such that the primary key is (year, rank/pid)
This way we can load in a dataset with the past five years without having to create their
own files.

Exploritory work idea: Find the average/median value for each university over the past 4/5 years
*/