/* «Операторы, фильтрация, сортировка и ограничение». Для задания 2. */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('Геннадий', '1990-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Наталья', '1984-11-12', '20.05.2016 16:32', '20.05.2016 16:32'),
  ('Александр', '1985-05-20', '14.08.2016 20:10', '14.08.2016 20:10'),
  ('Сергей', '1988-02-14', '21.10.2016 9:14', '21.10.2016 9:14'),
  ('Иван', '1998-01-12', '15.12.2016 12:45', '15.12.2016 12:45'),
  ('Мария', '2006-08-29', '12.01.2017 8:56', '12.01.2017 8:56');

-- Таблица users была неудачно спроектирована.
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате
-- 20.10.2017 8:10
-- Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

UPDATE users SET created_at = concat(
		substring(created_at, 7, 4),
		'-', substring(created_at, 4, 2),
		'-', substring(created_at, 1, 2),
		' ', substring(created_at, 11, 6), ':00'),
	updated_at = concat(
		substring(updated_at, 7, 4),
		'-', substring(updated_at, 4, 2),
		'-', substring(updated_at, 1, 2),
		' ', substring(updated_at, 11, 6), ':00');

ALTER TABLE users MODIFY COLUMN created_at DATETIME, MODIFY COLUMN updated_at DATETIME;

SELECT * FROM users;
-- Исходя из уроков решил, что в MySQL будет работать стандартный SQL код.
-- Из-за этого задание потребовало уйму времени и нервов, никакие примеры из SQL не работали.
-- А в MySQL и SQL стринги складываются иначе.


