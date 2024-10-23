-- Лабораторна робота №4

-- Запит 1: Повернути другу п'ятірку міст України (за алфавітом), назву повернути у верхньому регістрі
SELECT UPPER(name) AS name_upper 
FROM cities 
ORDER BY name 
LIMIT 5 OFFSET 5;

-- Запит 2: Отримати назву міста і в окремому стовпчику довжину назви. У результат не повинні потрапити міста з довжиною назви 8, 9 та 10 символів
SELECT name, LENGTH(name) AS name_length 
FROM cities 
WHERE LENGTH(name) NOT IN (8, 9, 10);

-- Запит 3: Отримати кількість населення у регіоні C та S
SELECT region, SUM(population) AS total_population 
FROM cities 
WHERE region IN ('C', 'S') 
GROUP BY region;

-- Запит 4: Отримати середню кількість населення у містах з регіону W
SELECT AVG(population) AS avg_population 
FROM cities 
WHERE region = 'W';

-- Запит 5: Отримати кількість міст у регіоні E
SELECT COUNT(*) AS city_count 
FROM cities 
WHERE region = 'E';
