/* Populate database with sample data. */
/*Vet clinic database: create animals table*/
INSERT INTO animals (id,name, date_of_birth , weight_kg, neutered, escape_attempts )
VALUES (1,'Agumon', '2020-02-03',10.23,TRUE,0);

INSERT INTO animals (id,name, date_of_birth , weight_kg, neutered, escape_attempts )
VALUES (2,'Gabumon', '2018-11-15',8,TRUE, 2);

INSERT INTO animals (id,name, date_of_birth , weight_kg, neutered, escape_attempts )
VALUES (3,'Pikachu', '2021-01-07',15.04,FALSE,1);

INSERT INTO animals (id,name, date_of_birth , weight_kg, neutered, escape_attempts )
VALUES (4,'Devimon', '2017-05-12',11,TRUE,5);

/* Vet clinic database: query and update animals table */
INSERT INTO animals (id,name, date_of_birth , weight_kg, neutered, escape_attempts )
VALUES (5,'Charmander', '2020-02-08',-11,FALSE,0),
       (6,'Plantmon', '2021-11-15',-5.7,TRUE, 2), 
       (7,'Squirtle', '1993-04-02',-12.13,FALSE,3),
       (8,'Angemon', '2005-06-12',-45,TRUE,1),
       (9,'Boarmon', '2005-06-7',20.4,TRUE,7),
       (10,'Blossom', '1998-10-13',17,TRUE,3),
       (11,'Ditto', '2022-05-14', 22,TRUE,4);

/*Vet clinic database: query multiple tables*/
/*Task1
Insert the following data into the owners table*/
INSERT INTO owners (full_name, age)                                                    
VALUES('Sam Smith', 34),
      ('Jennifer Orwell', 19),
      ('Bob', 45),
      ('Melody Pond', 77 ),
      ('Dean Winchester', 14),
      ('Jodie Whittaker', 38);

/*Task2
Insert the following data into the species table*/
INSERT INTO species (name)                                                    
VALUES('Pokemon'),
      ('Digimon');

/*Task3
Modify your inserted animals so it includes the species_id value*/
-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2  WHERE name LIKE '%mon'; 

-- All other animals are Pokemon
UPDATE animals                                                                         
SET species_id = 1 WHERE species_id IS NULL;

/*Task4
Modify your inserted animals to include owner information (owner_id)*/
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

/* Vet clinic database: add "join table" for visits */
/*Task 1 insert into vets*/

INSERT INTO vets (name, age, date_of_graduation)                                                    
VALUES('William Tatcher', 45 '2000-04-23'),
      ('Maisy Smith', 26, '2019-01-17'),
      ('Stephanie Mendez', 64, '1981-05-04'),
      ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) 
VALUES
((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Digimon')),
((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id FROM species WHERE name = 'Digimon'));

