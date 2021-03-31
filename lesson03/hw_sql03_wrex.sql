-- ======================================================================================
-- Таблица черных списков
CREATE TABLE black_list (
  ignored_by_user_id BIGINT UNSIGNED NOT NULL,
  ignored_user_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(ignored_by_user_id, ignored_user_id),
  INDEX ignored_by_user_idx (ignored_by_user_id),
  INDEX ignored_user_idx (ignored_user_id),
  CONSTRAINT fk_black_list_users_1 FOREIGN KEY (ignored_by_user_id) REFERENCES users (id),
  CONSTRAINT fk_black_list_users_2 FOREIGN KEY (ignored_user_id) REFERENCES users (id)
);

-- И прогневал Василий Петра, и добавил Петр Василия в черный список
INSERT INTO black_list VALUES (1, 2);

SELECT * FROM black_list;
-- К сожалению внятных способов ограничить количество игнорируемых не нашел
-- В таком виде количество строк таблицы может достигнуть числа пользователей в квадрате
-- ======================================================================================

-- ======================================================================================
-- Таблица постов
CREATE TABLE user_posts (
  post_author_id BIGINT UNSIGNED NOT NULL,
  post_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  post_title VARCHAR(256) NOT NULL DEFAULT 'New post',
  post_text TEXT NOT NULL,
  post_media_id BIGINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY(post_author_id, post_created_at),
  INDEX post_author_idx (post_author_id),
  CONSTRAINT fk_user_posts_users FOREIGN KEY (post_author_id) REFERENCES users (id),
  CONSTRAINT fk_user_posts_media FOREIGN KEY (post_media_id) REFERENCES media (id)
);

-- И снизошло на Василия озарение, и понес Василий энтропию в заблудшие души  
INSERT INTO user_posts VALUES (1, DEFAULT, 'Вася маладец!', 'Сиводня написал свой первыый пост. Йу-хууу!!11', DEFAULT);

SELECT * FROM user_posts;
-- ======================================================================================
