-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.


SELECT name FROM users WHERE users.id in (SELECT DISTINCT user_id FROM orders)



