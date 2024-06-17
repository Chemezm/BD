BEGIN;

CREATE TABLE IF NOT EXISTS zoo."Species"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    scientific_name VARCHAR(255),
    conservation_status VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS zoo."Habitats"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    climate VARCHAR(255) NOT NULL,
    area_sq_m FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS zoo."Enclosures"
(
    id SERIAL PRIMARY KEY,
    habitat_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    capacity INTEGER NOT NULL,
    FOREIGN KEY (habitat_id) REFERENCES zoo."Habitats" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Animals"
(
    id SERIAL PRIMARY KEY,
    species_id INTEGER NOT NULL,
    habitat_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    FOREIGN KEY (species_id) REFERENCES zoo."Species" (id),
    FOREIGN KEY (habitat_id) REFERENCES zoo."Habitats" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Keepers"
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL,
    specialty VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS zoo."Animal_Keepers"
(
    id SERIAL PRIMARY KEY,
    animal_id INTEGER NOT NULL,
    keeper_id INTEGER NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES zoo."Animals" (id),
    FOREIGN KEY (keeper_id) REFERENCES zoo."Keepers" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Food"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    nutritional_value INTEGER
);

CREATE TABLE IF NOT EXISTS zoo."Animal_Food"
(
    id SERIAL PRIMARY KEY,
    animal_id INTEGER NOT NULL,
    food_id INTEGER NOT NULL,
    amount_per_day FLOAT NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES zoo."Animals" (id),
    FOREIGN KEY (food_id) REFERENCES zoo."Food" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Feedings"
(
    id SERIAL PRIMARY KEY,
    animal_id INTEGER NOT NULL,
    food_id INTEGER NOT NULL,
    feeding_time TIMESTAMP,
    quantity FLOAT NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES zoo."Animals" (id),
    FOREIGN KEY (food_id) REFERENCES zoo."Food" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Medical_Records"
(
    id SERIAL PRIMARY KEY,
    animal_id INTEGER NOT NULL,
    checkup_date DATE NOT NULL,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    FOREIGN KEY (animal_id) REFERENCES zoo."Animals" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Visitors"
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS zoo."Events"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS zoo."Tickets"
(
    id SERIAL PRIMARY KEY,
    visitor_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    purchase_date DATE NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (visitor_id) REFERENCES zoo."Visitors" (id),
    FOREIGN KEY (event_id) REFERENCES zoo."Events" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Event_Registrations"
(
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL,
    visitor_id INTEGER NOT NULL,
    registration_date DATE NOT NULL,
    FOREIGN KEY (event_id) REFERENCES zoo."Events" (id),
    FOREIGN KEY (visitor_id) REFERENCES zoo."Visitors" (id)
);

CREATE TABLE IF NOT EXISTS zoo."Supplies"
(
    id SERIAL PRIMARY KEY,
    food_id INTEGER NOT NULL,
    keeper_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    supply_date DATE NOT NULL,
    FOREIGN KEY (food_id) REFERENCES zoo."Food" (id),
    FOREIGN KEY (keeper_id) REFERENCES zoo."Keepers" (id)
);

COMMIT;
