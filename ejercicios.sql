SELECT 
  name 
FROM 
  movies 
WHERE 
  year = 2001;

SELECT 
  COUNT() 
FROM 
  movies 
WHERE 
  year = 1982;

SELECT 
  * 
FROM 
  actors 
WHERE 
  last_name = 'stack';

SELECT 
  first_name, 
  COUNT() as cont 
FROM 
  actors
GROUP BY 
  first_name
ORDER BY 
  cont DESC
LIMIT 10;

SELECT 
  last_name, 
  COUNT() as cont 
FROM 
  actors
GROUP BY 
  last_name
ORDER BY 
  cont DESC
LIMIT 10;

SELECT 
  first_name, 
  last_name, 
  COUNT() as cont 
FROM 
  actors
GROUP BY 
  first_name || last_name
ORDER BY 
  cont DESC
LIMIT 10;

SELECT 
  actors.first_name as nombres, 
  actors.last_name as apellido, 
  COUNT() as cont 
FROM 
  roles
JOIN 
  actors 
ON 
  roles.actor_id = actors.id
GROUP BY 
  nombres || apellido
ORDER BY 
  cont DESC 
LIMIT 100;

SELECT 
  genre as genero, 
  COUNT(*) as cont  
FROM 
  movies_genres
JOIN movies ON movies_genres.movie_id = movies.id
GROUP BY 
  genero 
ORDER BY 
  cont ASC;

SELECT 
  actors.first_name, 
  actors.last_name 
FROM 
  roles 
JOIN actors ON roles.actor_id = actors.id 
JOIN movies ON roles.movie_id = movies.id
WHERE 
  movies.name = 'Braveheart' 
and 
  movies.year = 1995
ORDER BY 
  actors.last_name ASC


SELECT 
  directors.first_name as nombre, 
  directors.last_name as apellido, 
  movies.name as pelicula, 
  movies.year as año 
FROM 
  directors_genres, movies_genres
JOIN 
  directors ON directors_genres.director_id = directors.id 
JOIN 
  movies ON movies_genres.movie_id = movies.id 
WHERE 
  directors_genres.genre = 'Film-Noir' and año % 4 = 0
ORDER BY 
  pelicula ASC


SELECT
    d.first_name,
    d.last_name,
    m.name,
    m.year
FROM 
    directors d
JOIN
    movies_directors md ON d.id = md.director_id
JOIN
    movies m ON md.movie_id = m.id
JOIN
    movies_genres mg ON m.id = mg.movie_id
WHERE
    mg.genre = 'Film-Noir' AND m.year % 4 = 0
ORDER BY
    m.name;



SELECT 
  m.name, 
  a.first_name, 
  a.last_name       
FROM 
  actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies_genres mg ON r.movie_id = mg.movie_id
JOIN movies m ON r.movie_id = m.id
JOIN roles r2 ON m.id = r2.movie_id
JOIN actors a2 ON r2.actor_id = a2.id
WHERE a2.first_name = 'Kevin' AND a2.last_name = 'Bacon'
  AND mg.genre = 'Drama'
  AND NOT (a.first_name = 'Kevin' AND a.last_name = 'Bacon');
