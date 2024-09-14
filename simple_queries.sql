use wt20;
-- Query to Find Matches Where the Winner Scored More Than a Specific Number of Runs
-- You might want to find the matches where a team won by more than 50 runs.
select * 
from wt20.matches
where winner_runs > 50;

-- Query to Count Matches Won by Each Team in a Given Year
-- To get a breakdown of how many matches each team won during a specific season (e.g., 2024):
select winner, count(*) as total_wins
from wt20.matches
where season = "2024"
group by winner
order by total_wins desc;

-- Query to Find Top Player of the Match Awards by Season
-- If you're interested in which players received the most "Player of the Match" awards in a particular season:
select player_of_match, count(*) as awards
from wt20.matches
where season = '2024'
group by player_of_match
order by awards desc;

--  Query to List Matches That Went to No Result
-- For matches that ended with "No Result":
select * from wt20.matches
where winner is null;

-- Query to Find Teams Winning Most by Wickets
-- To list the matches where teams won with the highest number of wickets:
select team1, team2, winner, winner_wickets
from wt20.matches
where winner_wickets is not null
order by winner_wickets desc;


-- Query to Find Matches Played Between Two Specific Teams
-- This query retrieves all matches played between two specific teams (e.g., India and Pakistan).
select *
from wt20.matches
where ( team1 = "india" and team2 = "pakistan") or (team1 = "pakistan" and team2 = "india");

 -- Query to Get Venues Where a Specific Team Won Most Matches
-- To find out the venues where a specific team (e.g., India) has won the most matches:
select venue, count(*) as win_count
from wt20.matches
where winner = 'india'
group by venue
order by win_count desc;

-- Query to List the Umpires Who Have Officiated the Most Matches
-- If you want to find which umpires officiated the most matches in a given season:
select umpire1, count(*) as match_count
from wt20.matches
where season = '2024'
group by umpire1
order by match_count desc;


--  Query to Get Average Winning Margin (Runs) for Each Team
-- To get the average number of runs by which each team won their matches:
select winner, avg(winner_runs) as avg_win_by_runs 
from wt20.matches
where winner_runs is not null
group by winner
order by avg_win_by_runs desc;

-- Query to Find Teams That Won Toss but Lost the Match
select match_number, team1, team2, toss_winner, winner
from wt20.matches
where toss_winner != winner;

update matches
set winner = ''
 where match_number = 3;

-- Query to List Matches Won by Fielding Decision After Toss
select match_number, team1, team2, toss_decision, toss_winner, winner 
from wt20.matches 
where toss_decision = 'field' and toss_winner = winner;

-- Query to Find Most Frequent Toss Decisions in a Season
select toss_decision, count(*) as count
from wt20.matches
where season = '2024'
group by toss_decision
order by count desc;

-- Query to Find Which Team Has Played the Most Matches as "Team1"
select team1, count(*) as match_count
from wt20.matches
group by team1
order by match_count desc;

-- Query to Get Teams That Have Lost by Highest Margin of Runs
select team2 as losing_team, max(winner_runs) as loss_margin
from wt20.matches
where winner_runs is not null
group by team2
order by loss_margin DESC;

select * from wt20.deliveries;