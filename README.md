# NFC South Wins vs. Losses Analysis

## Project Overview

This project analyzes **regular season game performance** of the four NFC South teams — **Atlanta Falcons, Carolina Panthers, New Orleans Saints, and Tampa Bay Buccaneers** — with the goal of identifying **which on-field factors most strongly differentiate wins from losses**.

Rather than focusing on league-wide trends, this analysis is **team-specific**, comparing how each team performed **in wins vs. losses** across multiple areas of the game. The intent is to understand *how* these teams tend to win and *where* performance breaks down in losses.

This project is designed to demonstrate **analytical thinking, SQL proficiency, and sports analytics fundamentals**, making it suitable for review by recruiters and hiring managers in data, analytics, or sports-related roles.

---

## Key Questions

At a high level, this project seeks to answer:

* What statistical differences consistently appear between wins and losses for each NFC South team?
* Which areas of the game matter most for winning *within* this division?
* Are there categories where performance improves in wins but declines in losses (or vice versa)?

For each major category, **2–3 focused questions** were explored to isolate meaningful differences rather than relying on a single metric.

---

## Areas of Analysis

The analysis is organized into **six major areas of the game**:

1. **Passing**
2. **Rushing**
3. **Special Teams**
4. **Defense**
5. **Disciplined Play**
6. **Down & Situational Play**

Each area includes multiple metrics evaluated **in wins vs. losses**, allowing for deeper context than raw totals alone.

---

## Data Sources

* **Game-level regular season data** for each NFC South team
* Source: **Pro Football Reference**
* Dataset includes one row per team per game

The data reflects **team game logs only** and does not include play-by-play detail.

---

## Tools & Technologies

* **SQL**: Data cleaning, aggregation, and analysis
* **SQLite**: Lightweight relational database for storing game logs
* **VS Code**: Development environment
* **Git & GitHub**: Version control and project tracking

---

## Methodology

1. Imported raw game log data into a SQLite database
2. Cleaned and standardized columns using SQL
3. Segmented games by **win vs. loss**
4. Calculated differences in performance for each team across selected metrics
5. Compared averages, rates, and percentages between outcomes

To better capture performance nuances, the analysis uses a mix of:

* **Totals** (e.g., yards, penalties)
* **Per-game metrics**
* **Per-play metrics**
* **Per-attempt and per-yard rates**
* **Percentages of plays, drives, and scores**

This approach helps reduce misleading conclusions that can arise from raw volume alone.

---

## Key Insights by Category

Below are the high-level insights discovered in each area of the game. (Details and supporting queries are available in the analysis files.)

### Passing

* Winning teams in the NFC South do not pass more often, but they pass significantly more efficiently. Despite slightly fewer attempts in wins, total passing yards are higher due to much better efficiency, highlighted by an average ~24-point higher QB rating in wins compared to losses, along with higher completion percentage, yards per attempt, and yards per completion.
* Completion percentage appears more predictive of wins than yards per attempt. Teams complete passes at roughly 5 percentage points higher in wins versus losses, compared to about a 2-yard increase in Y/A, suggesting that sustaining drives and avoiding negative plays matters more than maximizing yardage per throw.
* Losses often feature higher passing volume but lower efficiency, indicating the presence of “empty” passing production. Teams tend to rely more heavily on passing when trailing, which inflates attempts and yardage but coincides with decreased efficiency and ball security.

### Rushing

* Winning teams generally record more rushing attempts and a higher percentage of run plays, indicating that the run game is used primarily to control drives and game flow, not necessarily to generate scoring. Across teams, rushing touchdowns remain relatively similar in wins and losses.
* Increased rushing success in wins is team-dependent. The Falcons and Panthers average ~47 and ~60 more rushing yards in wins, while the Buccaneers are an outlier, averaging fewer rushing yards in wins, suggesting they rely more heavily on passing efficiency to win.
* In losses, teams largely shift away from the run game, increasing pass volume while reducing rushing attempts. This aligns with common game script behavior, as teams prioritize clock management and chunk plays when trailing, often at the expense of rushing efficiency.

### Special Teams

* Across the NFC South, field goals account for a smaller share of total scoring in losses, and three of four teams show higher field goal accuracy in wins, suggesting that teams are not generally losing games due to poor field goal execution.
* The data points more strongly to offensive inconsistency than special teams failure, as losses appear to stem from difficulty sustaining drives and reaching field goal range, rather than an inability to convert scoring opportunities once they arise.
* Missed field goals matter in close games. Every team recorded at least one close loss (≤3 points) with a missed field goal, with the Panthers and Falcons missing kicks in half of their close losses, indicating that while special teams may not drive season-long outcomes, they can be decisive in tightly contested games and divisional standings.

### Defense

* Defensive performance largely follows expected game script patterns: opponent rushing volume increases in losses, likely due to clock control, while rushing efficiency varies by team. The Falcons show the clearest relationship between run disruption and wins, while other teams display less consistent rushing efficiency splits.
* Passing defense appears more predictive of wins than run defense for some teams, particularly the Saints, who show the largest gap in passing efficiency allowed between wins and losses. This suggests that limiting opponent passing efficiency may be more impactful than reducing passing volume alone.
* While sack production improves in wins (higher sack yards and sack yards per play across teams), the relationship is not strictly causal. Only the Panthers average more sacks in losses, indicating that sacks contribute positively to winning but are supporting factors rather than primary drivers.

### Disciplined Play

* Contrary to expectations, teams in the NFC South commit more penalties and penalty yardage in wins than in losses, with penalties spiking in blowout wins and blowout losses. This suggests teams tend to play more disciplined in close games, while game script leads to sloppier play when the outcome is less in doubt.
* Due to the lack of detailed penalty context (type, timing, and situation), penalty volume alone is not a reliable indicator of discipline or winning. One notable exception is Atlanta, which averages ~10 yards per penalty in losses versus under 7 in wins, indicating penalties may be more damaging for the Falcons in losses.
* Turnovers strongly align with losses across all teams, reinforcing their role as drive-ending and field-position-altering events. Sack trends are more team-specific: the Buccaneers and Saints allow significantly more sacks in losses, while the Falcons and Panthers allow more in wins, suggesting that “cleaner” play does not universally translate to wins, particularly for Atlanta.

### Down & Situational Play

* Total first downs show little separation between wins and losses, with the Buccaneers actually averaging more first downs in losses. In contrast, conversion efficiency is strongly associated with wins, as third-down conversion rates are significantly higher and fourth-down conversion rates are nearly double in wins across all teams.
* Penalty-derived first downs are far more common in losses, with teams averaging nearly twice as many compared to wins. This suggests opponents play less disciplined when leading, inflating first-down totals without reflecting true offensive efficiency.
* Fourth-down aggressiveness alone does not correlate with wins, but fourth-down efficiency does. While attempt volume is driven by game situation, all teams convert fourth downs at much higher rates in wins, indicating that successful high-leverage decisions can meaningfully influence outcomes.

---

## Limitations

While this analysis provides useful directional insights, it has several important limitations:

* **Limited data depth**: No play-by-play data (e.g., down, distance, time, field position per play)
* **Penalty detail missing**: No information on *when* penalties occurred or their game context
* **No injury data**: Player availability and in-game injuries are not accounted for
* **No opponent game-level stats**: Analysis focuses on team performance only
* **No qualitative context**: Game plan, play calling, coaching decisions, and matchups are not captured

Because of these constraints, findings should be interpreted as **correlations**, not definitive causal explanations.

---

## Future Improvements

Potential extensions of this project include:

* Incorporating **play-by-play data** for situational analysis
* Adding **opponent metrics** for relative performance comparison
* Accounting for **strength of schedule**
* Integrating **injury reports** or snap counts
* Applying basic modeling to estimate impact of key variables

---

## Project Purpose

This project was created to:

* Practice structured sports analytics using SQL
* Demonstrate ability to translate raw data into insights
* Showcase analytical thinking relevant to entry-level **data analyst or sports analytics** roles

---

## Repository Structure

* `/data` – Raw and cleaned game log data
* `/sql` – SQL queries used for analysis
* `/analysis` – Written findings and exploratory notes
* `README.md` – Project overview and documentation

---

*All data used in this project is publicly available via Pro Football Reference.*
