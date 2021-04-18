-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.

-- CREATE DATABASE x;

USE x;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  fly_from VARCHAR(255),
  fly_to VARCHAR(255)
);

INSERT INTO flights VALUES
  (NULL, 'moscow', 'omsk'),
  (NULL, 'novgorod', 'kazan'),
  (NULL, 'irkutsk', 'moscow'),
  (NULL, 'omsk', 'irkutsk'),
  (NULL, 'moscow', 'kazan');
 
 DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255) NOT NULL PRIMARY KEY,
  name VARCHAR(255)
 );

INSERT INTO cities VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутст'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');

-- solution without join
SELECT 
	(SELECT name FROM cities WHERE flights.fly_from = cities.label) point_A,
	' ==> ',
	(SELECT name FROM cities WHERE flights.fly_to = cities.label) point_B
FROM flights;

-- solution with join
SELECT point_a.name AS point_a, ' ==> ', point_b.name AS point_b FROM flights f
LEFT JOIN cities as point_a on point_a.label = f.fly_from
LEFT JOIN cities as point_b on point_b.label = f.fly_to

