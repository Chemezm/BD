BEGIN;

-- Вставка данных в таблицу Species
INSERT INTO zoo."Species" (name, scientific_name, conservation_status) VALUES
('Lion', 'Panthera leo', 'Vulnerable'),
('Tiger', 'Panthera tigris', 'Endangered'),
('Elephant', 'Loxodonta africana', 'Vulnerable'),
('Giraffe', 'Giraffa camelopardalis', 'Vulnerable');

-- Вставка данных в таблицу Habitats
INSERT INTO zoo."Habitats" (name, climate, area_sq_m) VALUES
('Savannah', 'Tropical', 5000.00),
('Rainforest', 'Tropical', 8000.00),
('Grassland', 'Temperate', 6000.00),
('Desert', 'Arid', 3000.00);

-- Вставка данных в таблицу Enclosures
INSERT INTO zoo."Enclosures" (habitat_id, name, capacity) VALUES
(1, 'Lion Enclosure', 5),
(1, 'Elephant Enclosure', 3),
(2, 'Tiger Enclosure', 4),
(3, 'Giraffe Enclosure', 6);

-- Вставка данных в таблицу Animals
INSERT INTO zoo."Animals" (species_id, habitat_id, name, date_of_birth, gender) VALUES
(1, 1, 'Simba', '2015-05-20', 'Male'),
(2, 2, 'Shere Khan', '2016-03-15', 'Male'),
(3, 1, 'Dumbo', '2012-08-12', 'Male'),
(4, 3, 'Melman', '2014-11-05', 'Male');

-- Вставка данных в таблицу Keepers
INSERT INTO zoo."Keepers" (first_name, last_name, hire_date, specialty) VALUES
('John', 'Doe', '2010-01-10', 'Large Mammals'),
('Jane', 'Smith', '2012-04-15', 'Carnivores'),
('Robert', 'Brown', '2015-07-20', 'Herbivores'),
('Alice', 'Johnson', '2018-11-25', 'Reptiles');

-- Вставка данных в таблицу Animal_Keepers
INSERT INTO zoo."Animal_Keepers" (animal_id, keeper_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3);

-- Вставка данных в таблицу Food
INSERT INTO zoo."Food" (name, type, nutritional_value) VALUES
('Meat', 'Protein', 500),
('Grass', 'Fiber', 300),
('Fruits', 'Vitamins', 200),
('Vegetables', 'Vitamins', 250);

-- Вставка данных в таблицу Animal_Food
INSERT INTO zoo."Animal_Food" (animal_id, food_id, amount_per_day) VALUES
(1, 1, 10),
(2, 1, 12),
(3, 2, 50),
(4, 3, 20);

-- Вставка данных в таблицу Feedings
INSERT INTO zoo."Feedings" (animal_id, food_id, feeding_time, quantity) VALUES
(1, 1, '2023-01-01 08:00:00', 10),
(2, 1, '2023-01-01 09:00:00', 12),
(3, 2, '2023-01-01 10:00:00', 50),
(4, 3, '2023-01-01 11:00:00', 20);

-- Вставка данных в таблицу Medical_Records
INSERT INTO zoo."Medical_Records" (animal_id, checkup_date, diagnosis, treatment) VALUES
(1, '2023-01-10', 'Healthy', 'None'),
(2, '2023-01-12', 'Minor injury', 'Rest'),
(3, '2023-01-15', 'Healthy', 'None'),
(4, '2023-01-20', 'Dietary issues', 'Diet change');

-- Вставка данных в таблицу Visitors
INSERT INTO zoo."Visitors" (first_name, last_name, email, phone) VALUES
('Michael', 'Scott', 'michael@example.com', '123-456-7890'),
('Jim', 'Halpert', 'jim@example.com', '234-567-8901'),
('Pam', 'Beesly', 'pam@example.com', '345-678-9012'),
('Dwight', 'Schrute', 'dwight@example.com', '456-789-0123');

-- Вставка данных в таблицу Events
INSERT INTO zoo."Events" (name, date, description) VALUES
('Lion Feeding Show', '2023-06-01', 'Watch the lions being fed'),
('Tiger Training Session', '2023-06-05', 'See how tigers are trained'),
('Elephant Parade', '2023-06-10', 'Elephants marching through the zoo'),
('Giraffe Feeding', '2023-06-15', 'Feed the giraffes yourself');

-- Вставка данных в таблицу Tickets
INSERT INTO zoo."Tickets" (visitor_id, event_id, purchase_date, price) VALUES
(1, 1, '2023-05-20', 20.00),
(2, 2, '2023-05-21', 15.00),
(3, 3, '2023-05-22', 25.00),
(4, 4, '2023-05-23', 18.00);

-- Вставка данных в таблицу Event_Registrations
INSERT INTO zoo."Event_Registrations" (event_id, visitor_id, registration_date) VALUES
(1, 1, '2023-05-01'),
(2, 2, '2023-05-02'),
(3, 3, '2023-05-03'),
(4, 4, '2023-05-04');

-- Вставка данных в таблицу Supplies
INSERT INTO zoo."Supplies" (food_id, keeper_id, quantity, supply_date) VALUES
(1, 1, 100, '2023-04-01'),
(2, 2, 150, '2023-04-02'),
(3, 3, 200, '2023-04-03'),
(4, 4, 250, '2023-04-04');

COMMIT;