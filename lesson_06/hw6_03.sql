-- 3. Определить, кто больше поставил лайков (всего) - мужчины или женщины?

-- code to check result
-- SELECT count(like_type) FROM posts_likes WHERE (SELECT gender FROM profiles WHERE profiles.user_id = posts_likes.user_id LIMIT 2) = 'm' AND like_type

-- SELECT count(like_type) FROM posts_likes WHERE (SELECT gender FROM profiles WHERE profiles.user_id = posts_likes.user_id LIMIT 2) = 'f' AND like_type

SET @f := (SELECT count(like_type) FROM posts_likes WHERE like_type AND (SELECT gender FROM profiles WHERE profiles.user_id = posts_likes.user_id) = 'f');
SET @m := (SELECT count(like_type) FROM posts_likes WHERE like_type AND (SELECT gender FROM profiles WHERE profiles.user_id = posts_likes.user_id) = 'm');
SELECT IF(@f = @m,'fm', IF(@f > @m, 'f', 'm')) most_likers;
