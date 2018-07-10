-- MySQL Script generated by MySQL Workbench
-- 06/02/17 10:09:44
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CRUD_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CRUD_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CRUD_DB` ;
-- -----------------------------------------------------
-- Schema CRUD_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CRUD_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CRUD_DB` ;
USE `CRUD_DB` ;
USE `CRUD_DB` ;

-- -----------------------------------------------------
-- Table `CRUD_DB`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRUD_DB`.`rol` (
  `Rol` VARCHAR(15) NOT NULL,
  `estado_rol` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRUD_DB`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRUD_DB`.`genero` (
  `Genero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRUD_DB`.`tipo_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRUD_DB`.`tipo_documento` (
  `cod_tdoc` VARCHAR(3) NOT NULL,
  `desc_tdoc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_tdoc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRUD_DB`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRUD_DB`.`usuario` (
  `id_usuario` BIGINT(30) NOT NULL,
  `nombre_usu` VARCHAR(45) NOT NULL,
  `apellido_usu` VARCHAR(45) NOT NULL,
  `direccion_usu` VARCHAR(45) NULL DEFAULT NULL,
  `email_usu` VARCHAR(45) NOT NULL,
  `pass_usu` VARCHAR(45) NOT NULL,
  `Rol` VARCHAR(15) NOT NULL,
  `Genero` VARCHAR(15) NOT NULL,
  `cod_tdoc` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`id_usuario`, `cod_tdoc`),
  INDEX `fk_usuario_rol_idx` (`Rol` ASC),
  INDEX `fk_usuario_sexo1_idx` (`Genero` ASC),
  INDEX `fk_usuario_tipo_documento1_idx` (`cod_tdoc` ASC),
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`Rol`)
    REFERENCES `CRUD_DB`.`rol` (`Rol`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_sexo1`
    FOREIGN KEY (`Genero`)
    REFERENCES `CRUD_DB`.`genero` (`Genero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_tipo_documento1`
    FOREIGN KEY (`cod_tdoc`)
    REFERENCES `CRUD_DB`.`tipo_documento` (`cod_tdoc`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
