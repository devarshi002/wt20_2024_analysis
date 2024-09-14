SELECT * FROM wt20.matches;

-- Get All Matches of a Specific Team
select * from wt20.matches
where team1 = "india" or team2 = "india";

--  Get the Winner of a Specific Match
-- Retrieve the details of the match and find out the winner of match number 43.
select team1, team2, winner
from wt20.matches
where match_number = 43;

-- Count the Total Number of Matches by Match Type
-- Get the count of group stage, semi-final, and final matches.
select match_type, count(*) as total_matches 
from wt20.matches
group by match_type;

--  Find Matches Where Team Won by Runs
-- Find all matches where the winning team won by runs rather than wickets.
select match_number, winner, winner_runs
from wt20.matches
where winner_runs is not null;

-- List Matches That Ended with a Specific Winning Margin (e.g., 7 Wickets)
-- Retrieve all the matches where the winner won by 7 wickets.

select match_number, team1, team2, winner, winner_wickets
from wt20.matches
where winner_wickets = 7;

-- Get Player of the Match Awards by a Specific Player
-- Retrieve all the matches where a particular player (e.g., JJ Bumrah) was the player of the match.
select match_number, player_of_match, team1, team2, date
from wt20.matches
where player_of_match = "JJ Bumrah";

-- Find Matches Played in a Specific City (e.g., New York)
 -- Retrieve all the matches that took place in New York.
select match_number, team1, team2, venue, city, date
from wt20.matches;

-- Count the Number of Matches Each Team Won
-- Calculate the total number of matches won by each team.
select winner, count(*) as total_wins
from wt20.matches
group by winner
order by total_wins desc;

-- Get Matches Where the Toss Decision Was to Bat
-- Retrieve all the matches where the team that won the toss decided to bat.

select match_number, team1, team2, toss_winner, toss_decision
from wt20.matches
where toss_decision = "bat";

-- List All Matches Umpired by a Specific Umpire (e.g., Asif Yaqoob)
-- Retrieve all the matches that were umpired by Asif Yaqoob.
select match_number, team1, team2, umpire1, umpire2
from wt20.matches
where umpire1 = "Asif Yaqoob" or umpire2 = "Asif Yaqoob";

-- Find Matches That Ended in No Result
-- Retrieve all matches that ended in "No Result."
select match_number, team1, team2, date 
from wt20.matches
where winner is not null;

-- Find Semi-Final Matches
-- Retrieve all the semi-final matches from the table.
select match_number, team1, team2, date, winner
from wt20.matches
where match_type = 'semi Final';



select * from wt20.matches;

