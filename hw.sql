/*1*/
SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'ACADEMY DINOSAUR';

/*2*/
SELECT c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

/*3*/
SELECT rating, AVG(rental_duration) AS avg_rental_duration
FROM film
GROUP BY rating;

/*4*/
SELECT c.first_name, c.last_name, COUNT(r.customer_id) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

/*5*/
SELECT staff_id, COUNT(*) AS rental_count FROM rental GROUP BY staff_id ORDER BY rental_count DESC LIMIT 1;

/*6*/
SELECT c.name AS category_name, COUNT(*) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY rental_count DESC;
/*can add " LIMIT 1;" if you just want the top one i was not totally sure here*/

/*7*/
SELECT c.name AS category_name, AVG(f.rental_rate) AS average_rental_rate
FROM film_category fc
JOIN inventory i ON fc.film_id = i.film_id
JOIN film f ON i.film_id = f.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

/*8*/
/*I needed help from OpenAI for the next one is why it looks super weird
it doesnt seem hard to do but I struggled with it for awhile*/
SELECT 
    f.title AS film_title, 
    MAX(r.rental_date) AS last_rental_date
FROM 
    film f
LEFT JOIN 
    inventory i ON f.film_id = i.film_id
LEFT JOIN 
    rental r ON i.inventory_id = r.inventory_id
WHERE 
    r.rental_date IS NULL OR r.rental_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY 
    f.film_id, f.title;

/*9*/
SELECT 
    c.first_name, 
    c.last_name, 
    SUM(p.amount) AS total_spending
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    payment p ON r.rental_id = p.rental_id
GROUP BY 
    c.customer_id;
/*10*/
SELECT 
    l.name AS language,
    AVG(f.length) AS average_length
FROM 
    film f
JOIN 
    language l ON f.language_id = l.language_id
GROUP BY 
    l.language_id;
