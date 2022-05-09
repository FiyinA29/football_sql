-- psql -d football -f football_queries.sql
-- Find all the matches from 2017.
DROP TABLE divisions;
DROP TABLE matches;
SELECT * FROM matches WHERE season = 2017;

--Find all the matches featuring Barcelona.
SELECT * FROM matches WHERE hometeam = 'Barcelona' OR awayteam = 'Barcelona';

--What are the names of the Scottish divisions included?
SELECT DISTINCT name FROM divisions WHERE country = 'Scotland';

--Find the division code for the Bundesliga. REDO!!!!
--Use that code to find out how many matches Freiburg have played in the Bundesliga since the data started being collected.
SELECT COUNT(*) FROM matches WHERE division_code = 'D1' AND (hometeam = 'Freiburg' OR awayteam = 'Freiburg');

--Find the unique names of the teams which include the word "City" in their name (as entered in the database)
SELECT DISTINCT hometeam FROM matches WHERE hometeam LIKE '%City%';

--How many different teams have played in matches recorded in a French division?
SELECT COUNT(DISTINCT hometeam) FROM matches WHERE  division_code LIKE 'F%'

--Have Huddersfield played Swansea in the period covered?
SELECT * FROM matches WHERE hometeam IN ('Huddersfield', 'Swansea') AND awayteam IN ('Huddersfield', 'Swansea');

--How many draws were there in the Eredivisie between 2010 and 2015?
SELECT * FROM matches WHERE season BETWEEN 2010 AND 2015 AND division_code = 'N1' AND FTR = 'D';

--Select the matches played in the Premier League in order of total goals scored from highest to lowest. Where there is a tie the match with more home goals should come first.
SELECT *, (fthg + ftag) as total_goals FROM matches WHERE division_code = 'E0' ORDER BY total_goals DESC;

--In which division and which season were the most goals scored?
