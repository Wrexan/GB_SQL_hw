-- 4. (по желанию) Найти пользователя, который проявляет наименьшую активность в использовании социальной сети
-- (тот, кто написал меньше всего сообщений, отправил меньше всего заявок в друзья, ...).

-- code to check result
-- SELECT
-- 	id,
-- 	(SELECT count(user_id) FROM posts WHERE posts.user_id = users.id) posts,
-- 	(SELECT count(user_id) FROM posts_likes WHERE posts_likes.user_id = users.id) likes,
-- 	(SELECT count(from_user_id) FROM messages WHERE messages.from_user_id = users.id) messages,
-- 	(SELECT count(from_user_id) FROM friend_requests WHERE friend_requests.from_user_id = users.id) friend_requests,
-- 	(SELECT count(user_id) FROM communities_users WHERE communities_users.user_id = users.id) in_communities,
-- 	(SELECT count(user_id) FROM media WHERE media.user_id = users.id) media_loaded,
-- 	(SELECT (posts + likes + messages + friend_requests + in_communities + media_loaded)) AS total_actions
-- FROM users
-- ORDER BY total_actions

SELECT
	id,
	concat(first_name, ' ', last_name) least_active_user
FROM users
ORDER BY 
	(SELECT count(user_id) FROM posts WHERE posts.user_id = users.id) +
	(SELECT count(user_id) FROM posts_likes WHERE posts_likes.user_id = users.id) +
	(SELECT count(from_user_id) FROM messages WHERE messages.from_user_id = users.id) +
	(SELECT count(from_user_id) FROM friend_requests WHERE friend_requests.from_user_id = users.id) +
	(SELECT count(user_id) FROM communities_users WHERE communities_users.user_id = users.id) +
	(SELECT count(user_id) FROM media WHERE media.user_id = users.id)
LIMIT 1



