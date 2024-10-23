-- Лабораторна робота №5

-- Створення таблиці регіонів
CREATE TABLE regions (
    uuid VARCHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    area_quantity INT NOT NULL
);

-- Вставка даних у таблицю регіонів
INSERT INTO regions (uuid, name, area_quantity) VALUES
('1', 'Північний', 5),
('2', 'Східний', 8),
('3', 'Південний', 4),
('4', 'Центральний', 6),
('5', 'Західний', 7);

-- Запит 1: Отримати кількість населення в кожному регіоні
SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region;

-- Запит 2: Регіони з кількістю населених пунктів більше або дорівнює 10 і їхнє населення
SELECT regions.name, SUM(cities.population) AS total_population
FROM cities
JOIN regions ON cities.region = regions.uuid
GROUP BY regions.name
HAVING COUNT(cities.id) >= 10;

-- Запит 3: Третя п'ятірка міст за населенням у регіонах з кількістю областей не менше 5
SELECT name, population
FROM cities
WHERE region IN (SELECT uuid FROM regions WHERE area_quantity >= 5)
ORDER BY population DESC
LIMIT 5 OFFSET 10;

-- Запит 4: Назви регіонів та кількість населення в них, з урахуванням лише міст з населенням більше 300 000
SELECT region, SUM(population) AS total_population
FROM cities
WHERE population > 300000
GROUP BY region;

-- Запит 5: Назви та населення міст, які знаходяться в регіонах з кількістю областей не більше 5 і з населенням, що не входить у діапазон 150 000 - 500 000
SELECT name, population
FROM cities
WHERE region IN (SELECT uuid FROM regions WHERE area_quantity <= 5)
AND (population < 150000 OR population > 500000);
