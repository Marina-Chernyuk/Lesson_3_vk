USE vk;

DROP TABLE IF EXISTS my_video_albums;
CREATE TABLE my_video_albums (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
  	PRIMARY KEY (`id`)
) COMMENT = 'Мои видео альбомы';

DESCRIBE my_video_albums;

DROP TABLE IF EXISTS video_catalogs;
CREATE TABLE video_catalogs (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
  	PRIMARY KEY (`id`)
) COMMENT = 'Каталог видео';

DESCRIBE video_catalogs;

DROP TABLE IF EXISTS videos;
CREATE TABLE videos (
	id SERIAL,
	`album_id` BIGINT unsigned NULL,
	`catalog_id` BIGINT unsigned NULL,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES my_video_albums(id),
	FOREIGN KEY (catalog_id) REFERENCES video_catalogs(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

ALTER TABLE videos 
	ADD COLUMN name VARCHAR(255) DEFAULT NULL, -- название видео
	ADD COLUMN duration TIME NOT NULL, -- продолжительность видео
	ADD COLUMN created_at DATETIME DEFAULT NOW(), -- дата создания
	ADD COLUMN format CHAR(10) NOT NULL, -- формат видео
	ADD COLUMN description TEXT; -- описание
	
DESCRIBE videos;	
	
SHOW TABLES;
