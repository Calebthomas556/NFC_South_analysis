
CREATE VIEW nfc_south_offense_log AS
SELECT 'Panthers' AS team, * FROM panthers_offense_log
UNION ALL
SELECT 'Saints', * FROM saints_offense_log
UNION ALL
SELECT 'Falcons', * FROM falcons_offense_log
UNION ALL
SELECT 'Buccaneers', * FROM bucs_offense_log;

CREATE VIEW nfc_south_team_stats AS
SELECT 'Panthers' AS team, * FROM panthers_team_stats
UNION ALL
SELECT 'Saints', * FROM saints_team_stats
UNION ALL
SELECT 'Falcons', * FROM falcons_team_stats
UNION ALL
SELECT 'Buccaneers', * FROM bucs_team_stats;

CREATE VIEW nfc_south_defense_log AS
SELECT 'Panthers' AS team, * FROM panthers_defense_log
UNION ALL
SELECT 'Saints', * FROM saints_defense_log
UNION ALL
SELECT 'Falcons', * FROM falcons_defense_log
UNION ALL
SELECT 'Buccaneers', * FROM bucs_defense_log;

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

-- Rushing Analysis-----------------------------------------------------------------------------------------------------------
-- Rushing Volume -------------------------------------------------------------------------------------------------------------
-- Avg difference in rushing attempts
SELECT team, 
    AVG(CASE WHEN result = 'W' THEN rush_att END)
    - AVG(CASE WHEN result = 'L' THEN rush_att END)
    AS avg_rush_att_diff
FROM nfc_south_offense_log
GROUP BY team;

-- avg diff in percent of plays
SELECT team, 
    AVG(CASE WHEN result = 'W' THEN rush_att * 1.0 / total_plays END)
    - AVG(CASE WHEN result = 'L' THEN rush_att * 1.0 / total_plays END)
    AS avg_rush_perc_diff
FROM nfc_south_offense_log
GROUP BY team;

-- avg diff in percent of offensive scores

SELECT team, 
    AVG(CASE WHEN result = 'W' THEN rush_td * 1.0 / (rush_td + pass_td + fgm) END)
    - AVG(CASE WHEN result = 'L' THEN rush_td * 1.0 / (rush_td + pass_td + fgm) END)
    AS avg_rush_td_perc_diff
FROM nfc_south_offense_log
GROUP BY team;

-- Rushing Effiency --------------------------------------------------------------------------------------------------------
--AVG diff in Y/A
SELECT team, 
    AVG(CASE WHEN result = 'W' THEN rush_yds * 1.0 / rush_att END)
    - AVG(CASE WHEN result = 'L' THEN rush_yds * 1.0 / rush_att END)
    AS avg_yds_att_diff
FROM nfc_south_offense_log
GROUP BY team;

-- AVG diff rushing yards
SELECT team, 
    AVG(CASE WHEN result = 'W' THEN rush_yds END)
    - AVG(CASE WHEN result = 'L' THEN rush_yds END)
    AS avg_rush_yds_diff
FROM nfc_south_offense_log
GROUP BY team;

-- AVg diff in rushing tds
SELECT team, 
    AVG(CASE WHEN result = 'W' THEN rush_td END)
    - AVG(CASE WHEN result = 'L' THEN rush_td END)
    AS avg_rush_tds_diff
FROM nfc_south_offense_log
GROUP BY team;

-- Special Teams Analysis ------------------------------------------------------------------------------------------------------------------------------

SELECT team, 
AVG(CASE WHEN result = 'W' THEN fgm * 1.0 / (fgm + pass_td + rush_td) END) 
AS avg_fg_score_perc_win,
AVG(CASE WHEN result = 'L' THEN fgm * 1.0 / (fgm + pass_td + rush_td) END)
AS avg_fg_score_perc_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN fgm * 1.0 / fga END)
- AVG(CASE WHEN result = 'L' THEN fgm * 1.0 / fga END)
AS avg_fg_score_perc_diff
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN xpm * 1.0 / xpa END)
- AVG(CASE WHEN result = 'L' THEN xpm * 1.0 / xpa END)
AS avg_xp_score_perc_diff
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
    SUM(CASE WHEN result = 'L' AND (ptsa - pts) <= 3 THEN fga * 1.0 - fgm ELSE 0 END)
    AS missed_fg_close_losses
FROM nfc_south_offense_log
GROUP BY team;

SELECT 
    team,
    COUNT(CASE WHEN result = 'L' AND (ptsa - pts) <= 3 THEN 1 END)
     AS close_losses
FROM nfc_south_offense_log
GROUP BY team;

SELECT 
    team,
    SUM(CASE WHEN result = 'L' AND (ptsa - pts) <= 3 THEN (fga - fgm) ELSE 0 END) * 1.0
    / NULLIF(COUNT(CASE WHEN result = 'L' AND (ptsa - pts) <= 3 THEN 1 END), 0) 
    AS missed_fg_per_close_loss
FROM nfc_south_offense_log
GROUP BY team;

-- Sloppy Play Analysis --------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Turnover Gaps --------
SELECT team, 
AVG(CASE WHEN result = 'W' THEN turnovers END)
- AVG(CASE WHEN result = 'L' THEN turnovers END)
AS turnover_gap
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN ints END)
- AVG(CASE WHEN result = 'L' THEN ints END)
AS int_gap
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN fumb_lost END)
- AVG(CASE WHEN result = 'L' THEN fumb_lost END)
AS fumble_gap
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN time_of_poss END)
AS avg_top_win,
AVG(CASE WHEN result = 'L' THEN time_of_poss END)
AS avg_top_loss
FROM nfc_south_offense_log
GROUP BY team;

--Penalty -------

SELECT team, 
AVG(CASE WHEN result = 'W' THEN penalties END)
AS pen_in_wins,
AVG(CASE WHEN result = 'L' THEN penalties END)
AS pen_in_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN pen_yds END)
AS pen_yds_in_wins,
AVG(CASE WHEN result = 'L' THEN pen_yds END)
AS pen_yds_in_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' AND (pts - ptsa) <= 7 THEN penalties END)
AS pen_in_big_wins,
AVG(CASE WHEN result = 'W' AND (pts - ptsa) >= 7 THEN penalties END)
AS pen_in_close_win
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'L' AND (ptsa - pts) <= 7 THEN penalties END)
AS pen_in_big_loss,
AVG(CASE WHEN result = 'L' AND (ptsa - pts) >= 7 THEN penalties END)
AS pen_in_close_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'L' AND (ptsa - pts) <= 7 THEN penalties * 1.0 / total_plays END)
AS pen_per_play_big_loss,
AVG(CASE WHEN result = 'L' AND (ptsa - pts) >= 7 THEN penalties * 1.0 / total_plays END)
AS pen_per_play_close_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' AND (pts - ptsa) <= 7 THEN penalties * 1.0 / total_plays END)
AS pen_per_play_big_win,
AVG(CASE WHEN result = 'W' AND (pts - ptsa) >= 7 THEN penalties * 1.0 / total_plays END)
AS pen_per_play_close_win
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN penalties * 1.0 / total_plays END)
AS pen_per_play_wins,
AVG(CASE WHEN result = 'L' THEN penalties * 1.0 / total_plays END)
AS pen_per_play_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN pen_yds * 1.0 / total_yds END)
AS pen_yds_per_yd_wins,
AVG(CASE WHEN result = 'L' THEN pen_yds * 1.0 / total_yds END)
AS pen_yds_per_yd_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN pen_yds * 1.0 / total_plays END)
AS pen_yds_per_play_wins,
AVG(CASE WHEN result = 'L' THEN pen_yds * 1.0 / total_plays END)
AS pen_yds_per_play_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN pen_yds * 1.0 / penalties END)
AS pen_yds_per_pen_win,
AVG(CASE WHEN result = 'L' THEN pen_yds * 1.0 / penalties END)
AS pen_yds_per_pen_loss
FROM nfc_south_offense_log
GROUP BY team;

-- Sacks Allowed ------------

SELECT team, 
AVG(CASE WHEN result = 'W' THEN sacks_all END)
AS avg_sack_all_win,
AVG(CASE WHEN result = 'L' THEN sacks_all END)
AS avg_sack_all_loss
FROM nfc_south_offense_log
GROUP BY team;

SELECT team, 
AVG(CASE WHEN result = 'W' THEN yds_lost_sack END)
AS yds_lost_sack_win,
AVG(CASE WHEN result = 'L' THEN yds_lost_sack END)
AS yds_lost_sack_loss
FROM nfc_south_offense_log
GROUP BY team;