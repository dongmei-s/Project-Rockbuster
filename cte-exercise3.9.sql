WITH top_ten_city(city, customer_acount_city)AS
(
SELECT city,COUNT(customer.customer_id) AS customer_acount_city
--,customer.last_name, customer.first_name,payment.amount
FROM city
INNER JOIN address ON address.city_id = city.city_id
INNER JOIN customer ON address.address_id = customer.address_id
INNER JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY city
ORDER BY customer_acount_city DESC
LIMIT 10
),
top_five_customer (top_city, last_name, first_name, sump) AS
(SELECT top_ten_city.city, customer.last_name,customer.first_name, sum(payment.amount)
FROM top_ten_city
RIGHT JOIN city ON city.city = top_ten_city.city
INNER JOIN address on address.city_id = city.city_id
INNER JOIN customer on customer.address_id = address.address_id
INNER JOIN payment on payment.customer_id = customer.customer_id
GROUP BY top_ten_city.city, customer.last_name,customer.first_name
ORDER BY SUM(payment.amount) DESC
LIMIT 5)

SELECT AVG(sump)
FROM top_five_customer


