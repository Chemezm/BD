-- Скрипт для удаления всех таблиц базы данных "Zoo Management"

BEGIN;

-- Удаление таблиц с каскадным удалением зависимостей
DROP TABLE IF EXISTS zoo."Animal_Keepers" CASCADE;
DROP TABLE IF EXISTS zoo."Animal_Food" CASCADE;
DROP TABLE IF EXISTS zoo."Feedings" CASCADE;
DROP TABLE IF EXISTS zoo."Medical_Records" CASCADE;
DROP TABLE IF EXISTS zoo."Tickets" CASCADE;
DROP TABLE IF EXISTS zoo."Event_Registrations" CASCADE;
DROP TABLE IF EXISTS zoo."Enclosures" CASCADE;
DROP TABLE IF EXISTS zoo."Animals" CASCADE;
DROP TABLE IF EXISTS zoo."Species" CASCADE;
DROP TABLE IF EXISTS zoo."Habitats" CASCADE;
DROP TABLE IF EXISTS zoo."Keepers" CASCADE;
DROP TABLE IF EXISTS zoo."Food" CASCADE;
DROP TABLE IF EXISTS zoo."Visitors" CASCADE;
DROP TABLE IF EXISTS zoo."Events" CASCADE;
DROP TABLE IF EXISTS zoo."Supplies" CASCADE;

END;
