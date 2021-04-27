-- 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
-- Используйте транзакции.

USE shop;

START TRANSACTION;
	DELETE FROM sample.users WHERE sample.users.id = 1;
	INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
COMMIT;

