-- Лабораторна робота №2

-- Запит 1: Список міст-мільйонерів
SELECT name, population 
FROM cities 
WHERE population >= 1000000;

-- Запит 2: Міста з регіонів E та W, відсортовані за населенням
SELECT name, population 
FROM cities 
WHERE region IN ('E', 'W') 
ORDER BY population DESC;

-- Запит 3: Міста з населенням понад 50000 з регіонів S, C і N
SELECT name, population 
FROM cities 
WHERE population > 50000 
AND region IN ('S', 'C', 'N');

-- Запит 4: Перші 20 міст з населенням 150000-350000 з регіонів E, W, N
SELECT name, population 
FROM cities 
WHERE population > 150000 
AND population <= 350000 
AND region IN ('E', 'W', 'N') 
ORDER BY name 
LIMIT 20;

-- Запит 5: Друга десятка міст за населенням, які не знаходяться в регіонах E та W
SELECT name, population 
FROM cities 
WHERE region NOT IN ('E', 'W') 
ORDER BY population DESC 
LIMIT 10 OFFSET 10;
