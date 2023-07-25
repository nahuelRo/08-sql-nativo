-- Ejercicio 1
SELECT * FROM movies 
WHERE year = 2001;

-- Ejercicio 2
SELECT COUNT(*) AS cantidad_de_peliculas 
FROM movies 
WHERE year = 1982;

-- Ejercicio3
SELECT * 
FROM actors 
WHERE last_name LIKE '%stack%';

-- Ejercicio 4
SELECT COUNT(*), first_name
FROM actors
GROUP BY first_name
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Ejercicio 5
SELECT COUNT(*), last_name
FROM actors
GROUP BY last_name
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Ejercicio 6
SELECT COUNT(*) AS cantidad, first_name || ' ' || last_name AS full_name 
FROM actors
GROUP BY first_name, last_name
ORDER BY cantidad DESC
LIMIT 10;

-- Ejercicio 7
SELECT actors.first_name || ' ' || actors.last_name as actor, COUNT(*) as n_of_roles 
FROM roles JOIN actors ON roles.actor_id = actors.id
GROUP BY roles.actor_id
ORDER BY n_of_roles DESC 
LIMIT 100;

-- Ejercicio 8
SELECT genre, COUNT(*) as n_of_movies  
FROM movies_genres JOIN movies ON movies.id = movies_genres.movie_id
GROUP BY genre
ORDER BY n_of_movies DESC;

-- Ejercicio 9
SELECT first_name, last_name 
FROM movies 
  JOIN roles ON roles.movie_id = movies.id 
  JOIN actors ON roles.actor_id = actors.id
WHERE movies.name = 'Braveheart' AND movies.year = 1995
ORDER BY actors.last_name;

-- Ejercicio 10
SELECT (directors.first_name || ' ' || directors.last_name) AS director_name, movies.name movies.year 
FROM movies
JOIN movies_genres ON movies_genres.movie_id = movies.id
JOIN movies_directors ON movies_directors.movie_id = movies.id
JOIN directors ON movies_directors.movie_id = directors.id
WHERE movies_genres.genre = 'Film-Noir' AND (movies.year % 4) = 0
ORDER BY movies.name;


-- Ejercicio 11 Subquerys
SELECT movies.name, actors.first_name, actors.last_name
FROM roles
  JOIN actors ON roles.actor_id = actor.id
  JOIN movies ON roles.movie_id = movies.id
WHERE movie_id IN (
  SELECT movie_id 
  FROM roles
  WHERE actor_id = (
    SELECT id
    FROM actors
    WHERE first_name = 'Kevin' AND last_name = 'Bacon'
  ) 
)
AND movie_id IN (
  SELECT movie_id 
  FROM movies_genre
  WHERE genre = 'Drama' 
)
AND (actors.first_name != 'Kevin' AND actors.last_name != "Bacon");


-- Ejercicio 12 Indices
CREATE INDEX "actors_idx_first_name" ON "actors" ("first_name");
CREATE INDEX "actors_idx_last_name" ON "actors" ("last_name");


-- Falta hacer
-- Ejercicio 13
-- Ejercicio 14
-- Ejercicio 15
