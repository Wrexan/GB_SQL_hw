/* «Агрегация данных». Для задания 3. */
DROP TABLE IF EXISTS x;
CREATE TABLE x (id INT PRIMARY KEY);
INSERT INTO x VALUES (1), (2), (3), (4), (5);

 
 -- (по желанию) Подсчитайте произведение чисел в столбце таблицы.

SELECT EXP(SUM(LOG(id))) AS multiply_result FROM x