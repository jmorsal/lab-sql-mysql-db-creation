
-- MySQL Script generated by MySQL Workbench
-- Sat Nov  9 22:06:04 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS mydb ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
USE mydb ;

-- -----------------------------------------------------
-- Table mydb.cars
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.cars ;

CREATE TABLE IF NOT EXISTS mydb.cars (
  VIN INT NOT NULL,
  manufacturer VARCHAR(45) NULL,
  salesperson VARCHAR(45) NULL,
  invoices FLOAT NULL,
  PRIMARY KEY (VIN))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Customers
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.Customers ;

CREATE TABLE IF NOT EXISTS mydb.Customers (
  customer_ID INT NOT NULL,
  name VARCHAR(45) NULL,
  phone VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  city VARCHAR(45) NULL,
  state_province VARCHAR(45) NULL,
  country VARCHAR(45) NULL,
  zip_postal VARCHAR(45) NULL,
  PRIMARY KEY (customer_ID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Salesperson
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.Salesperson ;

CREATE TABLE IF NOT EXISTS mydb.Salesperson (
  staff_ID INT NOT NULL,
  name VARCHAR(45) NULL,
  store VARCHAR(45) NULL,
  PRIMARY KEY (staff_ID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Invoices
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.Invoices ;

CREATE TABLE IF NOT EXISTS mydb.Invoices (
  invoice_number INT NOT NULL,
  date DATETIME NULL,
  VIN INT NULL,
  customer_ID INT NULL,
  staff_ID INT NULL,
  PRIMARY KEY (invoice_number),
  INDEX VIN_idx (VIN ASC) VISIBLE,
  CONSTRAINT VIN
    FOREIGN KEY (VIN)
    REFERENCES mydb.cars (VIN)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT staff_ID
    FOREIGN KEY (staff_ID)
    REFERENCES mydb.Salesperson (staff_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT customer_ID
    FOREIGN KEY (customer_ID)
    REFERENCES mydb.Customers (customer_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
