SHOW databases;
use sakila;

/*1*/SELECT first_name, last_name FROM actor;

/*2*/SELECT * FROM actor  WHERE first_name = 'John';

/*3*/ SELECT * FROM actor  WHERE last_name = 'Neeson';

/*4*/SELECT * FROM actor  WHERE actor_id%10=0;

/*5*/SELECT description FROM film where film_id = 100;

/*6*/SELECT title FROM film WHERE rating = "R";

/*7*/SELECT title FROM film WHERE rating != "R";

/*8*/SELECT title AS title_by_length FROM film ORDER BY `length` ASC LIMIT 10;

/*9*/SELECT title AS ten_longest  FROM film ORDER BY `length` DESC LIMIT 10;

/*10*/SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes';

/*11*/SELECT last_name AS unique_last_names
FROM actor 
GROUP BY last_name
HAVING COUNT(DISTINCT last_name) = 1 ORDER BY last_name DESC;

SELECT*FROM actor ORDER BY unique_last_names DESC;

/*13 */SELECT AVG FROM film;

/*15 */ SELECT AVG(`length`) FROM film;

/*14*/SELECT title, release_year FROM film WHERE title = 'Academy Dinosaur';

/*15 */ SELECT AVG(`length`) FROM film;
SELECT title(s)
FROM film
WHERE CHECK
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

/*17*/SELECT title FROM film WHERE description LIKE '% Robot%';

/*18*/SELECT*FROM film AS 2010_slate WHERE release_year = 2010; /* 0 films they all seem to be released in 2006 */

/*18*/SELECT title 
FROM film t1
JOIN film_category t2 ON t1.film_id =t2.film_id
WhERE category_id = 11;

/*20*/SELECT first_name, last_name FROM staff WHERE staff_id = 2;


SELECT actor_ID from actor WHERE first_name = "John" AND last_name = "Costner";

/*21*/SELECT title 
FROM film t1
JOIN film_actor t2 ON t1.film_id =t2.film_id
WhERE actor_ID=(
	SELECT actor_ID
	from actor 
	WHERE first_name = "John" AND last_name = "Costner"
);

/*22*/ SELECT COUNT(country) FROM country;

/*23*/ SELECT*FROM `language` ORDER BY `name` DESC;

/*24*/ SELECT first_name , last_name FROM actor WHERE last_name LIKE '%son';

/*25*/ /*  select name
from category
where category_id=(
	SELECT       category_id, 
             	COUNT(category_id) AS `value_occurrence` 
    	FROM     film_category
    	GROUP BY category_id
    	ORDER BY `value_occurrence` DESC
    	LIMIT    1
); THE ORIGINAL VERSION */
  

    SELECT category, COUNT(title)
FROM film_list
GROUP BY category
ORDER BY COUNT(title) DESC
LIMIT 1;

