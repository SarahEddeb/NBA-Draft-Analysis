/* Are the number one picks in the draft the most successful players from their year?  */

DROP VIEW IF EXISTS TopFieldGoalPercentage;
DROP VIEW IF EXISTS TopThreePointPercentage;
DROP VIEW IF EXISTS TopFreeThrowPercentage;
DROP VIEW IF EXISTS AvgFieldGoalPercentage;
DROP VIEW IF EXISTS AvgThreePointFieldGoalPercentage;
DROP VIEW IF EXISTS AvgFreeThrowPercentage;
DROP VIEW IF EXISTS AvgRankPPG;
DROP VIEW IF EXISTS AvgRankAPG;
DROP VIEW IF EXISTS AvgRankRPG;
DROP VIEW IF EXISTS TopPPG;
DROP VIEW IF EXISTS TopAPG;
DROP VIEW IF EXISTS TopRPG;

/* 
First start off by looking at which players have the best field goal percentage, three point shot percentage and free throw percentage which is the % of shots that go in for them. 
These three percentages are an important metric in dictating the success of a player. Obviously players who have higher shot percentages are more likely to have a longer
career in the NBA as teams will find them more valuable. We see right off the bat that the results of the players have range of 40%-64% for the field goal percentages where
the players above 50% stand out. Players have a range of 30%-47% for three point shot percentages where players above 40% stand out. Finally players have a range of 72%-90% for 
free throw percentages where players above 85% stand out. 

These queries however lead to the next a question which is how many of the top 10 players, who are considered lottery players in the NBA draft, actually show up in the top 10 
field goal percentage, three point percentage and free throw percentage. We can get an idea by calculating the average rank of the top 10 players with the highest field goal 
percentage, three point percentage and free throw percentage.
*/
/* Best Field Goal Percentages  */
CREATE VIEW TopFieldGoalPercentage AS
/* Query #1 */
SELECT shooting.pid,playerName, fieldgoalpercentage
FROM Shooting, Career, DraftInfo
WHERE Shooting.pid = Career.pid  and Shooting.pid = DraftInfo.pid and Career.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by fieldgoalpercentage DESC;

/* - 2020 RESULTS - */
/* 
 pid |     playername     | fieldgoalpercentage 
-----+--------------------+---------------------
   6 | Onyeka Okongwu     |                64.4
  16 | Isaiah Stewart     |                55.2
  35 | Xavier Tillman Sr. |                55.1
  52 | Kenyon Martin Jr.  |                52.1
   2 | James Wiseman      |                51.9
   8 | Obi Toppin         |                51.5
  22 | Zeke Nnaji         |                49.2
  41 | Tre Jones          |                49.1
   4 | Patrick Williams   |                48.6
  21 | Tyrese Maxey       |                48.2
  20 | Precious Achiuwa   |                47.8
  12 | Tyrese Haliburton  |                46.9
  30 | Desmond Bane       |                46.4
  38 | Saben Lee          |                46.4
  28 | Jaden McDaniels    |                44.2
  18 | Josh Green         |                44.1
  24 | R.J. Hampton       |                43.1
   3 | LaMelo Ball        |                  43
  45 | Jordan Nwora       |                42.9
  11 | Devin Vassell      |                42.7
  53 | Cassius Winston    |                42.4
  33 | Daniel Oturu       |                42.3
  26 | Payton Pritchard   |                42.3
   9 | Deni Avdija        |                41.9
   1 | Anthony Edwards    |                41.8
   5 | Isaac Okoro        |                41.3
*/

/* Best Three Point Percentages */
CREATE VIEW TopThreePointPercentage AS
/* Query #2 */
SELECT shooting.pid,playerName, threepointfieldgoalpercentage
FROM Shooting, Career, DraftInfo
WHERE Shooting.pid = Career.pid  and Shooting.pid = DraftInfo.pid and Career.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by threepointfieldgoalpercentage DESC;

/* - 2020 RESULTS - */
/* 
 pid |     playername     | threepointfieldgoalpercentage 
-----+--------------------+-------------------------------
  53 | Cassius Winston    |                          47.1
  22 | Zeke Nnaji         |                          43.5
  30 | Desmond Bane       |                          40.8
  12 | Tyrese Haliburton  |                          40.6
  45 | Jordan Nwora       |                          39.8
  26 | Payton Pritchard   |                          39.6
   4 | Patrick Williams   |                          39.6
  25 | Immanuel Quickley  |                          38.8
  41 | Tre Jones          |                          37.5
  19 | Saddiq Bey         |                            37
  48 | Nico Mannion       |                          36.7
  11 | Devin Vassell      |                          36.2
   3 | LaMelo Ball        |                          36.1
  52 | Kenyon Martin Jr.  |                          35.7
  15 | Cole Anthony       |                          35.2
  28 | Jaden McDaniels    |                            35
  21 | Tyrese Maxey       |                          34.6
  24 | R.J. Hampton       |                          34.4
  49 | Isaiah Joe         |                          34.4
  14 | Aaron Nesmith      |                          33.1
   1 | Anthony Edwards    |                            33
  29 | Malachi Flynn      |                          32.2
  34 | Théo Maledon       |                          32.2
   2 | James Wiseman      |                          31.6
   9 | Deni Avdija        |                          31.5
  16 | Isaiah Stewart     |                          30.6
*/

/* Best Free Throw Percentages */
CREATE VIEW TopFreeThrowPercentage AS
/* Query #3 */
SELECT shooting.pid,playerName, freethrowpercentage
FROM Shooting, Career, DraftInfo
WHERE Shooting.pid = Career.pid  and Shooting.pid = DraftInfo.pid and Career.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by freethrowpercentage DESC;

/* - 2020 RESULTS - */
/* 
 pid |     playername     | freethrowpercentage 
-----+--------------------+---------------------
  41 | Tre Jones          |                90.9
  25 | Immanuel Quickley  |                89.3
  26 | Payton Pritchard   |                88.9
  21 | Tyrese Maxey       |                  86
  12 | Tyrese Haliburton  |                85.1
  13 | Kira Lewis Jr.     |                84.6
  30 | Desmond Bane       |                84.6
  15 | Cole Anthony       |                84.3
  53 | Cassius Winston    |                83.3
  19 | Saddiq Bey         |                82.4
  48 | Nico Mannion       |                82.1
  11 | Devin Vassell      |                80.8
  14 | Aaron Nesmith      |                  80
   3 | LaMelo Ball        |                78.7
  29 | Malachi Flynn      |                78.3
  54 | Cassius Stanley    |                77.8
   1 | Anthony Edwards    |                77.1
  57 | Reggie Perry       |                76.9
  45 | Jordan Nwora       |                76.5
  49 | Isaiah Joe         |                  76
  33 | Daniel Oturu       |                  75
  34 | Théo Maledon       |                74.8
  22 | Zeke Nnaji         |                73.9
   4 | Patrick Williams   |                73.6
  52 | Kenyon Martin Jr.  |                72.9
  17 | Aleksej Pokusevski |                  72
*/

/* 
Following through with our results from the previous 3 queries, we now investigate the average rank of the top 10 players with the highest field goal 
percentage, three point percentage and free throw percentage.

We see from the results of this query from the years 2018-2020 that the average lies outside of the 10 which means players outside the top 10 drafted players 
and performing just as well as players inside the top 10.
*/ 

/* Avg Draft ranking of the top 10 best field goal percentages*/
CREATE VIEW AvgFieldGoalPercentage AS
/* Query #4 */
SELECT avg(pid) as AvgDraftRank
FROM (SELECT shooting.pid,playerName, freethrowpercentage
FROM Shooting, Career, DraftInfo
WHERE Shooting.pid = Career.pid  and Shooting.pid = DraftInfo.pid and Career.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by fieldgoalpercentage DESC LIMIT 10) as foo;
/* - 2018 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 18.2000000000000000
*/

/* - 2019 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 31.7000000000000000
*/

/* - 2020 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 20.7000000000000000
*/

/* Avg Draft ranking of the top 10 best three point percentages*/
CREATE VIEW AvgThreePointFieldGoalPercentage AS
/* Query #5 */
SELECT avg(pid) as AvgDraftRank
FROM (SELECT shooting.pid,playerName, freethrowpercentage
FROM Shooting, Career, DraftInfo
WHERE Shooting.pid = Career.pid  and Shooting.pid = DraftInfo.pid and Career.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by threepointfieldgoalpercentage DESC LIMIT 10) as foo;
/* - 2018 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 23.3000000000000000
*/

/* - 2019 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 20.5000000000000000
*/

/* - 2020 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 27.7000000000000000
*/

/* Avg Draft ranking of the top 10 best free throw percentages*/
CREATE VIEW AvgFreeThrowPercentage AS
/* Query #6 */
SELECT avg(pid) as AvgDraftRank
FROM (SELECT shooting.pid,playerName, freethrowpercentage
FROM Shooting, Career, DraftInfo
WHERE Shooting.pid = Career.pid  and Shooting.pid = DraftInfo.pid and Career.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by freethrowpercentage DESC LIMIT 10) as foo;
/* - 2018 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 23.6000000000000000
*/

/* - 2019 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 20.7000000000000000
*/

/* - 2020 RESULTS -*/
/* 
    avgdraftrank     
---------------------
 25.5000000000000000
*/

/* 
In previous queries we were looking at shooting percentages and while those are important, just as important if not more is the actual players in game stats. For the sake 
of this assignment, we only look at the top 3 valuable stats which are points per game, assists per game and rebounds per game. 

Similar to the first 3 queries we did, these queries however lead to the next a question which is how many of the top 10 players, who are considered lottery players in the 
NBA draft, actually show up in the top 10 points per game, assists per game and rebounds per game. We can get an idea by calculating the average rank of the top 10 players
with the highest points per game, assists per game and rebounds per game.
*/


/* Highest player point per game averagers*/
CREATE VIEW TopPPG AS
/* Query #7 */
SELECT averagegamestats.pid, playerName, avgppg
FROM averagegamestats, Career, DraftInfo
WHERE averagegamestats.pid = Career.pid and Career.pid = DraftInfo.pid and averagegamestats.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by avgppg DESC;

/* - 2020 RESULTS - */
/* 
 pid |     playername     | avgppg 
-----+--------------------+--------
   1 | Anthony Edwards    |   19.9
   3 | LaMelo Ball        |   16.5
  15 | Cole Anthony       |   14.6
  12 | Tyrese Haliburton  |     13
  19 | Saddiq Bey         |   12.5
   2 | James Wiseman      |   11.5
  25 | Immanuel Quickley  |   10.8
  30 | Desmond Bane       |   10.1
  21 | Tyrese Maxey       |     10
   5 | Isaac Okoro        |    9.3
  34 | Théo Maledon       |    9.2
   4 | Patrick Williams   |    9.1
  52 | Kenyon Martin Jr.  |    8.6
  16 | Isaiah Stewart     |    7.9
  17 | Aleksej Pokusevski |    7.4
  24 | R.J. Hampton       |      7
  11 | Devin Vassell      |    6.9
  28 | Jaden McDaniels    |    6.7
  26 | Payton Pritchard   |    6.7
  45 | Jordan Nwora       |    6.5
  29 | Malachi Flynn      |    6.5
   9 | Deni Avdija        |    6.3
  35 | Xavier Tillman Sr. |    6.1
  13 | Kira Lewis Jr.     |      6
  20 | Precious Achiuwa   |    5.4
  38 | Saben Lee          |    5.2
*/

/* Highest player assists per game averagers*/
CREATE VIEW TopAPG AS
/* Query #8 */
SELECT averagegamestats.pid, playerName, avgapg
FROM averagegamestats, Career, DraftInfo
WHERE averagegamestats.pid = Career.pid and Career.pid = DraftInfo.pid and averagegamestats.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by avgapg DESC;
/* - 2020 RESULTS - */
/* 
 pid |     playername     | avgapg 
-----+--------------------+--------
   3 | LaMelo Ball        |    6.5
  12 | Tyrese Haliburton  |    5.3
  15 | Cole Anthony       |    4.5
  38 | Saben Lee          |    3.4
  34 | Théo Maledon       |    3.2
   1 | Anthony Edwards    |      3
  29 | Malachi Flynn      |    2.5
  21 | Tyrese Maxey       |    2.5
  48 | Nico Mannion       |    2.3
  13 | Kira Lewis Jr.     |    2.2
  25 | Immanuel Quickley  |    2.1
  17 | Aleksej Pokusevski |    1.9
   5 | Isaac Okoro        |    1.9
  30 | Desmond Bane       |    1.8
  24 | R.J. Hampton       |    1.7
  26 | Payton Pritchard   |    1.7
  19 | Saddiq Bey         |    1.6
   4 | Patrick Williams   |    1.3
   9 | Deni Avdija        |    1.2
  35 | Xavier Tillman Sr. |    1.2
  41 | Tre Jones          |    1.1
  28 | Jaden McDaniels    |    1.1
  11 | Devin Vassell      |      1
  52 | Kenyon Martin Jr.  |      1
  16 | Isaiah Stewart     |    0.9
   2 | James Wiseman      |    0.7
*/

/* Highest player rebounds per game averagers*/
CREATE VIEW TopRPG AS
/* Query #9 */
SELECT averagegamestats.pid, playerName, avgrpg
FROM averagegamestats, Career, DraftInfo
WHERE averagegamestats.pid = Career.pid and Career.pid = DraftInfo.pid and averagegamestats.pid = DraftInfo.pid and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by avgrpg DESC;
/* - 2020 RESULTS - */
/* 
 pid |     playername     | avgrpg 
-----+--------------------+--------
  16 | Isaiah Stewart     |    6.8
   3 | LaMelo Ball        |    6.3
   2 | James Wiseman      |    5.8
  15 | Cole Anthony       |    5.2
   1 | Anthony Edwards    |      5
   9 | Deni Avdija        |      5
  19 | Saddiq Bey         |    4.9
  52 | Kenyon Martin Jr.  |    4.7
  17 | Aleksej Pokusevski |    4.6
   4 | Patrick Williams   |    4.4
  20 | Precious Achiuwa   |    4.3
  35 | Xavier Tillman Sr. |    4.1
  28 | Jaden McDaniels    |    3.8
  24 | R.J. Hampton       |    3.4
   6 | Onyeka Okongwu     |    3.3
   5 | Isaac Okoro        |    3.3
  30 | Desmond Bane       |    3.2
  12 | Tyrese Haliburton  |    3.1
  34 | Théo Maledon       |    3.1
  11 | Devin Vassell      |      3
  57 | Reggie Perry       |    2.8
  14 | Aaron Nesmith      |    2.6
  45 | Jordan Nwora       |    2.5
   8 | Obi Toppin         |    2.5
  29 | Malachi Flynn      |    2.3
  26 | Payton Pritchard   |    2.3
*/

/* 
Following through with our results from the previous 3 queries, we now investigate the average rank of the top 10 players with the highest points per game, 
assists per game and rebounds per game.

We see in comparison to the average rank of top 10 players with the highest field goal percentage, three point percentage and free throw percentage, average 
rank of the top 10 players with the highest points per game, assists per game and rebounds per game are a lot lower meaning the top picks are performing better.
*/

/* Avg Draft ranking of the top 10 best Point Per Game Averages*/
CREATE VIEW AvgRankPPG AS
/* Query #10 */
SELECT avg(pid) as AvgDraftRank
FROM (SELECT averagegamestats.pid, avgppg
FROM averagegamestats, Career
WHERE averagegamestats.pid = Career.pid  and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by avgppg DESC LIMIT 10) as foo;
/* - 2018 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 9.4000000000000000
*/

/* - 2019 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 10.8000000000000000
*/

/* - 2020 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 13.3000000000000000
*/


/* Avg Draft ranking of the top 10 best Assits Per Game Averages*/
CREATE VIEW AvgRankAPG AS
/* Query #11 */
SELECT avg(pid) as AvgDraftRank
FROM (SELECT averagegamestats.pid, avgppg
FROM averagegamestats, Career
WHERE averagegamestats.pid = Career.pid  and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by avgapg DESC LIMIT 10) as foo;
/* - 2018 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 11.1000000000000000
*/

/* - 2019 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 13.5000000000000000
*/

/* - 2020 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 21.4000000000000000
*/

/* Avg Draft ranking of the top 10 best Rebounds Per Game Averages*/
CREATE VIEW AvgRankRPG AS
/* Query #12 */
SELECT avg(pid) as AvgDraftRank
FROM (SELECT averagegamestats.pid, avgppg
FROM averagegamestats, Career
WHERE averagegamestats.pid = Career.pid  and  Career.gamesPlayed > (Career.yearsPlayed * 21)
ORDER by avgrpg DESC LIMIT 10) as foo;
/* - 2018 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 19.6000000000000000
*/

/* - 2019 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 13.9000000000000000
*/

/* - 2020 RESULTS -*/
/* 
    avgdraftrank    
--------------------
 13.8000000000000000
*/

