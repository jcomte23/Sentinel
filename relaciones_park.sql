
create database parqueadero;
use parqueadero;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PARK_GESTION
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PARK_GESTION` ;

-- -----------------------------------------------------
-- Schema PARK_GESTION
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PARK_GESTION` DEFAULT CHARACTER SET utf8 ;
USE `PARK_GESTION` ;

-- -----------------------------------------------------
-- Table `PARK_GESTION`.`tipo_documentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`tipo_documentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `abreviatura` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`tipos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`tipos_usuarios` (
  `id` INT(14) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`usuarios` (
  `id` INT(14) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `correo` VARCHAR(120) NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
  `tipo_documento_id` INT NOT NULL,
  `direccion` VARCHAR(60) NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `tipos_usuario_id` INT(14) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_USUARIOS_TIPO_DOCUMENTOS1`
    FOREIGN KEY (`tipo_documento_id`)
    REFERENCES `PARK_GESTION`.`tipo_documentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_tipos_usuarios1`
    FOREIGN KEY (`tipos_usuario_id`)
    REFERENCES `PARK_GESTION`.`tipos_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_USUARIOS_TIPO_DOCUMENTOS1_idx` ON `PARK_GESTION`.`usuarios` (`tipo_documento_id` ASC) VISIBLE;

CREATE INDEX `fk_usuarios_tipos_usuarios1_idx` ON `PARK_GESTION`.`usuarios` (`tipos_usuario_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`tipo_vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`tipo_vehiculos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`colores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`colores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`marcas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`vehiculos` (
  `id` INT NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `placa` VARCHAR(10) NULL,
  `tipo_vehiculo_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  `marca_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_VEHICULOS_TIPO_VEHICULO1`
    FOREIGN KEY (`tipo_vehiculo_id`)
    REFERENCES `PARK_GESTION`.`tipo_vehiculos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICULOS_COLORES1`
    FOREIGN KEY (`color_id`)
    REFERENCES `PARK_GESTION`.`colores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICULOS_MARCAS1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `PARK_GESTION`.`marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_VEHICULOS_TIPO_VEHICULO1_idx` ON `PARK_GESTION`.`vehiculos` (`tipo_vehiculo_id` ASC) VISIBLE;

CREATE INDEX `fk_VEHICULOS_COLORES1_idx` ON `PARK_GESTION`.`vehiculos` (`color_id` ASC) VISIBLE;

CREATE INDEX `fk_VEHICULOS_MARCAS1_idx` ON `PARK_GESTION`.`vehiculos` (`marca_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`plazas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`plazas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`historial_vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`historial_vehiculos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ingreso` VARCHAR(255) NOT NULL,
  `salida` VARCHAR(255) NULL,
  `vehiculos_id` INT NOT NULL,
  `usuarios_id` INT(14) NOT NULL,
  `plazas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_historial_vehiculos_vehiculos1`
    FOREIGN KEY (`vehiculos_id`)
    REFERENCES `PARK_GESTION`.`vehiculos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historial_vehiculos_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `PARK_GESTION`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historial_vehiculos_plazas1`
    FOREIGN KEY (`plazas_id`)
    REFERENCES `PARK_GESTION`.`plazas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_historial_vehiculos_vehiculos1_idx` ON `PARK_GESTION`.`historial_vehiculos` (`vehiculos_id` ASC) VISIBLE;

CREATE INDEX `fk_historial_vehiculos_usuarios1_idx` ON `PARK_GESTION`.`historial_vehiculos` (`usuarios_id` ASC) VISIBLE;

CREATE INDEX `fk_historial_vehiculos_plazas1_idx` ON `PARK_GESTION`.`historial_vehiculos` (`plazas_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `PARK_GESTION`.`DUEÑO_VEHICULO_has_DATOS_VEHICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PARK_GESTION`.`DUEÑO_VEHICULO_has_DATOS_VEHICULO` (
  `DUEÑO_VEHICULO_NOMBRE` VARCHAR(45) NOT NULL,
  `DUEÑO_VEHICULO_USUARIO_NOMBRE` VARCHAR(45) NOT NULL,
  `DUEÑO_VEHICULO_USUARIO_EDAD` VARCHAR(30) NOT NULL,
  `DUEÑO_VEHICULO_USUARIO_EMAIL` VARCHAR(120) NOT NULL,
  `DUEÑO_VEHICULO_USUARIO_DOCUMENTO` VARCHAR(30) BINARY NOT NULL,
  `DATOS_VEHICULO_placa` DATE NOT NULL,
  `DATOS_VEHICULO_USUARIO_NOMBRE` VARCHAR(45) NOT NULL,
  `DATOS_VEHICULO_USUARIO_DOCUMENTO` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`DUEÑO_VEHICULO_NOMBRE`, `DUEÑO_VEHICULO_USUARIO_NOMBRE`, `DUEÑO_VEHICULO_USUARIO_EDAD`, `DUEÑO_VEHICULO_USUARIO_EMAIL`, `DUEÑO_VEHICULO_USUARIO_DOCUMENTO`, `DATOS_VEHICULO_placa`, `DATOS_VEHICULO_USUARIO_NOMBRE`, `DATOS_VEHICULO_USUARIO_DOCUMENTO`),
  CONSTRAINT `fk_DUEÑO_VEHICULO_has_DATOS_VEHICULO_DUEÑO_VEHICULO1`
    FOREIGN KEY (`DUEÑO_VEHICULO_NOMBRE`)
    REFERENCES `PARK_GESTION`.`tipo_vehiculos` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DUEÑO_VEHICULO_has_DATOS_VEHICULO_DATOS_VEHICULO1`
    FOREIGN KEY (`DATOS_VEHICULO_placa` , `DATOS_VEHICULO_USUARIO_NOMBRE`)
    REFERENCES `PARK_GESTION`.`vehiculos` (`placa` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_DUEÑO_VEHICULO_has_DATOS_VEHICULO_DATOS_VEHICULO1_idx` ON `PARK_GESTION`.`DUEÑO_VEHICULO_has_DATOS_VEHICULO` (`DATOS_VEHICULO_placa` ASC, `DATOS_VEHICULO_USUARIO_NOMBRE` ASC, `DATOS_VEHICULO_USUARIO_DOCUMENTO` ASC) VISIBLE;

CREATE INDEX `fk_DUEÑO_VEHICULO_has_DATOS_VEHICULO_DUEÑO_VEHICULO1_idx` ON `PARK_GESTION`.`DUEÑO_VEHICULO_has_DATOS_VEHICULO` (`DUEÑO_VEHICULO_NOMBRE` ASC, `DUEÑO_VEHICULO_USUARIO_NOMBRE` ASC, `DUEÑO_VEHICULO_USUARIO_EDAD` ASC, `DUEÑO_VEHICULO_USUARIO_EMAIL` ASC, `DUEÑO_VEHICULO_USUARIO_DOCUMENTO` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


