/* Database schema to keep the structure of entire database. */
/*Vet clinic database: create animals table*/
CREATE TABLE animals (
    id INT,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOL,
    weight_kg DECIMAL
);

/* Vet clinic database: query and update animals table */
ALTER TABLE animals
ADD COLUMN species VARCHAR(50)

/*Vet clinic database: query multiple tables*/
/*Task1
create a table owners*/
CREATE TABLE owners (
    id SERIAL,
    full_name VARCHAR(100),
    age INT,
);

/*Task2
create a table species*/
CREATE TABLE species (
    id SERIAL,
    name VARCHAR(100),
);