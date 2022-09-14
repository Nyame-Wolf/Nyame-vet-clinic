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
ADD COLUMN species VARCHAR(50);

/*Vet clinic database: query multiple tables*/
/*Task1
create a table owners with autoincrement id primary key.*/
CREATE TABLE owners (
    id INT GENERATED BY DEFAULT AS IDENTITY 
    (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

/*Task2
create a table species with autoincrement id primary key.*/
CREATE TABLE species (
    id INT GENERATED BY DEFAULT AS IDENTITY 
    (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    name VARCHAR(100)
);

/*Task3
Modify animals table*/
--set id to autoincremented PRIMARY KEY
ALTER TABLE animals                                                                    
ALTER COLUMN id SET NOT NULL;

ALTER TABLE animals
ALTER id
ADD GENERATED ALWAYS  AS IDENTITY (START WITH 11 INCREMENT BY 1),
ADD PRIMARY KEY(id);

--remove column species
ALTER TABLE animals DROP COLUMN species;

--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

/* Vet clinic database: add "join table" for visits */
CREATE TABLE vets (
      id INT GENERATED BY DEFAULT AS IDENTITY 
    (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);


