-- Лабораторна робота №1
-- Створення таблиці cities
CREATE TABLE cities (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    population INT(10) UNSIGNED DEFAULT NULL,
    region VARCHAR(5) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Вставка даних
INSERT INTO cities (id, name, population, region) VALUES
(1, 'Київ', 2888470, 'N'),
(2, 'Харків', 1444540, 'E'),
(3, 'Одеса', 1010000, 'S'),
(4, 'Дніпро', 984423, 'C'),
(5, 'Донецьк', 932562, 'E'),
(6, 'Запоріжжя', 758011, 'E'),
(7, 'Львів', 728545, 'W'),
(8, 'Кривий Ріг', 646748, 'S'),
(9, 'Миколаїв', 494381, 'S'),
(10, 'Маріуполь', 458533, 'S'),
(11, 'Луганськ', 417990, 'E'),
(12, 'Севастополь', 412630, 'S'),
(13, 'Вінниця', 372432, 'W'),
(14, 'Макіївка', 348173, 'E'),
(15, 'Сімферополь', 332608, 'S'),
(16, 'Херсон', 296161, 'S'),
(17, 'Полтава', 294695, 'E'),
(18, 'Чернігів', 294522, 'N'),
(19, 'Черкаси', 284459, 'C'),
(20, 'Суми', 268409, 'E');

-- Запит 1: Друга десятка міст за чисельністю населення
SELECT name, population
FROM cities
ORDER BY population DESC
LIMIT 10 OFFSET 10;

-- Запит 2: Список міст в зворотному алфавітному порядку (30 записів)
SELECT name
FROM cities
ORDER BY name DESC
LIMIT 30;

-- Запит 3: Список міст, відсортованих за регіоном та чисельністю населення
SELECT name, region, population
FROM cities
ORDER BY region ASC, population DESC;

-- Запит 4: Отримання списку унікальних регіонів
SELECT DISTINCT region
FROM cities;

-- Запит 5: Сортування по регіону в зворотному порядку і міст в межах регіону також в зворотному порядку
SELECT name, region
FROM cities
ORDER BY region DESC, name DESC;
