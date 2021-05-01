-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

USE shop;

DELIMITER //
CREATE PROCEDURE wanna_flowers(amount INT)
BEGIN
	SET @co = 0;
	million_scarlet_roses: LOOP
		SET @co = @co + 1;
		IF @co <= amount THEN
			INSERT INTO users VALUES 
			(NULL, 'Роза', now(), now(), now());
			ITERATE million_scarlet_roses;
		END IF;
		LEAVE million_scarlet_roses;
	END LOOP million_scarlet_roses;
END//
DELIMITER ;

CALL wanna_flowers(1000000);-- ОСТОРОЖНО! 100 инсертов заняло 13 секунд, 1000000 может занять около 36 часов.
DROP PROCEDURE IF EXISTS wanna_flowers;
