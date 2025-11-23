SELECT TOP (1000) [player_name]
      ,[team]
      ,[date_of_birth]
      ,[age]
      ,[marital_status]
      ,[number_of_kids]
      ,[nationality]
      ,[country_of_birth]
      ,[position]
      ,[preferred_foot]
      ,[height_cm]
      ,[weight_kg]
      ,[jersey_number]
      ,[injury_status]
      ,[agent]
      ,[matches_played]
      ,[minutes_played]
      ,[goals]
      ,[assists]
      ,[tackles]
      ,[interceptions]
      ,[saves]
      ,[clean_sheets]
      ,[yellow_cards]
      ,[red_cards]
      ,[passing_accuracy]
      ,[shot_accuracy]
      ,[previous_club]
      ,[years_at_club]
      ,[contract_end_year]
      ,[average_salary_zar]
      ,[market_value_zar]
      ,[signing_bonus_zar]
      ,[release_clause_zar]
  FROM [CarSalesDb1].[dbo].[sa_soccer_dataset_advanced]

--------slect all the columns using Select *
 SELECT* FROM [dbo].[sa_soccer_dataset_advanced];

================================================================
-- South African Soccer Dataset – SQL  
================================================================

--1. View the first 100 rows of the dataset to understand its structure. 
SELECT top 100 * FROM[dbo].[sa_soccer_dataset_advanced];
---------------------------------------------------------------------------------

--2. Count the total number of players in the dataset. 
SELECT COUNT (*) as Total_Players
FROM[dbo].[sa_soccer_dataset_advanced];
---------------------------------------------------------------------------------

--3. List all unique teams in the league. 
SELECT DISTINCT(TEAM) AS TEAM_NAME
FROM [dbo].[sa_soccer_dataset_advanced];
---------------------------------------------------------------------------------

--4. Count how many players are in each team. 
SELECT COUNT(Player_Name) as team_player,
	   team
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY team;
---------------------------------------------------------------------------------
--5. Identify the top 10 players with the most goals. 
SELECT top 10 Player_name, goals
FROM [dbo].[sa_soccer_dataset_advanced]
ORDER BY goals DESC;

---------------------------------------------------------------------------------

--6. Find the average salary for players in each team.
SELECT 
    team,
    AVG(CAST(average_salary_zar AS float)) AS AVG_Salary_zar,
    COUNT(*) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY team
ORDER BY AVG_Salary_zar DESC;

---------------------------------------------------------------------------------

--7. Retrieve the top 10 players with the highest market value. 
SELECT TOP 10 
Player_name, 
Market_value_zar,
team
FROM [dbo].[sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC

---------------------------------------------------------------------------------
      
--8. Calculate the average passing accuracy for each position. 
SELECT 
    position,
    AVG(TRY_CAST(passing_accuracy AS FLOAT)) AS average_passing_accuracy
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY position
ORDER BY average_passing_accuracy DESC;  

---------------------------------------------------------------------------------

--9. Compare shot accuracy with goals to find correlations. 
SELECT
    team,
    SUM(CAST(goals AS FLOAT)) AS total_goals,
    AVG(CAST(shot_accuracy AS FLOAT)) AS avg_shot_accuracy,
    COUNT(*) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
WHERE TRY_CAST(goals AS FLOAT) IS NOT NULL 
  AND TRY_CAST(shot_accuracy AS FLOAT) IS NOT NULL
GROUP BY team
ORDER BY avg_shot_accuracy DESC;
---------------------------------------------------------------------------------

--10. Compute total goals and assists for each team. 
SELECT 
    team,
    SUM(CAST(goals AS FLOAT)) AS total_goals,
    SUM(CAST(assists AS FLOAT)) AS total_assists,
    SUM(CAST(goals AS FLOAT)) + SUM(CAST(assists AS FLOAT)) AS total_goal_contributions,
    COUNT(*) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY team
ORDER BY total_goal_contributions DESC;
---------------------------------------------------------------------------------

--11. Count players by their marital status.
SELECT 
marital_status,
 	COUNT(player_name) AS Count_Players
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY marital_status;
---------------------------------------------------------------------------------

--12. Count players by nationality. 
SELECT 
    nationality,
    COUNT(player_name) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY nationality
ORDER BY player_count DESC;
---------------------------------------------------------------------------------

--13. Find average market value grouped by nationality. 
SELECT nationality,
       AVG(CAST(market_value_zar AS FLOAT)) AS avg_market_value_zar,
        COUNT(*) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY nationality
ORDER BY avg_market_value_zar DESC;

---------------------------------------------------------------------------------
--14. Determine how many player contracts end in each year. 
SELECT 
    contract_end_year,
    COUNT(*) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
WHERE contract_end_year IS NOT NULL
GROUP BY contract_end_year
ORDER BY contract_end_year;

---------------------------------------------------------------------------------
--15. Identify players whose contracts end next year. 
SELECT Player_name,
       contract_end_year
FROM [dbo].[sa_soccer_dataset_advanced]
WHERE contract_end_year = 2026
ORDER BY player_name;

---------------------------------------------------------------------------------

--16. Summarize the number of players by injury status. 
SELECT 
    injury_status,
    COUNT(*) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY injury_status
ORDER BY player_count DESC;
---------------------------------------------------------------------------------

--17. Calculate goals per match ratio for each player.
  SELECT 
    player_name,
    team,
    position,
    CAST(goals AS FLOAT) AS total_goals,
    CAST(matches_played AS FLOAT) AS total_matches,
   ROUND ( TRY_CAST(goals AS FLOAT) / NULLIF(TRY_CAST(matches_played AS FLOAT), 0),2) AS goals_per_match
FROM [dbo].[sa_soccer_dataset_advanced]
WHERE TRY_CAST(matches_played AS FLOAT) > 0
ORDER BY goals_per_match DESC;
---------------------------------------------------------------------------------

--18. Count how many players are managed by each agent. 
SELECT agent,
       COUNT(player_name)as number_of_players
FROM [dbo].[sa_soccer_dataset_advanced]
GROUP BY agent;
---------------------------------------------------------------------------------

--19. Calculate average height and weight by player position. 
SELECT 
    position,
    ROUND(AVG(height_cm), 2) AS avg_height_cm,
    ROUND(AVG(weight_kg), 2) AS avg_weight_kg,
    COUNT(*) AS player_count
FROM [dbo].[sa_soccer_dataset_advanced]
WHERE height_cm IS NOT NULL 
  AND weight_kg IS NOT NULL
GROUP BY position
ORDER BY position;
---------------------------------------------------------------------------------

--20. Identify players with the highest combined goals and assists.
SELECT 
    player_name,
    team,
    position,
    CAST(goals AS FLOAT) AS total_goals,
    CAST(assists AS FLOAT) AS total_assists,
    (CAST(goals AS FLOAT) + CAST(assists AS FLOAT)) AS combined_goal_contributions
FROM [dbo].[sa_soccer_dataset_advanced]
ORDER BY combined_goal_contributions DESC;
