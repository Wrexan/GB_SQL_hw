-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
-- catalogs и products в таблицу logs помещается время и дата создания записи,
-- название таблицы, идентификатор первичного ключа и содержимое поля name.

USE shop;
DROP TABLE IF EXISTS income_log;
CREATE TABLE income_log (
	logged_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	table_name VARCHAR(255) NOT NULL,
	p_key VARCHAR(255) NOT NULL,
	name VARCHAR(255)
) ENGINE=Archive;

DROP TRIGGER IF EXISTS log_users_on_insert;
DROP TRIGGER IF EXISTS log_catalogs_on_insert;
DROP TRIGGER IF EXISTS log_products_on_insert;

DELIMITER //
CREATE TRIGGER log_users_on_insert AFTER INSERT ON users
FOR EACH ROW
begin
    INSERT INTO income_log VALUES (now(), 'users', NEW.id, NEW.name);
END//

CREATE TRIGGER log_catalogs_on_insert AFTER INSERT ON catalogs
FOR EACH ROW
begin
    INSERT INTO income_log VALUES (now(), 'catalogs', NEW.id, NEW.name);
END//

CREATE TRIGGER log_products_on_insert AFTER INSERT ON products
FOR EACH ROW
begin
    INSERT INTO income_log VALUES (now(), 'products', NEW.id, NEW.name);
END//
DELIMITER ;

INSERT INTO users VALUES 
	(NULL, 'Василий', now(), NULL, NULL);

INSERT INTO products VALUES 
	(NULL, 'Какой-то продукт', NULL, 1000, 1, now(), now());

INSERT INTO catalogs VALUES 
	(NULL, 'Некая категория');

SELECT * FROM income_log;




-- SELECT pidx.SEQ_IN_INDEX
-- FROM information_schema.STATISTICS pidx
-- WHERE pidx.TABLE_SCHEMA = 'shop' AND pidx.TABLE_NAME = 'users' AND pidx.INDEX_NAME = 'PRIMARY';
