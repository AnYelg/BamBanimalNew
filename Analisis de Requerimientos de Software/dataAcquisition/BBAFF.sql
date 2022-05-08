-- MySQL Workbench Forward Engineering

DROP SCHEMA IF EXISTS bam_banimals_adventure_db;
CREATE SCHEMA IF NOT EXISTS `bam_banimals_adventure_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE bam_banimals_adventure_db;

-- -----------------------------------------------------
-- Table `bam_banimals_adventure_db`.`LEVELS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bam_banimals_adventure_db`.`LEVELS` (
  `id_LEVELS` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TimesPlayed` INT NOT NULL,
  PRIMARY KEY (`id_LEVELS`))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bam_banimals_adventure_db`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bam_banimals_adventure_db`.`USER` (
  `id_USER` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nickname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_USER`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bam_banimals_adventure_db`.`USER_SCORE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bam_banimals_adventure_db`.`USER_SCORE` (
  `id_USER_SCORE` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_USER` INT UNSIGNED NOT NULL,
  `id_LEVELS` INT UNSIGNED NOT NULL,
  `Bambastic` INT NOT NULL,
  `Noice` INT NOT NULL,
  `Keep_trying` INT NOT NULL,
  `Oops` INT NOT NULL,
  `total_score` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_USER_SCORE`),
  INDEX `fk_id_USER` (`id_USER` ASC) VISIBLE,
  INDEX `fk_id_LEVELS` (`id_LEVELS` ASC) VISIBLE,
  CONSTRAINT `fk_id_LEVELS`
    FOREIGN KEY (`id_LEVELS`)
    REFERENCES `bam_banimals_adventure_db`.`LEVELS` (`id_LEVELS`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_id_USER`
    FOREIGN KEY (`id_USER`)
    REFERENCES `bam_banimals_adventure_db`.`USER` (`id_USER`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `bam_banimals_adventure_db` ;

-- -----------------------------------------------------
-- Placeholder table for view `bam_banimals_adventure_db`.`high_score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bam_banimals_adventure_db`.`high_score` (`id_USER_SCORE` INT, `Nickname` INT);

-- -----------------------------------------------------
-- Placeholder table for view `bam_banimals_adventure_db`.`max_high_score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bam_banimals_adventure_db`.`max_high_score` (`Nickname` INT, `Bambastic` INT, `Noice` INT, `Keep_trying` INT, `Oops` INT, `total_bambastic` INT, `total_noice` INT, `total_KT` INT, `total_Oops` INT, `Final_Score` INT);

-- -----------------------------------------------------
-- procedure get_attempt
-- -----------------------------------------------------

DELIMITER $$
USE `bam_banimals_adventure_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_attempt`(in LEVELS int)
BEGIN
	select TimesPlayed
    from LEVELS
    where LEVELS = id_LEVELS;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_score
-- -----------------------------------------------------

DELIMITER $$
USE `bam_banimals_adventure_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_score`(in player varchar(255))
BEGIN
	select total_score
    from USER_SCORE usc
    inner join user u on usc.id_USER_SCORE = u.id_USER
    where nickname = player;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `bam_banimals_adventure_db`.`high_score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bam_banimals_adventure_db`.`high_score`;
USE `bam_banimals_adventure_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bam_banimals_adventure_db`.`high_score` AS select `bam_banimals_adventure_db`.`user_score`.`id_USER_SCORE` AS `id_USER_SCORE`,`bam_banimals_adventure_db`.`user`.`Nickname` AS `Nickname` from (`bam_banimals_adventure_db`.`user_score` join `bam_banimals_adventure_db`.`user`) order by `bam_banimals_adventure_db`.`user_score`.`Bambastic`,`bam_banimals_adventure_db`.`user_score`.`Noice`,`bam_banimals_adventure_db`.`user_score`.`Keep_trying`,`bam_banimals_adventure_db`.`user_score`.`Oops` desc limit 1;

-- -----------------------------------------------------
-- View `bam_banimals_adventure_db`.`max_high_score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bam_banimals_adventure_db`.`max_high_score`;
USE `bam_banimals_adventure_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bam_banimals_adventure_db`.`max_high_score` AS select `U`.`Nickname` AS `Nickname`,`US`.`Bambastic` AS `Bambastic`,`US`.`Noice` AS `Noice`,`US`.`Keep_trying` AS `Keep_trying`,`US`.`Oops` AS `Oops`,(coalesce(`US`.`Bambastic`) * 3) AS `total_bambastic`,(coalesce(`US`.`Noice`) * 2) AS `total_noice`,(coalesce(`US`.`Keep_trying`) * 1) AS `total_KT`,(coalesce(`US`.`Oops`) * 0) AS `total_Oops`,((((coalesce(`US`.`Bambastic`) * 3) + (coalesce(`US`.`Noice`) * 2)) + (coalesce(`US`.`Keep_trying`) * 1)) + (coalesce(`US`.`Oops`) * 0)) AS `Final_Score` from (`bam_banimals_adventure_db`.`user_score` `US` join `bam_banimals_adventure_db`.`user` `U` on((`U`.`id_USER` = `US`.`id_USER_SCORE`))) order by `U`.`Nickname`;
USE `bam_banimals_adventure_db`;

DELIMITER $$
USE `bam_banimals_adventure_db`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bam_banimals_adventure_db`.`USER_SCORE_BEFORE_UPDATE`
BEFORE UPDATE ON `bam_banimals_adventure_db`.`USER_SCORE`
FOR EACH ROW
BEGIN
	IF coalesce(Bambastic) * 3 + coalesce(Noice) * 2 + coalesce(Keep_trying) * 1 + coalesce(Oops) * 0 > old.total_score THEN
		SET new.total_score = coalesce(Bambastic) * 3 + coalesce(Noice) * 2 + coalesce(Keep_trying) * 1 + coalesce(Oops) * 0;
	END IF;
END$$


DELIMITER ;
INSERT INTO LEVELS VALUES (1,1);
INSERT INTO LEVELS VALUES (2,21);
INSERT INTO LEVELS VALUES (3,30);
INSERT INTO LEVELS VALUES (4,6);
INSERT INTO LEVELS VALUES (5,10);
INSERT INTO LEVELS VALUES (6,2);

INSERT INTO USER VALUES (1, 'ariigato');
INSERT INTO USER VALUES (2, 'yelatina');
INSERT INTO USER VALUES (3, 'AndyPandy');
INSERT INTO USER VALUES (4, 'Jaboobs');
INSERT INTO USER VALUES (5, 'G0lden W0lf');
INSERT INTO USER VALUES (6, 'Octa');
INSERT INTO USER VALUES (7, 'Josh');
INSERT INTO USER VALUES (8, 'Capimuse');
INSERT INTO USER VALUES (9, 'MarcoPolo');
INSERT INTO USER VALUES (10, 'Jajavi');

INSERT INTO USER_SCORE VALUES (1,1,1,3,2,1,0,0);
INSERT INTO USER_SCORE VALUES (2,2,1,3,2,1,0,0);
INSERT INTO USER_SCORE VALUES (3,3,1,3,2,1,0,0);
INSERT INTO USER_SCORE VALUES (4,4,1,3,2,1,0,0);
INSERT INTO USER_SCORE VALUES (5,5,1,3,2,1,0,0);


