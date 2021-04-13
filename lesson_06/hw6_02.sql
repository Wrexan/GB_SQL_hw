-- 2. Подсчитать общее количество лайков на посты, которые получили пользователи младше 18 лет.


-- SELECT  -- LEFT THIS PEACE OF CODE JUST FOR CHECKS
-- 	post_id,
-- 	(SELECT posts.user_id FROM posts WHERE posts.id = post_id) AS auth_id,
-- 	(SELECT first_name FROM users WHERE users.id = (
-- 		SELECT posts.user_id FROM posts WHERE posts.id = post_id)) AS name,
-- 	(SELECT TIMESTAMPDIFF(YEAR, profiles.birthday, CURDATE()) AS age FROM profiles WHERE user_id = (
-- 		SELECT posts.user_id FROM posts WHERE posts.id = posts_likes.post_id)) AS age,
-- 	count(post_id)
-- FROM posts_likes
-- WHERE (
-- 	SELECT TIMESTAMPDIFF(YEAR, profiles.birthday, CURDATE()) AS age FROM profiles WHERE user_id = (
-- 		SELECT posts.user_id FROM posts WHERE posts.id = posts_likes.post_id)) < 100 -- 18
-- 	AND
-- 	like_type = 1
-- GROUP BY post_id

SELECT
	count(post_id) AS likes
FROM posts_likes
WHERE (
	SELECT TIMESTAMPDIFF(YEAR, profiles.birthday, CURDATE()) AS age FROM profiles WHERE user_id = (
		SELECT posts.user_id FROM posts WHERE posts.id = posts_likes.post_id)) < 18
	AND
	like_type = 1
