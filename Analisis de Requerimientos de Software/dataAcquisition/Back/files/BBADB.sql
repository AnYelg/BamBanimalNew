
DROP SCHEMA IF EXISTS bam_banimals_adventure_db;
CREATE SCHEMA bam_banimals_adventure_db;
USE bam_banimals_adventure_db;

-- -----------------------------------------------------
-- Table `BamBanimalsAdventureDB`.`LEVELS`
-- -----------------------------------------------------
CREATE TABLE LEVELS (
  id_LEVELS INT UNSIGNED NOT NULL AUTO_INCREMENT,
  TimesPlayed INT NOT NULL,
  PRIMARY KEY (`id_LEVELS`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- Table `BamBanimalsAdventureDB`.`USER`
-- -----------------------------------------------------
CREATE TABLE USER (
  id_USER INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Nickname VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_USER`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------
-- Table `BamBanimalsAdventureDB`.`USER-SCORE`
-- -----------------------------------------------------
CREATE TABLE USER_SCORE (
id_USER_SCORE INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_USER INT UNSIGNED NOT NULL,
  id_LEVELS INT UNSIGNED NOT NULL,
  Bambastic INT(10) NOT NULL,
  Noice INT(10) NOT NULL,
  Keep_trying INT(10) NOT NULL,
  Oops INT(10) NOT NULL,
  PRIMARY KEY (id_USER_SCORE),
  CONSTRAINT `fk_id_USER` 
	FOREIGN KEY (id_USER)
    REFERENCES USER (id_USER),
  CONSTRAINT `fk_id_LEVELS` 
	FOREIGN KEY (id_LEVELS) 
	REFERENCES LEVELS (id_LEVELS) 
	ON DELETE RESTRICT 
	ON UPDATE CASCADE)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  
INSERT INTO LEVELS VALUES (1,4);
INSERT INTO USER_SCORE VALUES (1, 1,'3','2','1','0');
INSERT INTO USER VALUES (1, 'ariigato');
