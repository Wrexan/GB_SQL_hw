-- 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них.
-- Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

USE shop;

DROP TRIGGER IF EXISTS check_for_null_in_name_n_description_before_insert;
DROP TRIGGER IF EXISTS check_for_null_in_name_n_description_before_update;

DELIMITER //

CREATE TRIGGER check_for_null_in_name_n_description_before_insert BEFORE INSERT ON products
FOR EACH ROW
begin
    IF (NEW.name IS NULL) AND (NEW.description IS NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. At least one of products.name or products.description must have a value.';
    END IF;
END//

CREATE TRIGGER check_for_null_in_name_n_description_before_update BEFORE UPDATE ON products
FOR EACH ROW
begin
    IF (NEW.name IS NULL) AND (NEW.description IS NULL) THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. At least one of products.name or products.description must have a value.';
    END IF;
END//

DELIMITER ;

INSERT INTO products VALUES 
	(NULL, NULL, NULL, 1000, 1, now(), now());
	
UPDATE products	SET
	name = NULL,
	description = NULL
WHERE id = 1;