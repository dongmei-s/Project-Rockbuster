--top ten countries
SELECT country, COUNT(DISTINCT customer.customer_id) AS account_customer
FROM country
INNER JOIN city on city.country_id = country.country_id
INNER JOIN address on address.city_id = city.city_id
INNER JOIN customer on customer.address_id = address.address_id
GROUP BY country
ORDER BY account_customer DESC
					  
					 

