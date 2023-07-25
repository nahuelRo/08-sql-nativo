CREATE TABLE movies (
  id integer primary key,
  name text DEFAULT NULL,
  year integer DEFAULT NULL,
  rank real DEFAULT NULL
);


CREATE TABLE actors (
  id INTEGER PRIMARY KEY,
  first_name TEXT DEFAULT NULL,
  last_name TEXT DEFAULT NULL,
  gender TEXT DEFAULT NULL
);

CREATE TABLE roles (
  actor_id INTEGER,
  movie_id INTEGER,
  role_name TEXT DEFAULT NULL
);