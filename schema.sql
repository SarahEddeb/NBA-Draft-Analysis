DROP SCHEMA IF EXISTS NBAPlayers CASCADE;
CREATE SCHEMA NBAPlayers;
SET SEARCH_PATH TO NBAPlayers;

-- A player 
-- PID is the player's ID
-- playerName is the first and last name of the player
-- team is the name of the team the player was drafted to
-- college is the college name the player attended before entering the draft
CREATE TABLE PlayerInfo (
    PID INT,
    playerName TEXT NOT NULL,
    team TEXT NOT NULL,
    college TEXT DEFAULT 'N/A',
    PRIMARY KEY (PID)
);

-- A player in the draft
-- PID is the player's ID
-- rank is the players rank in the draft
-- draftRound is the round the player was drafted in 
CREATE TABLE DraftInfo (
    PID INT,
    rank INT,
    draftRound INT,
    PRIMARY KEY (rank),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);

-- A player's career
-- PID is the player's ID
-- yearsPlayed is the number of years the player played in the NBA
-- gamesPlayed is the total number of games the player played in the NBA
-- minutesPlayed is the total number of minutes the player played in the NBA
CREATE TABLE Career (
    PID INT,
    yearsPlayed INT,
    gamesPlayed INT,
    minutesPlayed INT,
    PRIMARY KEY (PID),
    FOREIGN KEY (PID) REFERENCES PlayerInfo(PID)
);