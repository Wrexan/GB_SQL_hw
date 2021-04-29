-- 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер",
-- с 00:00 до 6:00 — "Доброй ночи".

USE shop;

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS varchar(255) NO SQL
BEGIN
	DECLARE hr tinyint;
	DECLARE gr varchar(255);
	SET hr = HOUR(curtime());
	SELECT
	CASE
		WHEN hr < 6 THEN "Доброй ночи"
		WHEN hr < 12 THEN "Доброе утро"
		WHEN hr < 18 THEN "Добрый день"
		WHEN hr >=18 THEN "Добрый вечер"
	END
	INTO gr;
	RETURN gr;
END//
DELIMITER ;

SELECT hello();