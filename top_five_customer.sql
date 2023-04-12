--TOP five customers in the top ten city in the top ten countries
WITH top_ten_country AS
(SELECT country, COUNT(DISTINCT customer_id) AS account_customer
FROM country
INNER JOIN city on city.country_id = country.country_id
INNER JOIN address on address.city_id = city.city_id
INNER JOIN customer on customer.address_id = address.address_id
GROUP BY country
ORDER BY account_customer DESC
LIMIT 10),
top_ten_city AS
(SELECT city, COUNT(DISTINCT customer.customer_id) AS account_customer_city,country.country
FROM city
INNER JOIN country on country.country_id = city.country_id
INNER JOIN address on address.city_id = city.city_id
INNER JOIN customer on customer.address_id = address.address_id
WHERE country.country IN 
(SELECT country FROM top_ten_country)
GROUP BY city, country.country
ORDER BY account_customer_city DESC
LIMIT 10)

SELECT last_name, first_name,SUM(payment.amount) as customer_total_payment, city.city,country
FROM customer
INNER JOIN payment on payment.customer_id = customer.customer_id
INNER JOIN address on address.address_id = customer.address_id
INNER JOIN city on city.city_id = address.city_id
INNER JOIN country on country.country_id = city.country_id
WHERE city.city IN 
(SELECT city FROM top_ten_city)
GROUP BY last_name, first_name,city.city,country
ORDER BY customer_total_payment DESC
LIMIT 5 
					  
					 

