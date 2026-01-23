-- Cleaning Panthers Offense, Defense, and Team Stats tables
SELECT * FROM panthers_offense_log;

DELETE FROM panthers_offense_log
WHERE Rk = 'Rk' OR result = '8-9';

SELECT * FROM panthers_defense_log;

DELETE FROM panthers_defense_log
WHERE Rk = 'Rk' OR result = '8-9';

SELECT * FROM panthers_team_stats;

DELETE FROM panthers_team_stats
WHERE "Team" IN ('Team', 'Lg Rank Offense', 'Lg Rank Defense');

DELETE FROM panthers_team_stats
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM panthers_team_stats
    GROUP BY "Team", pts_scored, tot_yds, tot_plys, yds_per_ply, tov, fmbl
);

-- Cleaning Falcons tables

SELECT * FROM falcons_offense_log;

DELETE FROM falcons_offense_log
WHERE Rk = 'Rk' OR result = '8-9';

SELECT * FROM falcons_defense_log;

DELETE FROM falcons_defense_log
WHERE Rk = 'Rk' OR result = '8-9';

SELECT * FROM falcons_team_stats;

DELETE FROM falcons_team_stats
WHERE "Team" IN ('Team', 'Lg Rank Offense', 'Lg Rank Defense');

-- Cleaning Bucs tables

SELECT * FROM bucs_offense_log;

DELETE FROM bucs_offense_log
WHERE Rk = 'Rk' OR result = '8-9';

SELECT * FROM bucs_defense_log;

DELETE FROM bucs_defense_log
WHERE Rk = 'Rk' OR result = '8-9';

SELECT * FROM bucs_team_stats;

DELETE FROM bucs_team_stats
WHERE "Team" IN ('Team', 'Lg Rank Offense', 'Lg Rank Defense');

-- Cleaning Saints tables

SELECT * FROM saints_offense_log;

DELETE FROM saints_offense_log
WHERE Rk = 'Rk' OR result = '6-11';

SELECT * FROM saints_defense_log;

DELETE FROM saints_defense_log
WHERE Rk = 'Rk' OR result = '6-11';

SELECT * FROM saints_team_stats;

DELETE FROM saints_team_stats
WHERE Team = 'Team';