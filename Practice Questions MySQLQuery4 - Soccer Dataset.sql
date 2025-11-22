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


--2. Count the total number of players in the dataset. 
SELECT COUNT (*) as Total_Players
FROM[dbo].[sa_soccer_dataset_advanced];


--3. List all unique teams in the league. 
--4. Count how many players are in each team. 
--5. Identify the top 10 players with the most goals. 
--6. Find the average salary for players in each team. 
--7. Retrieve the top 10 players with the highest market value. 
--8. Calculate the average passing accuracy for each position. 
--9. Compare shot accuracy with goals to find correlations. 
--10. Compute total goals and assists for each team. 
--11. Count players by their marital status. 
--12. Count players by nationality. 
--13. Find average market value grouped by nationality. 
--14. Determine how many player contracts end in each year. 
--15. Identify players whose contracts end next year. 
--16. Summarize the number of players by injury status. 
--17. Calculate goals per match ratio for each player. 
--18. Count how many players are managed by each agent. 
--19. Calculate average height and weight by player position. 
--20. Identify players with the highest combined goals and assists.