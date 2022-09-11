/*Queries that provide answers to the questions from all projects.*/

/*Vet clinic database: create animals table*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND  '2019-01-01';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name='Agumon' OR  name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg  >= 10.4 AND weight_kg <= 17.3;

/* Vet clinic database: query and update animals table */
/*Task1*/
-- start a transaction
BEGIN;

-- update species column to unspecified for all animals
UPDATE animals
SET species = 'unspecified';

ROLLBACK;

/*Task2 */
BEGIN;

--Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon' WHERE species IS NULL;

COMMIT;
