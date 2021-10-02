-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gestiRestDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestiRestDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestiRestDB` DEFAULT CHARACTER SET utf8 ;
USE `gestiRestDB` ;

-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblTipoMovimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblTipoMovimiento` (
  `idTipoMovimiento` INT NOT NULL AUTO_INCREMENT,
  `tipoMovimiento` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idTipoMovimiento`),
  UNIQUE INDEX `idtipoMovimiento_UNIQUE` (`idTipoMovimiento` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblTipoMateriaPrima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblTipoMateriaPrima` (
  `idtipoMateriaPrima` INT NOT NULL AUTO_INCREMENT,
  `tipoMateriaPrima` VARCHAR(50) NOT NULL,
  UNIQUE INDEX `idtipoMateriaPrima_UNIQUE` (`idtipoMateriaPrima` ASC) VISIBLE,
  PRIMARY KEY (`idtipoMateriaPrima`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblTipoUnidadMedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblTipoUnidadMedida` (
  `idUnidadMedida` INT NOT NULL AUTO_INCREMENT,
  `tipoUnidadMedida` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idUnidadMedida`),
  UNIQUE INDEX `idtipoUnidadMedida_UNIQUE` (`idUnidadMedida` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblMateriaPrima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblMateriaPrima` (
  `idMateriaPrima` INT NOT NULL AUTO_INCREMENT,
  `idTipoMateriaPrima` INT NOT NULL,
  `nombreMateriaPrima` VARCHAR(50) NOT NULL,
  `idUnidadMedida` INT NOT NULL,
  PRIMARY KEY (`idMateriaPrima`, `idTipoMateriaPrima`, `idUnidadMedida`),
  UNIQUE INDEX `idmateriaPrima_UNIQUE` (`idMateriaPrima` ASC) VISIBLE,
  UNIQUE INDEX `nombreMateriaPrima_UNIQUE` (`nombreMateriaPrima` ASC) VISIBLE,
  INDEX `fk_tblMateriaPrima_tblTipoUnidadMedida1_idx` (`idUnidadMedida` ASC) VISIBLE,
  INDEX `fk_tblMateriaPrima_tblTipoMateriaPrima1_idx` (`idTipoMateriaPrima` ASC) VISIBLE,
  CONSTRAINT `fk_tblMateriaPrima_tblTipoUnidadMedida1`
    FOREIGN KEY (`idUnidadMedida`)
    REFERENCES `gestiRestDB`.`tblTipoUnidadMedida` (`idUnidadMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblMateriaPrima_tblTipoMateriaPrima1`
    FOREIGN KEY (`idTipoMateriaPrima`)
    REFERENCES `gestiRestDB`.`tblTipoMateriaPrima` (`idtipoMateriaPrima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblTipoProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblTipoProducto` (
  `idTipoProducto` INT NOT NULL AUTO_INCREMENT,
  `tipoProducto` VARCHAR(45) NOT NULL DEFAULT 'noTransformado',
  PRIMARY KEY (`idTipoProducto`),
  UNIQUE INDEX `idtipoProducto_UNIQUE` (`idTipoProducto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblFormulasTransformado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblFormulasTransformado` (
  `idFormulasTransformado` INT NOT NULL AUTO_INCREMENT,
  `idMateriaPrima` INT NOT NULL,
  `idUnidadMedida` INT NOT NULL,
  `idTipoProducto` INT NOT NULL,
  `nombreTransformado` VARCHAR(100) NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`idFormulasTransformado`, `idMateriaPrima`, `idUnidadMedida`, `idTipoProducto`),
  UNIQUE INDEX `idtblFormulasTransformado_UNIQUE` (`idFormulasTransformado` ASC) VISIBLE,
  INDEX `fk_tblFormulasTransformado_tblMateriaPrima1_idx` (`idMateriaPrima` ASC) VISIBLE,
  INDEX `fk_tblFormulasTransformado_tblTipoUnidadMedida1_idx` (`idUnidadMedida` ASC) VISIBLE,
  INDEX `fk_tblFormulasTransformado_tblTipoProducto1_idx` (`idTipoProducto` ASC) VISIBLE,
  CONSTRAINT `fk_tblFormulasTransformado_tblMateriaPrima1`
    FOREIGN KEY (`idMateriaPrima`)
    REFERENCES `gestiRestDB`.`tblMateriaPrima` (`idMateriaPrima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblFormulasTransformado_tblTipoUnidadMedida1`
    FOREIGN KEY (`idUnidadMedida`)
    REFERENCES `gestiRestDB`.`tblTipoUnidadMedida` (`idUnidadMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblFormulasTransformado_tblTipoProducto1`
    FOREIGN KEY (`idTipoProducto`)
    REFERENCES `gestiRestDB`.`tblTipoProducto` (`idTipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblMovimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblMovimiento` (
  `idmovimiento` INT NOT NULL AUTO_INCREMENT,
  `idTipoMovimiento` INT NOT NULL,
  `idTipoProducto` INT NOT NULL,
  `idFormulasTransformado` INT NOT NULL,
  `idMateriaPrima` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `unidadesMovidas` INT NOT NULL DEFAULT 1,
  `idUnidadMedida` INT NOT NULL,
  `cantidad` FLOAT NOT NULL,
  `cierre` BINARY NOT NULL DEFAULT 0,
  PRIMARY KEY (`idmovimiento`, `idTipoMovimiento`, `idTipoProducto`, `idMateriaPrima`, `idFormulasTransformado`, `idUnidadMedida`),
  UNIQUE INDEX `idmovimiento_UNIQUE` (`idmovimiento` ASC) VISIBLE,
  INDEX `fk_tblMovimiento_tblTipoMovimiento1_idx` (`idTipoMovimiento` ASC) VISIBLE,
  INDEX `fk_tblMovimiento_tblTipoProducto1_idx` (`idTipoProducto` ASC) VISIBLE,
  INDEX `fk_tblMovimiento_tblMateriaPrima1_idx` (`idMateriaPrima` ASC) VISIBLE,
  INDEX `fk_tblMovimiento_tblTipoUnidadMedida1_idx` (`idUnidadMedida` ASC) VISIBLE,
  INDEX `fk_tblMovimiento_tblFormulasTransformado1_idx` (`idFormulasTransformado` ASC) VISIBLE,
  CONSTRAINT `fk_tblMovimiento_tblTipoMovimiento1`
    FOREIGN KEY (`idTipoMovimiento`)
    REFERENCES `gestiRestDB`.`tblTipoMovimiento` (`idTipoMovimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblMovimiento_tblTipoProducto1`
    FOREIGN KEY (`idTipoProducto`)
    REFERENCES `gestiRestDB`.`tblTipoProducto` (`idTipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblMovimiento_tblMateriaPrima1`
    FOREIGN KEY (`idMateriaPrima`)
    REFERENCES `gestiRestDB`.`tblMateriaPrima` (`idMateriaPrima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblMovimiento_tblTipoUnidadMedida1`
    FOREIGN KEY (`idUnidadMedida`)
    REFERENCES `gestiRestDB`.`tblTipoUnidadMedida` (`idUnidadMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblMovimiento_tblFormulasTransformado1`
    FOREIGN KEY (`idFormulasTransformado`)
    REFERENCES `gestiRestDB`.`tblFormulasTransformado` (`idFormulasTransformado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblGrupoInventarioSeguridad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblGrupoInventarioSeguridad` (
  `idGrupoInventarioSeguridad` INT NOT NULL AUTO_INCREMENT,
  `grupoInventario` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idGrupoInventarioSeguridad`),
  UNIQUE INDEX `idgrupoInventarioSeguridad_UNIQUE` (`idGrupoInventarioSeguridad` ASC) VISIBLE,
  UNIQUE INDEX `grupoInventario_UNIQUE` (`grupoInventario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblInventarioSeguridad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblInventarioSeguridad` (
  `idInventarioSeguridad` INT NOT NULL AUTO_INCREMENT,
  `idTipoMateriaPrima` INT NOT NULL,
  `idUnidadMedida` INT NOT NULL,
  `idGrupoInventarioSeguridad` INT NOT NULL,
  `cantidadMinima` DOUBLE NOT NULL,
  PRIMARY KEY (`idInventarioSeguridad`, `idTipoMateriaPrima`, `idUnidadMedida`, `idGrupoInventarioSeguridad`),
  UNIQUE INDEX `idinventarioSeguridad_UNIQUE` (`idInventarioSeguridad` ASC) VISIBLE,
  INDEX `fk_tblInventarioSeguridad_tblGrupoInventarioSeguridad1_idx` (`idGrupoInventarioSeguridad` ASC) VISIBLE,
  INDEX `fk_tblInventarioSeguridad_tblTipoMateriaPrima1_idx` (`idTipoMateriaPrima` ASC) VISIBLE,
  INDEX `fk_tblInventarioSeguridad_tblTipoUnidadMedida1_idx` (`idUnidadMedida` ASC) VISIBLE,
  CONSTRAINT `fk_tblInventarioSeguridad_tblGrupoInventarioSeguridad1`
    FOREIGN KEY (`idGrupoInventarioSeguridad`)
    REFERENCES `gestiRestDB`.`tblGrupoInventarioSeguridad` (`idGrupoInventarioSeguridad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblInventarioSeguridad_tblTipoMateriaPrima1`
    FOREIGN KEY (`idTipoMateriaPrima`)
    REFERENCES `gestiRestDB`.`tblTipoMateriaPrima` (`idtipoMateriaPrima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblInventarioSeguridad_tblTipoUnidadMedida1`
    FOREIGN KEY (`idUnidadMedida`)
    REFERENCES `gestiRestDB`.`tblTipoUnidadMedida` (`idUnidadMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestiRestDB`.`tblSaldoFinalDia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestiRestDB`.`tblSaldoFinalDia` (
  `idsaldoFinalDia` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `idTipoProducto` INT NOT NULL,
  `idUnidadMedida` INT NOT NULL,
  `idnventarioSeguridad` INT NOT NULL,
  `diaSemana` INT NOT NULL,
  `cantidad` DOUBLE NOT NULL,
  PRIMARY KEY (`idsaldoFinalDia`, `idUnidadMedida`, `idTipoProducto`, `idnventarioSeguridad`),
  UNIQUE INDEX `idsaldoFinalDia_UNIQUE` (`idsaldoFinalDia` ASC) VISIBLE,
  INDEX `fk_tblSaldoFinalDia_tblTipoUnidadMedida_idx` (`idUnidadMedida` ASC) VISIBLE,
  INDEX `fk_tblSaldoFinalDia_tblTipoProducto1_idx` (`idTipoProducto` ASC) VISIBLE,
  INDEX `fk_tblSaldoFinalDia_tblInventarioSeguridad1_idx` (`idnventarioSeguridad` ASC) VISIBLE,
  CONSTRAINT `fk_tblSaldoFinalDia_tblTipoUnidadMedida`
    FOREIGN KEY (`idUnidadMedida`)
    REFERENCES `gestiRestDB`.`tblTipoUnidadMedida` (`idUnidadMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblSaldoFinalDia_tblTipoProducto1`
    FOREIGN KEY (`idTipoProducto`)
    REFERENCES `gestiRestDB`.`tblTipoProducto` (`idTipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblSaldoFinalDia_tblInventarioSeguridad1`
    FOREIGN KEY (`idnventarioSeguridad`)
    REFERENCES `gestiRestDB`.`tblInventarioSeguridad` (`idInventarioSeguridad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
