-- Лабораторна робота №6

-- Створення таблиці cities
CREATE TABLE cities (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    population INT(10) UNSIGNED DEFAULT NULL,
    region VARCHAR(5) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY (id)
);

INSERT INTO cities (name, population, region) VALUES
('Київ', 2888470, 'N'),
('Харків', 1444540, 'E'),
('Одеса', 1010000, 'S'),
('Дніпро', 984423, 'C'),
('Донецьк', 932562, 'E'),
('Запоріжжя', 758011, 'E'),
('Львів', 728545, 'W'),
('Кривий Ріг', 646748, 'S'),
('Миколаїв', 494381, 'S'),
('Маріуполь', 458533, 'S');

-- Створення таблиці regions
CREATE TABLE regions (
    uuid VARCHAR(5) COLLATE utf8_unicode_ci NOT NULL,
    name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    area_quantity INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (uuid)
);

INSERT INTO regions (uuid, name, area_quantity) VALUES
('C', 'Центральний', 5),
('E', 'Східний', 8),
('N', 'Північний', 4),
('S', 'Південний', 4),
('W', 'Західний', 7);

-- Запит 1: Отримати назви міст і регіонів, де населення більше 350 000
SELECT cities.name AS city_name, regions.name AS region_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;

-- Запит 2: Назви міст, які знаходяться у регіоні з назвою Північний
SELECT cities.name AS city_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Північний';

-- Запит 3: Отримати міста, які знаходяться у регіонах з кількістю областей не менше 5
SELECT cities.name AS city_name, regions.name AS region_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.area_quantity >= 5;

-- Запит 4: Регіони та їхнє загальне населення
SELECT regions.name AS region_name, SUM(cities.population) AS total_population
FROM cities
JOIN regions ON cities.region = regions.uuid
GROUP BY regions.name;

-- Запит 5: Міста в регіонах з кількістю областей до 5, які мають населення більше 1 000 000
SELECT cities.name AS city_name, cities.population
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.area_quantity <= 5 AND cities.population > 1000000;
