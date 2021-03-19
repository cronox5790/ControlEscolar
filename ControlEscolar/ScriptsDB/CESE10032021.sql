-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SIE
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SIE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SIE` DEFAULT CHARACTER SET utf8 ;
USE `SIE` ;

-- -----------------------------------------------------
-- Table `SIE`.`Becas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Becas` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NOT NULL,
  `Descripcion` TINYTEXT NULL,
  `Nombre corto` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Estados` (
  `idEstados` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Municipio` (
  `idMunicipio` INT NOT NULL AUTO_INCREMENT,
  `Municipio` TINYINT(4) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Estados_idEstados` INT NOT NULL,
  PRIMARY KEY (`idMunicipio`, `Estados_idEstados`),
  INDEX `fk_Municipio_Estados_idx` (`Estados_idEstados` ASC),
  CONSTRAINT `fk_Municipio_Estados`
    FOREIGN KEY (`Estados_idEstados`)
    REFERENCES `SIE`.`Estados` (`idEstados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Procedencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Procedencia` (
  `idProcedencia` INT NOT NULL AUTO_INCREMENT,
  `Bachillerato` INT NULL,
  `Año_Egreso` YEAR NULL,
  `Area_Egreso` INT NULL,
  `Promedio_Bachillerato` FLOAT NULL,
  `EXANI` INT NULL,
  `EGEL` INT NULL,
  `TOEFL` INT NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `Municipio_Estados_idEstados` INT NOT NULL,
  PRIMARY KEY (`idProcedencia`, `Municipio_idMunicipio`, `Municipio_Estados_idEstados`),
  INDEX `fk_Procedencia_Municipio1_idx` (`Municipio_idMunicipio` ASC, `Municipio_Estados_idEstados` ASC),
  CONSTRAINT `fk_Procedencia_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio` , `Municipio_Estados_idEstados`)
    REFERENCES `SIE`.`Municipio` (`idMunicipio` , `Estados_idEstados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Domicilio` (
  `idDomicilio` INT NOT NULL AUTO_INCREMENT,
  `Calle` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `Colonia` VARCHAR(45) NOT NULL,
  `Codigo_Postal` INT NOT NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `Municipio_Estados_idEstados` INT NOT NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Telefono` VARCHAR(10) NULL,
  `Celular` VARCHAR(10) NULL,
  `Correo_electronico` VARCHAR(45) NULL,
  `Facebook` TEXT NULL,
  `Twitter` TEXT NULL,
  PRIMARY KEY (`idDomicilio`),
  INDEX `fk_Domicilio_Municipio1_idx` (`Municipio_idMunicipio` ASC, `Municipio_Estados_idEstados` ASC),
  CONSTRAINT `fk_Domicilio_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio` , `Municipio_Estados_idEstados`)
    REFERENCES `SIE`.`Municipio` (`idMunicipio` , `Estados_idEstados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`ServicioMedico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`ServicioMedico` (
  `idServicioMedico` INT NOT NULL AUTO_INCREMENT,
  `Tipo` INT NOT NULL COMMENT '1 IMSS\n2 ISSTE\n',
  `Institucion` VARCHAR(20) NULL,
  `Afiliacion` VARCHAR(20) NOT NULL,
  `Tipo_Sangre` VARCHAR(3) NULL,
  `Afiliacion_SS` VARCHAR(20) NULL,
  PRIMARY KEY (`idServicioMedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`LenguaIndigena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`LenguaIndigena` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NOT NULL,
  `Descripcion` TINYTEXT NULL,
  `Nombre corto` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Alumno` (
  `idAlumno` INT NOT NULL AUTO_INCREMENT,
  `NumControl` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Apellido_Paterno` VARCHAR(30) NOT NULL,
  `Apellido_Materno` VARCHAR(30) NOT NULL,
  `Fecha_Nacimiento` DATE NOT NULL,
  `CURP` VARCHAR(16) NOT NULL,
  `RFC` VARCHAR(13) NOT NULL,
  `Sexo` INT NOT NULL COMMENT '1 Masculino\n2 Femenino',
  `Procedencia_idProcedencia` INT NOT NULL,
  `Procedencia_Municipio_idMunicipio` INT NOT NULL,
  `Procedencia_Municipio_Estados_idEstados` INT NOT NULL,
  `Domicilio_idDomicilio` INT NULL,
  `ServicioMedico_idServicioMedico` INT NULL,
  `LenguaIndigena_Id` INT NULL,
  `Becas_Id` INT NULL,
  `Clave_Acceso_Internet` INT NULL,
  `Foto` INT NULL,
  PRIMARY KEY (`idAlumno`),
  UNIQUE INDEX `NumControl_UNIQUE` (`NumControl` ASC),
  INDEX `fk_Alumno_Procedencia1_idx` (`Procedencia_idProcedencia` ASC, `Procedencia_Municipio_idMunicipio` ASC, `Procedencia_Municipio_Estados_idEstados` ASC),
  INDEX `fk_Alumno_Domicilio1_idx` (`Domicilio_idDomicilio` ASC),
  INDEX `fk_Alumno_ServicioMedico1_idx` (`ServicioMedico_idServicioMedico` ASC),
  INDEX `fk_Alumno_LenguaIndigena1_idx` (`LenguaIndigena_Id` ASC),
  INDEX `fk_Alumno_Becas1_idx` (`Becas_Id` ASC),
  CONSTRAINT `fk_Alumno_Procedencia1`
    FOREIGN KEY (`Procedencia_idProcedencia` , `Procedencia_Municipio_idMunicipio` , `Procedencia_Municipio_Estados_idEstados`)
    REFERENCES `SIE`.`Procedencia` (`idProcedencia` , `Municipio_idMunicipio` , `Municipio_Estados_idEstados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Domicilio1`
    FOREIGN KEY (`Domicilio_idDomicilio`)
    REFERENCES `SIE`.`Domicilio` (`idDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_ServicioMedico1`
    FOREIGN KEY (`ServicioMedico_idServicioMedico`)
    REFERENCES `SIE`.`ServicioMedico` (`idServicioMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_LenguaIndigena1`
    FOREIGN KEY (`LenguaIndigena_Id`)
    REFERENCES `SIE`.`LenguaIndigena` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Becas1`
    FOREIGN KEY (`Becas_Id`)
    REFERENCES `SIE`.`Becas` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`GrupoIndigena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`GrupoIndigena` (
  `idBecas` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NOT NULL,
  `Descripcion` TINYTEXT NULL,
  `Nombre corto` VARCHAR(45) NULL,
  `Alumno_idAlumno` INT NOT NULL,
  `Alumno_Procedencia_idProcedencia` INT NOT NULL,
  `Alumno_Procedencia_Municipio_idMunicipio` INT NOT NULL,
  `Alumno_Procedencia_Municipio_Estados_idEstados` INT NOT NULL,
  `Alumno_Domicilio_idDomicilio` INT NOT NULL,
  `Alumno_ServicioMedico_idServicioMedico` INT NOT NULL,
  PRIMARY KEY (`idBecas`, `Alumno_idAlumno`, `Alumno_Procedencia_idProcedencia`, `Alumno_Procedencia_Municipio_idMunicipio`, `Alumno_Procedencia_Municipio_Estados_idEstados`, `Alumno_Domicilio_idDomicilio`, `Alumno_ServicioMedico_idServicioMedico`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC),
  INDEX `fk_GrupoIndigena_Alumno1_idx` (`Alumno_idAlumno` ASC, `Alumno_Procedencia_idProcedencia` ASC, `Alumno_Procedencia_Municipio_idMunicipio` ASC, `Alumno_Procedencia_Municipio_Estados_idEstados` ASC, `Alumno_Domicilio_idDomicilio` ASC, `Alumno_ServicioMedico_idServicioMedico` ASC),
  CONSTRAINT `fk_GrupoIndigena_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno` , `Alumno_Procedencia_idProcedencia` , `Alumno_Procedencia_Municipio_idMunicipio` , `Alumno_Procedencia_Municipio_Estados_idEstados` , `Alumno_Domicilio_idDomicilio` , `Alumno_ServicioMedico_idServicioMedico`)
    REFERENCES `SIE`.`Alumno` (`idAlumno` , `Procedencia_idProcedencia` , `Procedencia_Municipio_idMunicipio` , `Procedencia_Municipio_Estados_idEstados` , `Domicilio_idDomicilio` , `ServicioMedico_idServicioMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Discapacidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Discapacidad` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NOT NULL,
  `Descripcion` TINYTEXT NULL,
  `Nombre corto` VARCHAR(45) NULL,
  `Alumno_idAlumno` INT NULL,
  `Alumno_Procedencia_idProcedencia` INT NULL,
  `Alumno_Procedencia_Municipio_idMunicipio` INT NULL,
  `Alumno_Procedencia_Municipio_Estados_idEstados` INT NULL,
  `Alumno_Domicilio_idDomicilio` INT NULL,
  `Alumno_ServicioMedico_idServicioMedico` INT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC),
  INDEX `fk_Discapacidad_Alumno1_idx` (`Alumno_idAlumno` ASC, `Alumno_Procedencia_idProcedencia` ASC, `Alumno_Procedencia_Municipio_idMunicipio` ASC, `Alumno_Procedencia_Municipio_Estados_idEstados` ASC, `Alumno_Domicilio_idDomicilio` ASC, `Alumno_ServicioMedico_idServicioMedico` ASC),
  CONSTRAINT `fk_Discapacidad_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno` , `Alumno_Procedencia_idProcedencia` , `Alumno_Procedencia_Municipio_idMunicipio` , `Alumno_Procedencia_Municipio_Estados_idEstados` , `Alumno_Domicilio_idDomicilio` , `Alumno_ServicioMedico_idServicioMedico`)
    REFERENCES `SIE`.`Alumno` (`idAlumno` , `Procedencia_idProcedencia` , `Procedencia_Municipio_idMunicipio` , `Procedencia_Municipio_Estados_idEstados` , `Domicilio_idDomicilio` , `ServicioMedico_idServicioMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`MotivosBajas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`MotivosBajas` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NOT NULL,
  `Descripcion` TINYTEXT NULL,
  `Nombre corto` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`AsuntosComiteAcadenico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`AsuntosComiteAcadenico` (
  `idAsuntosComiteAcadenico` INT NOT NULL AUTO_INCREMENT,
  `Clave` TINYINT(5) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` TINYTEXT NOT NULL,
  `Mision` MEDIUMTEXT NULL,
  `Datos generales` BIT(1) NULL DEFAULT 0,
  `DatosResidencia` BIT(1) NULL DEFAULT 0,
  `DatosTitulacion` BIT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idAsuntosComiteAcadenico`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`DatosFamiliaresAlumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`DatosFamiliaresAlumno` (
  `idDatosFamiliaresAlumno` INT NOT NULL AUTO_INCREMENT,
  `Estado_Civil` INT NOT NULL,
  `Nombre_Padre` VARCHAR(60) NOT NULL,
  `Nombre_Madre` VARCHAR(60) NOT NULL,
  `Vive_Padre` BIT NOT NULL,
  `Vive_Madre` BIT NOT NULL,
  `Telefono_Padre` VARCHAR(10) NULL,
  `Telefono_Madre` VARCHAR(10) NULL,
  `Alumno_idAlumno` INT NOT NULL,
  PRIMARY KEY (`idDatosFamiliaresAlumno`),
  UNIQUE INDEX `idDatosFamiliaresAlumno_UNIQUE` (`idDatosFamiliaresAlumno` ASC),
  INDEX `fk_DatosFamiliaresAlumno_Alumno1_idx` (`Alumno_idAlumno` ASC),
  CONSTRAINT `fk_DatosFamiliaresAlumno_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `SIE`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`ExperienciaLaboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`ExperienciaLaboral` (
  `idExperienciaLaboral` INT NOT NULL AUTO_INCREMENT,
  `Empresa` INT NOT NULL,
  `Area` INT NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Finalizacion` DATE NULL,
  `Alumno_idAlumno` INT NOT NULL,
  PRIMARY KEY (`idExperienciaLaboral`),
  INDEX `fk_ExperienciaLaboral_Alumno1_idx` (`Alumno_idAlumno` ASC),
  CONSTRAINT `fk_ExperienciaLaboral_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `SIE`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`ServicioSocial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`ServicioSocial` (
  `idServicioSocial` INT NOT NULL AUTO_INCREMENT,
  `Empresa` INT NOT NULL,
  `Area` INT NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Finalizacion` DATE NULL,
  `Alumno_idAlumno` INT NOT NULL,
  PRIMARY KEY (`idServicioSocial`),
  INDEX `fk_ServicioSocial_Alumno1_idx` (`Alumno_idAlumno` ASC),
  CONSTRAINT `fk_ServicioSocial_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `SIE`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Tutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Tutor` (
  `idTutor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(60) NOT NULL,
  `Calle` VARCHAR(25) NOT NULL,
  `Numero` VARCHAR(45) NOT NULL,
  `Colonia` VARCHAR(45) NOT NULL,
  `Codigo_Postal` VARCHAR(45) NOT NULL,
  `Localidad` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(10) NULL,
  `Celular` VARCHAR(10) NOT NULL,
  `CorreroElectronico` VARCHAR(60) NULL,
  `Centro_Trabajo` INT NOT NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `Municipio_Estados_idEstados` INT NOT NULL,
  `Alumno_idAlumno` INT NOT NULL,
  PRIMARY KEY (`idTutor`),
  INDEX `fk_Tutor_Municipio1_idx` (`Municipio_idMunicipio` ASC, `Municipio_Estados_idEstados` ASC),
  INDEX `fk_Tutor_Alumno1_idx` (`Alumno_idAlumno` ASC),
  CONSTRAINT `fk_Tutor_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio` , `Municipio_Estados_idEstados`)
    REFERENCES `SIE`.`Municipio` (`idMunicipio` , `Estados_idEstados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutor_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `SIE`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Titulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Titulos` (
  `idTitulos` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NULL,
  `Nombre` VARCHAR(60) NULL,
  `NombreCorto` VARCHAR(20) NULL,
  `Siglas` VARCHAR(5) NULL,
  `Nivel` INT NULL COMMENT 'opciones:\n1. Tecnico superior\n2. Superior\n3. Maestria\n4. Doctorado',
  PRIMARY KEY (`idTitulos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Curriculum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Curriculum` (
  `idCurriculum` INT NOT NULL,
  `ExperienciaLaboral` TEXT NULL,
  `Constancias_reconocimientos` TEXT NULL,
  `Cursos_Talleres` TEXT NULL,
  PRIMARY KEY (`idCurriculum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`EstudiosPersonal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`EstudiosPersonal` (
  `idEstudiosRealizados` INT NOT NULL,
  `Inicio` DATE NULL,
  `Termino` DATE NULL,
  `Cedula` VARCHAR(45) NULL,
  `Utl` BIT(1) NULL,
  `Titulos_idTitulos` INT NOT NULL,
  `Curriculum_idCurriculum` INT NOT NULL,
  PRIMARY KEY (`idEstudiosRealizados`),
  INDEX `fk_EstudiosPersonal_Titulos1_idx` (`Titulos_idTitulos` ASC),
  INDEX `fk_EstudiosPersonal_Curriculum1_idx` (`Curriculum_idCurriculum` ASC),
  CONSTRAINT `fk_EstudiosPersonal_Titulos1`
    FOREIGN KEY (`Titulos_idTitulos`)
    REFERENCES `SIE`.`Titulos` (`idTitulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstudiosPersonal_Curriculum1`
    FOREIGN KEY (`Curriculum_idCurriculum`)
    REFERENCES `SIE`.`Curriculum` (`idCurriculum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Escuela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Escuela` (
  `idEscuela` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Centro_Trabajo` VARCHAR(10) NOT NULL,
  `Calle` VARCHAR(30) NULL,
  `Numero` VARCHAR(10) NULL,
  `Colonia` VARCHAR(20) NULL,
  `Codigo_postal` VARCHAR(5) NULL,
  `Ciudad` VARCHAR(20) NULL,
  `Telefono` VARCHAR(10) NULL,
  `Clave_Municipio` VARCHAR(5) NULL,
  `Clave_COSNET` VARCHAR(2) NOT NULL,
  `Alumno_idAlumno` INT NOT NULL,
  `EstudiosPersonal_idEstudiosRealizados` INT NOT NULL,
  PRIMARY KEY (`idEscuela`),
  INDEX `fk_Escuela_Alumno1_idx` (`Alumno_idAlumno` ASC),
  INDEX `fk_Escuela_EstudiosPersonal1_idx` (`EstudiosPersonal_idEstudiosRealizados` ASC),
  CONSTRAINT `fk_Escuela_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `SIE`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela_EstudiosPersonal1`
    FOREIGN KEY (`EstudiosPersonal_idEstudiosRealizados`)
    REFERENCES `SIE`.`EstudiosPersonal` (`idEstudiosRealizados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Empresa` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(60) NULL,
  `Nombre_corto` VARCHAR(20) NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`AreaEmpresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`AreaEmpresa` (
  `idAreaEmpresa` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(60) NOT NULL,
  `Nombre_Corto` VARCHAR(20) NOT NULL,
  `Representante` VARCHAR(50) NOT NULL,
  `Puesto` VARCHAR(50) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  `TelefonoExtra` VARCHAR(10) NOT NULL,
  `Calle` VARCHAR(45) NOT NULL,
  `Numero` VARCHAR(5) NOT NULL,
  `Colonia` VARCHAR(30) NOT NULL,
  `Ciudad` VARCHAR(30) NOT NULL,
  `Municipio` VARCHAR(5) NOT NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idAreaEmpresa`, `Empresa_idEmpresa`),
  INDEX `fk_AreaEmpresa_Empresa1_idx` (`Empresa_idEmpresa` ASC),
  CONSTRAINT `fk_AreaEmpresa_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `SIE`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Carreras` (
  `idCarreras` INT NOT NULL AUTO_INCREMENT,
  `Clave` TINYINT(2) NOT NULL,
  `Nombre` VARCHAR(80) NOT NULL,
  `NombreCorto` VARCHAR(20) NOT NULL,
  `Nivel` INT NOT NULL COMMENT '1. Licenciatura\n2. Maestria',
  `Inicio` DATE NOT NULL,
  `Terminacion` DATE NULL,
  `Situacion` INT NULL COMMENT '1. Vigente',
  `Modalidad` INT NULL,
  `PeriodoModulo` TINYINT(2) NULL,
  `HorasCruceAutorizadas` TINYINT(2) NULL,
  PRIMARY KEY (`idCarreras`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`PlanEstudios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`PlanEstudios` (
  `idPlanEstudios` INT NOT NULL AUTO_INCREMENT,
  `Carreras_idCarreras` INT NOT NULL,
  `Clave` CHAR(1) NULL,
  `ClaveOficial` VARCHAR(20) NULL,
  `CreditosTotales` TINYINT(3) NULL,
  `CreditosPlanRetitular` TINYINT(2) NULL,
  `CreditosEspecialidad` TINYINT(2) NULL,
  `PeriodoDuracion` TINYINT(2) NULL,
  `PeriodosMaximos` TINYINT(2) NULL,
  `Inicio` DATE NOT NULL,
  `Terminacion` DATE NULL,
  `Con1Reprobada` TINYINT(2) NULL,
  `Mas1Reprobada` TINYINT NULL,
  `CargaMaxima` TINYINT(2) NULL,
  `CargaMinima` TINYINT(2) NULL,
  `OrdenCertificado` TINYINT(2) NULL,
  `Porcentaje` TINYINT(2) NULL,
  `Periodo` VARCHAR(5) NULL,
  `Ubicacion` TINYINT(2) NULL,
  `PreRequisitos` VARCHAR(10) NULL,
  `CoReq` VARCHAR(10) NULL,
  `Imagen` VARCHAR(5) NULL,
  PRIMARY KEY (`idPlanEstudios`),
  INDEX `fk_PlanEstudios_Carreras1_idx` (`Carreras_idCarreras` ASC),
  CONSTRAINT `fk_PlanEstudios_Carreras1`
    FOREIGN KEY (`Carreras_idCarreras`)
    REFERENCES `SIE`.`Carreras` (`idCarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`ModuloEspecialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`ModuloEspecialidad` (
  `idModulo` INT NOT NULL AUTO_INCREMENT,
  `Carreras_idCarreras` INT NOT NULL,
  `Clave` CHAR(1) NULL,
  `ClaveOficial` VARCHAR(20) NULL,
  `Creditos` TINYINT(3) NULL,
  `Inicio` DATE NOT NULL,
  `Terminacion` DATE NULL,
  `OrdenCertificado` TINYINT(2) NULL,
  `Porcentaje` TINYINT(2) NULL,
  `Periodo` VARCHAR(5) NULL,
  `Ubicacion` TINYINT(2) NULL,
  `PreRequisitos` VARCHAR(10) NULL,
  `CoReq` VARCHAR(10) NULL,
  `Imagen` VARCHAR(5) NULL,
  `PlanEstudios_idPlanEstudios` INT NOT NULL,
  `Nombre` VARCHAR(60) NULL,
  `NombreCorto` VARCHAR(20) NULL,
  `SituacionActual` INT NULL,
  PRIMARY KEY (`idModulo`),
  INDEX `fk_PlanEstudios_Carreras1_idx` (`Carreras_idCarreras` ASC),
  INDEX `fk_ModuloEspecialidad_PlanEstudios1_idx` (`PlanEstudios_idPlanEstudios` ASC),
  CONSTRAINT `fk_PlanEstudios_Carreras10`
    FOREIGN KEY (`Carreras_idCarreras`)
    REFERENCES `SIE`.`Carreras` (`idCarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModuloEspecialidad_PlanEstudios1`
    FOREIGN KEY (`PlanEstudios_idPlanEstudios`)
    REFERENCES `SIE`.`PlanEstudios` (`idPlanEstudios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Kardex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Kardex` (
  `idKardex` INT NOT NULL AUTO_INCREMENT,
  `Materia` VARCHAR(5) NULL,
  `Calificacion` VARCHAR(45) NULL,
  `Tipo` INT NULL,
  `PlanEstudios_idPlanEstudios` INT NOT NULL,
  `ModuloEspecialidad_idModulo` INT NOT NULL,
  `Fecha` DATE NULL,
  `CalificacionAC` TINYINT NULL,
  `Alumno_idAlumno` INT NOT NULL,
  PRIMARY KEY (`idKardex`),
  INDEX `fk_Kardex_PlanEstudios1_idx` (`PlanEstudios_idPlanEstudios` ASC),
  INDEX `fk_Kardex_ModuloEspecialidad1_idx` (`ModuloEspecialidad_idModulo` ASC),
  INDEX `fk_Kardex_Alumno1_idx` (`Alumno_idAlumno` ASC),
  CONSTRAINT `fk_Kardex_PlanEstudios1`
    FOREIGN KEY (`PlanEstudios_idPlanEstudios`)
    REFERENCES `SIE`.`PlanEstudios` (`idPlanEstudios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kardex_ModuloEspecialidad1`
    FOREIGN KEY (`ModuloEspecialidad_idModulo`)
    REFERENCES `SIE`.`ModuloEspecialidad` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kardex_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `SIE`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Estudios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Estudios` (
  `idEstudios` INT NOT NULL AUTO_INCREMENT,
  `Estudio_Proridad` BIT(1) NULL,
  `Situacion` INT NULL,
  `Carreras_idCarreras` INT NOT NULL,
  `Kardex_idKardex` INT NOT NULL,
  `PlanEstudios_idPlanEstudios` INT NOT NULL,
  `ModuloEspecialidad_idModulo` INT NOT NULL,
  `PeriodoTermino` TINYINT(3) NULL,
  `Perc` TINYINT(1) NULL,
  `Grupo` CHAR NULL,
  `ObservacionesCertificado` TEXT NULL,
  `Estudioscol` VARCHAR(45) NULL,
  `CreditosAcumulados` TINYINT NULL,
  `TotalCalificacionesAprobadas` TINYINT NULL,
  `TotalCalificacionesReprobadas` TINYINT NULL,
  `MateriasCursadas` TINYINT NULL,
  `MateriasAprobadas` TINYINT NULL,
  `MateriasAcreditadas` TINYINT NULL,
  PRIMARY KEY (`idEstudios`),
  INDEX `fk_Estudios_Carreras1_idx` (`Carreras_idCarreras` ASC),
  INDEX `fk_Estudios_Kardex1_idx` (`Kardex_idKardex` ASC),
  INDEX `fk_Estudios_PlanEstudios1_idx` (`PlanEstudios_idPlanEstudios` ASC),
  INDEX `fk_Estudios_ModuloEspecialidad1_idx` (`ModuloEspecialidad_idModulo` ASC),
  CONSTRAINT `fk_Estudios_Carreras1`
    FOREIGN KEY (`Carreras_idCarreras`)
    REFERENCES `SIE`.`Carreras` (`idCarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudios_Kardex1`
    FOREIGN KEY (`Kardex_idKardex`)
    REFERENCES `SIE`.`Kardex` (`idKardex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudios_PlanEstudios1`
    FOREIGN KEY (`PlanEstudios_idPlanEstudios`)
    REFERENCES `SIE`.`PlanEstudios` (`idPlanEstudios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudios_ModuloEspecialidad1`
    FOREIGN KEY (`ModuloEspecialidad_idModulo`)
    REFERENCES `SIE`.`ModuloEspecialidad` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Departamentos` (
  `idEstructuraOganica` INT NOT NULL AUTO_INCREMENT,
  `Nivel` INT NOT NULL,
  `Clave` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `NombreCorto` VARCHAR(20) NULL,
  `Superior` INT NOT NULL,
  `Carreras_idCarreras` INT NULL,
  PRIMARY KEY (`idEstructuraOganica`),
  INDEX `fk_Departamentos_Carreras1_idx` (`Carreras_idCarreras` ASC),
  CONSTRAINT `fk_Departamentos_Carreras1`
    FOREIGN KEY (`Carreras_idCarreras`)
    REFERENCES `SIE`.`Carreras` (`idCarreras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Puestos` (
  `idPuestos` INT NOT NULL AUTO_INCREMENT,
  `Puesto` INT NULL,
  `Nombre` VARCHAR(45) NULL,
  `NombreCorto` VARCHAR(20) NULL,
  `Nivel_Tipo` INT NULL COMMENT '1 Jefe departamento',
  `Antiguedad` DATE NULL,
  `Departamentos_idEstructuraOganica` INT NOT NULL,
  PRIMARY KEY (`idPuestos`, `Departamentos_idEstructuraOganica`),
  INDEX `fk_Puestos_Departamentos1_idx` (`Departamentos_idEstructuraOganica` ASC),
  CONSTRAINT `fk_Puestos_Departamentos1`
    FOREIGN KEY (`Departamentos_idEstructuraOganica`)
    REFERENCES `SIE`.`Departamentos` (`idEstructuraOganica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`PadronInvestigadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`PadronInvestigadores` (
  `idPadronInvestigadores` INT NOT NULL AUTO_INCREMENT,
  `Opcion` INT NULL,
  `Oficio` VARCHAR(15) NULL,
  `Desde` DATE NULL,
  `Hasta` DATE NULL,
  PRIMARY KEY (`idPadronInvestigadores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Personal-Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Personal-Material` (
  `idPersonal-Material` INT NOT NULL AUTO_INCREMENT,
  `Total_Aprobados` TINYINT NULL,
  `Total_Reprobados` TINYINT NULL,
  `Activo` BIT(1) NOT NULL,
  PRIMARY KEY (`idPersonal-Material`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`DatosLaborales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`DatosLaborales` (
  `idDatosLaborales` INT NOT NULL AUTO_INCREMENT,
  `GobiernoFederal` DATE NOT NULL,
  `SEP` DATE NULL,
  `RAMA` DATE NULL,
  `Situacion` INT NULL,
  `IncidenciaLaboral` INT NULL,
  `Plantel` VARCHAR(60) NULL,
  `Comision` INT NULL,
  `Oficio` VARCHAR(15) NULL,
  `Desde` DATE NULL,
  `Hasta` DATE NULL,
  `Funcion` INT NULL,
  `Proyecto` INT NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  `Horas` INT NULL,
  PRIMARY KEY (`idDatosLaborales`),
  INDEX `fk_DatosLaborales_Empresa1_idx` (`Empresa_idEmpresa` ASC),
  CONSTRAINT `fk_DatosLaborales_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `SIE`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Personal` (
  `idPersonal` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Apellidos` VARCHAR(30) NOT NULL,
  `Siglas` VARCHAR(5) NULL,
  `Tarjeta` INT NULL,
  `RFC` VARCHAR(13) NULL,
  `CURP` VARCHAR(18) NULL,
  `Sexo` INT NULL COMMENT '1. Masculino\n2. Femenino',
  `Foto` INT NULL,
  `EstadoCIvil` INT NULL COMMENT '1. Soltero\n2. Casado\n3. Divorciado\n4. Viudo',
  `C.Militar` VARCHAR(10) NULL,
  `DependientesEconomicos` TINYINT(2) NULL,
  `DispViajar` BIT(1) NULL,
  `ClaveInternet` INT NULL,
  `Municipio_idMunicipio` INT NOT NULL,
  `Municipio_Estados_idEstados` INT NOT NULL,
  `Domicilio_idDomicilio` INT NOT NULL,
  `ContactoEmergencias` VARCHAR(60) NOT NULL,
  `TelefonoEmergencias` VARCHAR(10) NOT NULL,
  `PadronInvestigadores_idPadronInvestigadores` INT NOT NULL,
  `Personal-Material_idPersonal-Material` INT NOT NULL,
  `Categorias_idCategorias` INT NOT NULL,
  `Puestos_idPuestos` INT NOT NULL,
  `Puestos_Departamentos_idEstructuraOganica` INT NOT NULL,
  `DatosLaborales_idDatosLaborales` INT NOT NULL,
  `Curriculum_idCurriculum` INT NOT NULL,
  `HorarioLaboral` VARCHAR(100) NULL,
  PRIMARY KEY (`idPersonal`),
  UNIQUE INDEX `Clave_UNIQUE` (`Clave` ASC),
  INDEX `fk_Personal_Municipio1_idx` (`Municipio_idMunicipio` ASC, `Municipio_Estados_idEstados` ASC),
  INDEX `fk_Personal_Domicilio1_idx` (`Domicilio_idDomicilio` ASC),
  INDEX `fk_Personal_PadronInvestigadores1_idx` (`PadronInvestigadores_idPadronInvestigadores` ASC),
  INDEX `fk_Personal_Personal-Material1_idx` (`Personal-Material_idPersonal-Material` ASC),
  INDEX `fk_Personal_Categorias1_idx` (`Categorias_idCategorias` ASC),
  INDEX `fk_Personal_Puestos1_idx` (`Puestos_idPuestos` ASC, `Puestos_Departamentos_idEstructuraOganica` ASC),
  INDEX `fk_Personal_DatosLaborales1_idx` (`DatosLaborales_idDatosLaborales` ASC),
  INDEX `fk_Personal_Curriculum1_idx` (`Curriculum_idCurriculum` ASC),
  CONSTRAINT `fk_Personal_Municipio1`
    FOREIGN KEY (`Municipio_idMunicipio` , `Municipio_Estados_idEstados`)
    REFERENCES `SIE`.`Municipio` (`idMunicipio` , `Estados_idEstados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_Domicilio1`
    FOREIGN KEY (`Domicilio_idDomicilio`)
    REFERENCES `SIE`.`Domicilio` (`idDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_PadronInvestigadores1`
    FOREIGN KEY (`PadronInvestigadores_idPadronInvestigadores`)
    REFERENCES `SIE`.`PadronInvestigadores` (`idPadronInvestigadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_Personal-Material1`
    FOREIGN KEY (`Personal-Material_idPersonal-Material`)
    REFERENCES `SIE`.`Personal-Material` (`idPersonal-Material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_Categorias1`
    FOREIGN KEY (`Categorias_idCategorias`)
    REFERENCES `SIE`.`Categorias` (`idCategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_Puestos1`
    FOREIGN KEY (`Puestos_idPuestos` , `Puestos_Departamentos_idEstructuraOganica`)
    REFERENCES `SIE`.`Puestos` (`idPuestos` , `Departamentos_idEstructuraOganica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_DatosLaborales1`
    FOREIGN KEY (`DatosLaborales_idDatosLaborales`)
    REFERENCES `SIE`.`DatosLaborales` (`idDatosLaborales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal_Curriculum1`
    FOREIGN KEY (`Curriculum_idCurriculum`)
    REFERENCES `SIE`.`Curriculum` (`idCurriculum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`PlazasAsignadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`PlazasAsignadas` (
  `idPlazasAsignadas` INT NOT NULL AUTO_INCREMENT,
  `EfecDe` DATE NULL,
  `EfecA` DATE NULL,
  `Movimiento` VARCHAR(20) NULL,
  `Personal_idPersonal` INT NOT NULL,
  `Horas` INT NULL,
  `DOCTO` VARCHAR(10) NULL,
  PRIMARY KEY (`idPlazasAsignadas`),
  INDEX `fk_PlazasAsignadas_Personal1_idx` (`Personal_idPersonal` ASC),
  CONSTRAINT `fk_PlazasAsignadas_Personal1`
    FOREIGN KEY (`Personal_idPersonal`)
    REFERENCES `SIE`.`Personal` (`idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Categorias` (
  `idCategorias` INT NOT NULL AUTO_INCREMENT,
  `Clave` VARCHAR(6) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `NombreCorto` VARCHAR(45) NULL,
  `Horas` TINYINT(2) NULL,
  `Descarga` TINYINT(2) NULL,
  `PlazasAsignadas_idPlazasAsignadas` INT NOT NULL,
  PRIMARY KEY (`idCategorias`),
  INDEX `fk_Categorias_PlazasAsignadas1_idx` (`PlazasAsignadas_idPlazasAsignadas` ASC),
  CONSTRAINT `fk_Categorias_PlazasAsignadas1`
    FOREIGN KEY (`PlazasAsignadas_idPlazasAsignadas`)
    REFERENCES `SIE`.`PlazasAsignadas` (`idPlazasAsignadas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Plazas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Plazas` (
  `idPlazas` INT NOT NULL AUTO_INCREMENT,
  `Categorias_idCategorias` INT NOT NULL,
  `Plaza` VARCHAR(8) NOT NULL,
  `Horas` TINYINT(2) NOT NULL,
  `Unidad` INT NULL,
  `EfectosDesde` DATE NULL,
  `Hasta` DATE NULL,
  `PlazasAsignadas_idPlazasAsignadas` INT NOT NULL,
  PRIMARY KEY (`idPlazas`),
  INDEX `fk_Plazas_Categorias1_idx` (`Categorias_idCategorias` ASC),
  INDEX `fk_Plazas_PlazasAsignadas1_idx` (`PlazasAsignadas_idPlazasAsignadas` ASC),
  CONSTRAINT `fk_Plazas_Categorias1`
    FOREIGN KEY (`Categorias_idCategorias`)
    REFERENCES `SIE`.`Categorias` (`idCategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plazas_PlazasAsignadas1`
    FOREIGN KEY (`PlazasAsignadas_idPlazasAsignadas`)
    REFERENCES `SIE`.`PlazasAsignadas` (`idPlazasAsignadas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Materia` (
  `idMateria` INT NOT NULL AUTO_INCREMENT,
  `Clave` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `NombreCorto` VARCHAR(45) NOT NULL,
  `Departamentos_idEstructuraOganica` INT NOT NULL,
  `Creditos` TINYINT(2) NOT NULL,
  `HorasTotales` TINYINT(2) NULL,
  `HorasTeoricas` TINYINT(2) NULL,
  `HorasPracticas` TINYINT(2) NULL,
  `PlanEstudios` LONGTEXT NOT NULL,
  `PlanEstudios_idPlanEstudios` INT NOT NULL,
  `ModuloEspecialidad_idModulo` INT NOT NULL,
  `Personal-Material_idPersonal-Material` INT NOT NULL,
  PRIMARY KEY (`idMateria`),
  INDEX `fk_Materia_Departamentos1_idx` (`Departamentos_idEstructuraOganica` ASC),
  INDEX `fk_Materia_PlanEstudios1_idx` (`PlanEstudios_idPlanEstudios` ASC),
  INDEX `fk_Materia_ModuloEspecialidad1_idx` (`ModuloEspecialidad_idModulo` ASC),
  INDEX `fk_Materia_Personal-Material1_idx` (`Personal-Material_idPersonal-Material` ASC),
  CONSTRAINT `fk_Materia_Departamentos1`
    FOREIGN KEY (`Departamentos_idEstructuraOganica`)
    REFERENCES `SIE`.`Departamentos` (`idEstructuraOganica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_PlanEstudios1`
    FOREIGN KEY (`PlanEstudios_idPlanEstudios`)
    REFERENCES `SIE`.`PlanEstudios` (`idPlanEstudios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_ModuloEspecialidad1`
    FOREIGN KEY (`ModuloEspecialidad_idModulo`)
    REFERENCES `SIE`.`ModuloEspecialidad` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_Personal-Material1`
    FOREIGN KEY (`Personal-Material_idPersonal-Material`)
    REFERENCES `SIE`.`Personal-Material` (`idPersonal-Material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Periodos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Periodos` (
  `idPeriodos` INT NOT NULL,
  `Tipo` TINYINT NOT NULL,
  `Clave` INT NOT NULL COMMENT 'TIPO+CLAVE',
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Termino` DATE NOT NULL,
  `Inicio_Vacaciones` DATE NOT NULL,
  `Termino_Vacaciones` DATE NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Numero_Periodo` INT NULL AUTO_INCREMENT,
  `Kardex_idKardex` INT NOT NULL,
  `Estudios_idEstudios` INT NOT NULL,
  PRIMARY KEY (`idPeriodos`),
  INDEX `fk_Periodos_Kardex1_idx` (`Kardex_idKardex` ASC),
  INDEX `fk_Periodos_Estudios1_idx` (`Estudios_idEstudios` ASC),
  CONSTRAINT `fk_Periodos_Kardex1`
    FOREIGN KEY (`Kardex_idKardex`)
    REFERENCES `SIE`.`Kardex` (`idKardex`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Periodos_Estudios1`
    FOREIGN KEY (`Estudios_idEstudios`)
    REFERENCES `SIE`.`Estudios` (`idEstudios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Parametros` (
  `idParametros` INT NOT NULL,
  `Clave` VARCHAR(4) NOT NULL COMMENT 'PRDO:CLAVE DEL PERIODO ACTUAL\nPPRE: CLAVE DEL PERIODO EN PREPARACION\nPESP: CLAVE DEL PERIODO DE EXAMENES ESPECIALES\nVERA: CLAVE DEL PERIODO DE CURSOS DE VERANO\nFICH: CLAVE DEL PERIODO DE FICHAS DE SELECCIÓN\nENCU: PERIODO DE LAS ENCUESTAS O SOLICITUD DE MATERIAS.\nCERT: FOLIO DE CONTROL DE CONSECUTIVO DE CERTIFICADOS\nCTRL: FOLIO DE CONTROL DE CONSECUTIVO DE NUMEROS DE CONTROL\nJUST: FOLIO DE CONTROL DE CONSECUTIVO DE JUSTIFICACIONES\nPERM: FOLIO DE CONTROL DE CONSECUTIVO DE PERMISOS\nCOMI: FOLIO DE CONTROL DE COMISIONES\nPOBL: FOLIO DE CONTROL DE CONSECUTIVO DE POBLACIONES\nTITU: FOLIO DE CONTROL DE CONSECUTIVO DE TITULOS DEL PERSONAL\n101: FOLIO DE CONTROL DE CONSECUTIVO DE OFICIOS DEL DEPARTAMENTO 101\n',
  `Descripcion` VARCHAR(45) NULL,
  `Folio1` INT NULL,
  `Folio2` INT NULL,
  PRIMARY KEY (`idParametros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Usuario` VARCHAR(60) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Contrseña` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Personal-Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Personal-Departamento` (
  `idPersonal-Departamento` INT NOT NULL,
  `Departamentos_idEstructuraOganica` INT NOT NULL,
  `Personal_idPersonal` INT NOT NULL,
  PRIMARY KEY (`idPersonal-Departamento`),
  INDEX `fk_Personal-Departamento_Departamentos1_idx` (`Departamentos_idEstructuraOganica` ASC),
  INDEX `fk_Personal-Departamento_Personal1_idx` (`Personal_idPersonal` ASC),
  CONSTRAINT `fk_Personal-Departamento_Departamentos1`
    FOREIGN KEY (`Departamentos_idEstructuraOganica`)
    REFERENCES `SIE`.`Departamentos` (`idEstructuraOganica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personal-Departamento_Personal1`
    FOREIGN KEY (`Personal_idPersonal`)
    REFERENCES `SIE`.`Personal` (`idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SIE`.`Alumno-Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIE`.`Alumno-Empresa` (
  `idAlumno-Empresa` INT NOT NULL,
  `Desde` DATE NULL,
  `Hasta` DATE NULL,
  `Alumno_idAlumno` INT NOT NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idAlumno-Empresa`),
  INDEX `fk_Alumno-Empresa_Alumno1_idx` (`Alumno_idAlumno` ASC),
  INDEX `fk_Alumno-Empresa_Empresa1_idx` (`Empresa_idEmpresa` ASC),
  CONSTRAINT `fk_Alumno-Empresa_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno`)
    REFERENCES `SIE`.`Alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno-Empresa_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `SIE`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
