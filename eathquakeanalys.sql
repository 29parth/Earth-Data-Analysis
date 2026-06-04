SELECT * FROM earthquake
LIMIT 10;

#Total_Earthquakes
SELECT COUNT(*) AS total_earthquake
FROM earthquake;

#Average_Magnitude
SELECT ROUND(AVG(magnitude)::numeric,2) AS average_magnitude
FROM earthquake;

#Strongest_Earthquakes
SELECT title, country, magnitude, depth
FROM earthquake
ORDER BY magnitude DESC
LIMIT 10;

#Countries_with_Most_Earthquakes
SELECT country,
COUNT(*) AS total_earthquakes
FROM earthquake
GROUP BY country
ORDER BY total_earthquakes DESC
LIMIT 10;

#Continent-wise_Earthquake_Count
SELECT continent,
COUNT(*) AS total
FROM earthquake
GROUP BY continent
ORDER BY total DESC;

#Earthquakes_Above_Magnitude_7
SELECT title, country, magnitude
FROM earthquake
WHERE magnitude > 7
ORDER BY magnitude DESC;

#Tsunami-related_Earthquakes
SELECT title, country, magnitude
FROM earthquake
WHERE tsunami = 1;

#Alert_Level_Analysis
SELECT alert,
COUNT(*) AS total_alerts
FROM earthquake
GROUP BY alert
ORDER BY total_alerts DESC;

#Deepest_Earthquakes
SELECT title, country, depth
FROM earthquake
ORDER BY depth DESC
LIMIT 10;

#Average_Magnitude_by_Country
SELECT country,
ROUND(AVG(magnitude)::numeric,2) AS avg_magnitude
FROM earthquake
GROUP BY country
ORDER BY avg_magnitude DESC
LIMIT 10;

# Most_Dangerous_Countries
SELECT country,
COUNT(*) AS frequency,
ROUND(AVG(magnitude)::numeric,2) AS avg_magnitude,
MAX(magnitude) AS strongest_quake
FROM earthquake
GROUP BY country
HAVING COUNT(*) > 5
ORDER BY avg_magnitude DESC;

#Earthquake_Risk_Classification
SELECT
CASE
    WHEN magnitude < 4 THEN 'Low'
    WHEN magnitude BETWEEN 4 AND 6 THEN 'Moderate'
    ELSE 'High'
END AS risk_level,
COUNT(*) AS total
FROM earthquake
GROUP BY risk_level;

#Most_Active_Monitoring_Networks
SELECT net,
COUNT(*) AS total
FROM earthquake
GROUP BY net
ORDER BY total DESC;

#Top_Significant_Earthquakes
SELECT title, country, sig
FROM earthquake
ORDER BY sig DESC
LIMIT 10;

#_Year_wise_Earthquake_Trend
SELECT
SUBSTRING(date_time,1,4) AS year,
COUNT(*) AS total
FROM earthquake
GROUP BY year
ORDER BY year;