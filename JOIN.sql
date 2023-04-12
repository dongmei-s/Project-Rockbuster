--customer, city, country, payment
SELECT city.city, country.country, COUNT(DISTINCT customer.customer_id) AS customer_count_city,
SUM(payment.amount) as customer_total_payment
FROM customer
INNER JOIN payment on payment.customer_id = customer.customer_id
INNER JOIN address on address.address_id = customer.address_id
INNER JOIN city on city.city_id = address.city_id
INNER JOIN country on country.country_id = city.country_id
GROUP BY city.city,country.country
ORDER BY customer_count_city DESC

					  
					 

