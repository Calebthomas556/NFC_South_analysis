
CREATE VIEW nfc_south_offense_log AS
SELECT 'Panthers' AS team, * FROM panthers_offense_log
UNION ALL
SELECT 'Saints', * FROM saints_offense_log
UNION ALL
SELECT 'Falcons', * FROM falcons_offense_log
UNION ALL
SELECT 'Buccaneers', * FROM bucs_offense_log;

-- Passing Performance Analysis
-- Passing Volume Analysis ---------------------------------------------------------------------------------------------------
-- avg difference in pss attempts in wins vs losses
SELECT team,
    AVG(CASE WHEN result = 'W' THEN pass_att END)
  - AVG(CASE WHEN result = 'L' THEN pass_att END)
    AS avg_pass_att_diff
FROM nfc_south_offense_log
GROUP BY team;

-- Avg difference in passing yds in wins and losses
SELECT team,
    AVG(CASE WHEN result = 'W' THEN pass_yds END)
  - AVG(CASE WHEN result = 'L' THEN pass_yds END)
    AS avg_pass_yds_diff
FROM nfc_south_offense_log
GROUP BY team;

-- Avergae difference in percent of plays that are passes in wins and losses
SELECT team,
    AVG(CASE WHEN result = 'W' THEN pass_att * 1.0 / total_plays END)
    - AVG(CASE WHEN result = 'L' THEN pass_att * 1.0 / total_plays END)
    AS avg_perc_play_diff
    FROM nfc_south_offense_log
    GROUP BY team;


-- Passing Effeciency Analysis------------------------------------------------------------------------------------------------

SELECT
    team,
    AVG(CASE WHEN result = 'W' THEN comp_perc END)
  - AVG(CASE WHEN result = 'L' THEN comp_perc END)
    AS avg_comp_perc_diff
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
    AVG(CASE WHEN result = 'W' THEN pass_yds_per_att END)
    - AVG(CASE WHEN result = 'L' THEN pass_yds_per_att END)
    AS avg_yds_att_diff
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
    AVG(CASE WHEN result = 'W' THEN pass_yds * 1.0 / pass_cmp END)
    - AVG(CASE WHEN result = 'L' THEN pass_yds * 1.0 / pass_cmp END)
    AS avg_yds_cmp_diff
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
    AVG(CASE WHEN result = 'W' THEN qb_rating END)
    - AVG(CASE WHEN result = 'L' THEN qb_rating END)
    AS avg_qb_rating_diff
FROM nfc_south_offense_log
GROUP BY team;