/* «Агрегация данных». 2. */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
VALUES
  ('Геннадий', '1990-10-05', NULL, NULL),
  ('Наталья', '1984-11-12', NULL, NULL),
  ('Александр', '1985-05-20', NULL, NULL),
  ('Сергей', '1988-02-14', NULL, NULL),
  ('Иван', '1998-01-12', NULL, NULL),
  ('Мария', '2006-08-29', NULL, NULL);

 
  
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.


SELECT 
CASE WEEKDAY(CONCAT(YEAR(CURRENT_DATE()),RIGHT(birthday_at,6)))
	WHEN 0 THEN 'Monday'
	WHEN 1 THEN 'Tuesday'
	WHEN 2 THEN 'Wednesday'
	WHEN 3 THEN 'Thursday'
	WHEN 4 THEN 'Friday'
	WHEN 5 THEN 'Saturday'
	WHEN 6 THEN 'Sunday'
END AS day_of_week,
count(WEEKDAY(CONCAT(YEAR(CURRENT_DATE()),RIGHT(birthday_at,6)))) AS birthdays
FROM users GROUP BY day_of_week

