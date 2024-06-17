-- 1. Получить список всех животных с информацией о их виде и месте обитания.
-- Ожидаются данные о животных, включая имя, вид и место обитания.
SELECT a.name AS animal_name, s.name AS species_name, h.name AS habitat_name
FROM zoo."Animals" a
JOIN zoo."Species" s ON a.species_id = s.id
JOIN zoo."Habitats" h ON a.habitat_id = h.id;

-- 2. Получить список всех смотрителей и количество животных, за которыми они ухаживают.
-- Ожидаются данные о смотрителях и количестве животных, за которыми они ухаживают.
SELECT k.first_name, k.last_name, COUNT(ak.animal_id) AS animal_count
FROM zoo."Keepers" k
JOIN zoo."Animal_Keepers" ak ON k.id = ak.keeper_id
GROUP BY k.first_name, k.last_name
ORDER BY animal_count DESC;

-- 3. Получить список всех видов животных и количество животных каждого вида.
-- Ожидаются данные о видах животных и количестве животных каждого вида.
SELECT s.name AS species_name, COUNT(a.id) AS animal_count
FROM zoo."Species" s
JOIN zoo."Animals" a ON s.id = a.species_id
GROUP BY s.name
ORDER BY animal_count DESC;

-- 4. Получить информацию о самых часто кормящихся животных.
-- Ожидаются данные о животных и количестве их кормлений.
SELECT a.name AS animal_name, COUNT(f.id) AS feeding_count
FROM zoo."Animals" a
JOIN zoo."Feedings" f ON a.id = f.animal_id
GROUP BY a.name
ORDER BY feeding_count DESC;

-- 5. Получить список всех поставщиков пищи и количество поставленной ими пищи.
-- Ожидаются данные о поставщиках пищи и количестве поставленной ими пищи.
SELECT k.first_name, k.last_name, COUNT(s.food_id) AS food_supplied
FROM zoo."Keepers" k
JOIN zoo."Supplies" s ON k.id = s.keeper_id
GROUP BY k.first_name, k.last_name
ORDER BY food_supplied DESC;

-- 6. Получить список всех событий и количество зарегистрированных на них посетителей.
-- Ожидаются данные о событиях и количестве зарегистрированных на них посетителей.
SELECT e.name AS event_name, COUNT(er.visitor_id) AS visitor_count
FROM zoo."Events" e
JOIN zoo."Event_Registrations" er ON e.id = er.event_id
GROUP BY e.name
ORDER BY visitor_count DESC;

-- 7. Получить список всех животных и количество проведенных медицинских осмотров.
-- Ожидаются данные о животных и количестве проведенных медицинских осмотров.
SELECT a.name AS animal_name, COUNT(mr.id) AS medical_records_count
FROM zoo."Animals" a
JOIN zoo."Medical_Records" mr ON a.id = mr.animal_id
GROUP BY a.name
ORDER BY medical_records_count DESC;

-- 8. Получить список всех видов животных и средний возраст животных каждого вида.
-- Ожидаются данные о видах животных и среднем возрасте животных каждого вида.
SELECT s.name AS species_name, AVG(EXTRACT(YEAR FROM AGE(a.date_of_birth))) AS average_age
FROM zoo."Species" s
JOIN zoo."Animals" a ON s.id = a.species_id
GROUP BY s.name
ORDER BY average_age DESC;

-- 9. Получить список всех посетителей и количество приобретенных ими билетов.
-- Ожидаются данные о посетителях и количестве приобретенных ими билетов.
SELECT v.first_name, v.last_name, COUNT(t.id) AS ticket_count
FROM zoo."Visitors" v
JOIN zoo."Tickets" t ON v.id = t.visitor_id
GROUP BY v.first_name, v.last_name
ORDER BY ticket_count DESC;

-- 10. Получить список всех событий и среднюю цену билетов на эти события.
-- Ожидаются данные о событиях и средней цене билетов на эти события.
SELECT e.name AS event_name, AVG(t.price) AS average_ticket_price
FROM zoo."Events" e
JOIN zoo."Tickets" t ON e.id = t.event_id
GROUP BY e.name
ORDER BY average_ticket_price DESC;

-- 11. Получить список всех животных с их максимальным возрастом.
-- Ожидаются данные о животных и их максимальном возрасте.
SELECT a.name AS animal_name, EXTRACT(YEAR FROM AGE(a.date_of_birth)) AS age
FROM zoo."Animals" a
ORDER BY age DESC;

-- 12. Получить список всех животных и количество различных типов пищи, которые они потребляют.
-- Ожидаются данные о животных и количестве различных типов пищи.
SELECT a.name AS animal_name, COUNT(DISTINCT af.food_id) AS food_types_count
FROM zoo."Animals" a
JOIN zoo."Animal_Food" af ON a.id = af.animal_id
GROUP BY a.name
ORDER BY food_types_count DESC;

-- 13. Получить список всех посетителей и количество посещенных ими событий.
-- Ожидаются данные о посетителях и количестве посещенных ими событий.
SELECT v.first_name, v.last_name, COUNT(er.event_id) AS events_attended
FROM zoo."Visitors" v
JOIN zoo."Event_Registrations" er ON v.id = er.visitor_id
GROUP BY v.first_name, v.last_name
ORDER BY events_attended DESC;

-- 14. Получить список всех животных и количество смотрителей, ухаживающих за ними.
-- Ожидаются данные о животных и количестве смотрителей.
SELECT a.name AS animal_name, COUNT(ak.keeper_id) AS keepers_count
FROM zoo."Animals" a
JOIN zoo."Animal_Keepers" ak ON a.id = ak.animal_id
GROUP BY a.name
ORDER BY keepers_count DESC;

-- 15. Использование оконной функции: Получить список всех событий и их стоимость билетов, а также сумму всех билетов для каждого события.
-- Ожидаются данные о событиях, стоимости билетов и сумме всех билетов.
SELECT e.name AS event_name, t.price, SUM(t.price) OVER (PARTITION BY e.id) AS total_ticket_sales
FROM zoo."Events" e
JOIN zoo."Tickets" t ON e.id = t.event_id
ORDER BY total_ticket_sales DESC;
