-- Лабораторна робота №3

-- Запит 1: Список міст України, які закінчуються на 'ськ'
SELECT name 
FROM cities 
WHERE name LIKE '%ськ';

-- Запит 2: Список міст України, в назві яких є 'донец'
SELECT name 
FROM cities 
WHERE name LIKE '%донец%';

-- Запит 3: Список міст з населенням більше 100 000, назва у форматі НАЗВА_МІСТА (РЕГІОН)
SELECT CONCAT(name, ' (', region, ')') AS city_region, population 
FROM cities 
WHERE population > 100000 
ORDER BY name;

-- Запит 4: Перші 10 міст за населенням і відсоток від загального населення України (40 000 000)
SELECT name, population, 
       ROUND((population / 40000000) * 100, 2) AS population_percentage 
FROM cities 
ORDER BY population DESC 
LIMIT 10;

-- Запит 5: Список міст, де населення більше або дорівнює 0.1% від загального населення України
SELECT CONCAT(name, ' - ', ROUND((population / 40000000) * 100, 2), '%') AS city_percentage 
FROM cities 
WHERE (population / 40000000) * 100 >= 0.1 
ORDER BY (population / 40000000) * 100 DESC;
