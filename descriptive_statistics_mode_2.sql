-- descriptive statistics for table 'film': MODE
SELECT MODE() WITHIN GROUP (ORDER BY rental_duration)
AS mode_value
FROM film



