-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

-- Решение вложенным запросом
SELECT name FROM users WHERE users.id in (SELECT DISTINCT user_id FROM orders)
-- Решение с помощью JOIN
SELECT DISTINCT name FROM users JOIN orders ON (users.id = user_id)
