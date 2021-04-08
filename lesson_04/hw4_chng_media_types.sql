USE vk;
UPDATE media_types
	SET media_types.name = CASE id
	WHEN 1 THEN 'image'
	WHEN 2 THEN 'audio'
	WHEN 3 THEN 'video'
	WHEN 4 THEN 'document'
	END;
SELECT * FROM media_types;