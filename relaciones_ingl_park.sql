CREATE DATABASE parqueadero;
USE parqueadero;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PARK_MANAGEMENT
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PARK_MANAGEMENT`;

-- -----------------------------------------------------
-- Schema PARK_MANAGEMENT
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PARK_MANAGEMENT` DEFAULT CHARACTER SET utf8;
USE `PARK_MANAGEMENT`;

-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`document_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`document_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `abbreviation` VARCHAR(10) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`user_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`user_types` (
  `id` INT(14) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`users` (
  `id` INT(14) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `document` VARCHAR(45) NOT NULL,
  `document_type_id` INT NOT NULL,
  `address` VARCHAR(60) NULL,
  `phone` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NULL,
  `user_type_id` INT(14) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_USERS_DOCUMENT_TYPES1`
    FOREIGN KEY (`document_type_id`)
    REFERENCES `PARK_MANAGEMENT`.`document_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_user_types1`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `PARK_MANAGEMENT`.`user_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE INDEX `fk_USERS_DOCUMENT_TYPES1_idx` ON `PARK_MANAGEMENT`.`users` (`document_type_id` ASC) VISIBLE;

CREATE INDEX `fk_users_user_types1_idx` ON `PARK_MANAGEMENT`.`users` (`user_type_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`vehicle_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`vehicle_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`colors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`brands` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`vehicles` (
  `id` INT NOT NULL,
  `model` VARCHAR(45) NULL,
  `plate` VARCHAR(10) NULL,
  `vehicle_type_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_VEHICLES_VEHICLE_TYPES1`
    FOREIGN KEY (`vehicle_type_id`)
    REFERENCES `PARK_MANAGEMENT`.`vehicle_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICLES_COLORS1`
    FOREIGN KEY (`color_id`)
    REFERENCES `PARK_MANAGEMENT`.`colors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICLES_BRANDS1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `PARK_MANAGEMENT`.`brands` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE INDEX `fk_VEHICLES_VEHICLE_TYPES1_idx` ON `PARK_MANAGEMENT`.`vehicles` (`vehicle_type_id` ASC) VISIBLE;

CREATE INDEX `fk_VEHICLES_COLORS1_idx` ON `PARK_MANAGEMENT`.`vehicles` (`color_id` ASC) VISIBLE;

CREATE INDEX `fk_VEHICLES_BRANDS1_idx` ON `PARK_MANAGEMENT`.`vehicles` (`brand_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`parking_spaces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`parking_spaces` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`vehicle_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`vehicle_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entry` VARCHAR(255) NOT NULL,
  `exit` VARCHAR(255) NULL,
  `vehicle_id` INT NOT NULL,
  `user_id` INT(14) NOT NULL,
  `parking_space_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vehicle_history_vehicles1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `PARK_MANAGEMENT`.`vehicles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_history_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `PARK_MANAGEMENT`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_history_parking_spaces1`
    FOREIGN KEY (`parking_space_id`)
    REFERENCES `PARK_MANAGEMENT`.`parking_spaces` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE INDEX `fk_vehicle_history_vehicles1_idx` ON `PARK_MANAGEMENT`.`vehicle_history` (`vehicle_id` ASC) VISIBLE;

CREATE INDEX `fk_vehicle_history_users1_idx` ON `PARK_MANAGEMENT`.`vehicle_history` (`user_id` ASC) VISIBLE;

CREATE INDEX `fk_vehicle_history_parking_spaces1_idx` ON `PARK_MANAGEMENT`.`vehicle_history` (`parking_space_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `PARK_MANAGEMENT`.`VEHICLE_OWNER_has_VEHICLE_DATA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_MANAGEMENT`.`VEHICLE_OWNER_has_VEHICLE_DATA` (
  `VEHICLE_OWNER_NAME` VARCHAR(45) NOT NULL,
  `VEHICLE_OWNER_USER_NAME` VARCHAR(45) NOT NULL,
  `VEHICLE_OWNER_USER_AGE` VARCHAR(30) NOT NULL,
  `VEHICLE_OWNER_USER_EMAIL` VARCHAR(120) NOT NULL,
  `VEHICLE_OWNER_USER_DOCUMENT` VARCHAR(30) BINARY NOT NULL,
  `VEHICLE_DATA_plate` DATE NOT NULL,
  `VEHICLE_DATA_USER_NAME` VARCHAR(45) NOT NULL,
  `VEHICLE_DATA_USER_DOCUMENT` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`VEHICLE_OWNER_NAME`, `VEHICLE_OWNER_USER_NAME`, `VEHICLE_OWNER_USER_AGE`, `VEHICLE_OWNER_USER_EMAIL`, `VEHICLE_OWNER_USER_DOCUMENT`, `VEHICLE_DATA_plate`, `VEHICLE_DATA_USER_NAME`, `VEHICLE_DATA_USER_DOCUMENT`),
  CONSTRAINT `fk_VEHICLE_OWNER_has_VEHICLE_DATA_VEHICLE_OWNER`
    FOREIGN KEY (`VEHICLE_OWNER_NAME`)
    REFERENCES `PARK_MANAGEMENT`.`vehicle_types` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICLE_OWNER_has_VEHICLE_DATA_VEHICLE_DATA`
    FOREIGN KEY (`VEHICLE_DATA_plate`, `VEHICLE_DATA_USER_NAME`)
    REFERENCES `PARK_MANAGEMENT`.`vehicles` (`plate`, `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE INDEX `fk_VEHICLE_OWNER_has_VEHICLE_DATA_VEHICLE_DATA_idx` ON `PARK_MANAGEMENT`.`VEHICLE_OWNER_has_VEHICLE_DATA` (`VEHICLE_DATA_plate` ASC, `VEHICLE_DATA_USER_NAME` ASC, `VEHICLE_DATA_USER_DOCUMENT` ASC) VISIBLE;

CREATE INDEX `fk_VEHICLE_OWNER_has_VEHICLE_DATA_VEHICLE_OWNER_idx` ON `PARK_MANAGEMENT`.`VEHICLE_OWNER_has_VEHICLE_DATA` (`VEHICLE_OWNER_NAME` ASC, `VEHICLE_OWNER_USER_NAME` ASC, `VEHICLE_OWNER_USER_AGE` ASC, `VEHICLE_OWNER_USER_EMAIL` ASC, `VEHICLE_OWNER_USER_DOCUMENT` ASC) VISIBLE;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
