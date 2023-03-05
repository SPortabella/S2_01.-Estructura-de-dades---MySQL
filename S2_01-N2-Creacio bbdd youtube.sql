-- MySQL Workbench Synchronization
-- Generated: 2023-03-05 22:37
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Susana

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_password` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(50) NOT NULL,
  `user_gender` ENUM('M', 'F') NULL DEFAULT NULL,
  `user_country` VARCHAR(45) NULL DEFAULT NULL,
  `user_postalcode` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `User_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`videos` (
  `videos_id` INT(11) NOT NULL AUTO_INCREMENT,
  `videos_tittle` VARCHAR(45) NOT NULL,
  `videos_description` VARCHAR(100) NULL DEFAULT NULL,
  `videos_size` DOUBLE NULL DEFAULT NULL,
  `videos_filename` VARCHAR(45) NULL DEFAULT NULL,
  `videos_duration` INT(11) NULL DEFAULT NULL,
  `videos_thumbnail` VARCHAR(45) NULL DEFAULT NULL,
  `videos_state` ENUM('Public', 'Private', 'Ocult') NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `videos_data_post` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`videos_id`),
  INDEX `fk_videos_User1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`video_information` (
  `videos_id` INT(11) NOT NULL,
  `number_of_reproductions` INT(11) NULL DEFAULT NULL,
  `number_of_likes` INT(11) NULL DEFAULT NULL,
  `number_of_fislikes` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`videos_id`),
  CONSTRAINT `fk_video_information_videos`
    FOREIGN KEY (`videos_id`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`tags` (
  `tags_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tags_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`tags_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`videos_has_tags` (
  `videos_id` INT(11) NOT NULL,
  `tags_id` INT(11) NOT NULL,
  PRIMARY KEY (`videos_id`, `tags_id`),
  INDEX `fk_tags_has_videos_videos1_idx` (`videos_id` ASC) VISIBLE,
  INDEX `fk_videos_has_tags_tags1_idx` (`tags_id` ASC) VISIBLE,
  CONSTRAINT `fk_tags_has_videos_videos1`
    FOREIGN KEY (`videos_id`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_tags_tags1`
    FOREIGN KEY (`tags_id`)
    REFERENCES `youtube`.`tags` (`tags_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`channels` (
  `channels_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `channels_name` VARCHAR(45) NULL DEFAULT NULL,
  `channels_description` VARCHAR(100) NULL DEFAULT NULL,
  `chanels_created_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`channels_id`, `user_id`),
  INDEX `fk_chanels_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_chanels_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`subscribed_channels` (
  `user_id` INT(11) NOT NULL,
  `channels_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `channels_id`),
  INDEX `fk_user_has_channels_channels1_idx` (`channels_id` ASC) VISIBLE,
  INDEX `fk_user_has_channels_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_channels_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_channels_channels1`
    FOREIGN KEY (`channels_id`)
    REFERENCES `youtube`.`channels` (`channels_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`video_like_dislike` (
  `user_id` INT(11) NOT NULL,
  `videos_id` INT(11) NOT NULL,
  `likes_data` DATETIME NULL DEFAULT NULL,
  `dislike_data` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `videos_id`),
  INDEX `fk_user_has_videos_videos1_idx` (`videos_id` ASC) VISIBLE,
  INDEX `fk_user_has_videos_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_videos_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_videos_videos1`
    FOREIGN KEY (`videos_id`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `playlist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` VARCHAR(45) NULL DEFAULT NULL,
  `playlist_created_date` DATETIME NULL DEFAULT NULL,
  `playlist_state` ENUM('Privat', 'Public') NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_id`, `user_id`),
  INDEX `fk_playllist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playllist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist_has_videos` (
  `playlist_playlist_id` INT(11) NOT NULL,
  `videos_videos_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_playlist_id`, `videos_videos_id`),
  INDEX `fk_playlist_has_videos_videos1_idx` (`videos_videos_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_videos_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_videos_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `youtube`.`playlist` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_videos_videos1`
    FOREIGN KEY (`videos_videos_id`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`comments` (
  `comments_id` INT(11) NOT NULL AUTO_INCREMENT,
  `videos_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `comments_text` VARCHAR(200) NULL DEFAULT NULL,
  `comments_data` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`comments_id`, `videos_id`, `user_id`),
  INDEX `fk_comments_videos1_idx` (`videos_id` ASC) VISIBLE,
  INDEX `fk_comments_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_videos1`
    FOREIGN KEY (`videos_id`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`comment_like_dislike` (
  `user_id` INT(11) NOT NULL,
  `comments_id` INT(11) NOT NULL,
  `comment_like_dislike_option` ENUM('L', 'D') NULL DEFAULT NULL,
  `comment_like_dislike_data` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `comments_id`),
  INDEX `fk_user_has_comments_comments1_idx` (`comments_id` ASC) VISIBLE,
  INDEX `fk_user_has_comments_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_comments_comments1`
    FOREIGN KEY (`comments_id`)
    REFERENCES `youtube`.`comments` (`comments_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into user values (1, '1234', 'Susana','susana@gmail.com','F','Spain',08310);
insert into user values (2, '1234', 'Andrea','andrea@gmail.com','F','Spain',08310);
insert into user values (3, '1234', 'Pere','pere@gmail.com','M','Spain',08310);

insert into channels values (1,1,'Channel 1', null, now());
insert into channels values (2,3,'Channel 2', null, now());

insert into subscribed_channels values (1,1);
insert into subscribed_channels values (1,2);
insert into subscribed_channels values (3,1);

insert into playlist values (1,'playlist 1', now(), 'Privat', 1);
insert into playlist values (2,'playlist 2', now(), 'Privat', 3);

insert into videos values (1,'video 1', 'description1',123.1, null,null, null, 'Private',1, now());
insert into videos values (2,'video 2', 'description2',123.1, null,null, null, 'Private',1, now());
insert into videos values (3,'video 3', 'description3',123.1, null,null, null, 'Private',2, now());
insert into videos values (4,'video 4', 'description4',123.1, null,null, null, 'Private',3, now());

insert into playlist_has_videos values (1, 1);
insert into playlist_has_videos values (1, 4);
insert into playlist_has_videos values (2, 1);
insert into playlist_has_videos values (2, 2);
insert into playlist_has_videos values (2, 3);
insert into playlist_has_videos values (2, 4);

insert into video_like_dislike values (1,1,'2023-02-25',null);
insert into video_like_dislike values (1,3,null, '2023-02-25');

insert into tags values (1,'tag1');
insert into tags values (2,'tag2');
insert into videos_has_tags values (3,1);

insert into video_information values (4,23,23,12);

insert into comments values (1,1,1,'no me ha gustado', '2023-01-18');
insert into comments values (2,1,1,'Fantástico', '2023-01-18');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
