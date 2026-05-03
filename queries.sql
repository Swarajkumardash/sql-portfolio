-- Top customers by revenue
SELECT customer_id,
       SUM(amount) AS total_revenue
FROM payment
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly revenue trend
SELECT DATE_TRUNC('month', payment_date) AS month,
       SUM(amount) AS revenue
FROM payment
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month;

-- Most rented film categories
SELECT c.name AS category,
       COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_rentals DESC;

-- Customers with highest rental frequency
SELECT customer_id,
       COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
ORDER BY total_rentals DESC;

-- Store-wise revenue comparison
SELECT s.store_id,
       SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff st ON p.staff_id = st.staff_id
JOIN store s ON st.store_id = s.store_id
GROUP BY s.store_id
ORDER BY total_revenue DESC;
