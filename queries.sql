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

/*Task3*/
-- start a transaction
BEGIN;

-- delete all records in the animals table, then roll back the transaction
DELETE FROM animals;

ROLLBACK;

/*Task4*/
-- start a transaction
BEGIN;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT origin;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
ROLLBACK TO SAVEPOINT origin;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;


COMMIT;

/*Queries to answer qusetions:*/
SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg)::numeric(10,3) FROM animals;

SELECT                                                                                   
neutered,                                                                                           
SUM(escape_attempts) as attempts                                                                  
FROM animals
GROUP BY neutered
Order by attempts DESC LIMIT 1;                                                                     

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT DISTINCT ON (species) species,
    CASE
        WHEN (
            date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
        ) THEN AVG(escape_attempts)::numeric(10, 2)
        ELSE 0
    END average
FROM animals
GROUP BY species, date_of_birth
ORDER BY species DESC;

/*Vet clinic database: query multiple tables*/
SELECT name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT a.name FROM animals AS a INNER JOIN species AS s ON species_id = s.id WHERE s.name = 'Pokemon';
SELECT a.name, o.full_name FROM animals AS a RIGHT JOIN owners As o ON owner_id = o.id;
SELECT s.name,COUNT(*) FROM animals  JOIN  species AS s  ON species_id = s.id GROUP BY s.name;

SELECT o.full_name AS owner,a.name AS  Digimon_Owned FROM animals AS a INNER JOIN owners AS o ON owner_id = o.id 
WHERE full_name = 'Jennifer Orwell' AND species_id=2;

SELECT o.full_name AS owner,a.name AS  Not_Trie_To_ESCAPE FROM animals AS a INNER JOIN owners As o ON owner_id = o.id 
WHERE full_name = 'Dean Winchester' and escape_attempts = 0 ;

SELECT o.full_name AS owner,COUNT(*) as owns   FROM animals AS a INNER JOIN owners As o ON owner_id = o.id  
GROUP BY o.full_name ORDER BY owns DESC LIMIT 1  ;