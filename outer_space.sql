-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "planets" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "orbital_period_in_years" FLOAT NOT NULL,
  "orbits_around" TEXT NOT NULL,
  "galaxy" INT NOT NULL,
  "moons" TEXT
);

CREATE TABLE "galaxies" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "moons" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL UNIQUE
);

ALTER TABLE "planets" ADD FOREIGN KEY ("galaxy") REFERENCES "galaxies" ("id");

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 1, '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 1, '{}'),
  ('Neptune', 164.8, 'The Sun', 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1, '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1, '{}');

