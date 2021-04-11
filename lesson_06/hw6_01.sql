-- 1. Пусть задан некоторый пользователь.
-- Найдите человека, который больше всех общался с нашим пользователем, иначе, кто написал пользователю наибольшее число сообщений.
-- (можете взять пользователя с любым id).
-- (по желанию: можете найти друга, с которым пользователь больше всего общался)


-- Тыкаем пальцем в id
SET @rid = ceiling((SELECT RAND() * MAX(id) FROM users));
-- Ищем спамера в сообщениях
SELECT
	to_user_id AS chosen_id,
	(SELECT first_name FROM users WHERE users.id = chosen_id) AS name,
	from_user_id AS writer_id,
	(SELECT first_name FROM users WHERE users.id = writer_id) AS name,
	count(to_user_id) AS messages
FROM messages
WHERE to_user_id = @rid
GROUP BY from_user_id, to_user_id
ORDER BY messages DESC 
LIMIT 1;
-- Ищем кому он спамил
SELECT
	from_user_id AS chosen_id,
	(SELECT first_name FROM users WHERE users.id = chosen_id) AS name,
	to_user_id AS reader_id,
	(SELECT first_name FROM users WHERE users.id = reader_id) AS name,
	count(from_user_id) AS messages
FROM messages
WHERE from_user_id = @rid
GROUP BY to_user_id, from_user_id
ORDER BY messages DESC 
LIMIT 1;