-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

USE shop;

DELIMITER //
CREATE PROCEDURE wanna_flowers(amount INT)
BEGIN
	SET @co = 0;
	SET @dt = now();
	million_scarlet_roses: LOOP
		SET @co = @co + 1;
		IF @co <= amount THEN
			INSERT INTO users VALUES 
			(NULL, 'Роза', @dt, @dt, @dt);
			ITERATE million_scarlet_roses;
		END IF;
		LEAVE million_scarlet_roses;
	END LOOP million_scarlet_roses;
END//
DELIMITER ;

CALL wanna_flowers(1000000);-- Осторожно! 100 циклов - 7 сек. 1000000 ~ 20 часов
DROP PROCEDURE IF EXISTS wanna_flowers;
