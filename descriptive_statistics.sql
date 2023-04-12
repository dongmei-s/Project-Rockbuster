-- descriptive statistics for table 'film': MAX, MIN, Median, AVERAGE 
SELECT MAX(rental_duration) AS maximum,MIN(rental_duration) as minimum,
AVG(rental_duration) AS average,
(SELECT 
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rental_duration) AS median
FROM film) AS median
FROM film 



