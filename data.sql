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



