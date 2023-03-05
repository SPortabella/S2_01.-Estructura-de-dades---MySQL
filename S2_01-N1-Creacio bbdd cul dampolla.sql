-- MySQL Workbench Synchronization
-- Generated: 2023-03-02 12:07
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Susana

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `culdampolla`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

DROP DATABASE IF EXISTS culdampolla;
CREATE DATABASE culdampolla CHARACTER SET utf8mb4;
USE culdampolla;
CREATE TABLE IF NOT EXISTS `culdampolla`.`clients` (
  `clients_id` INT(11) NOT NULL AUTO_INCREMENT,
  `clients_name` VARCHAR(45) NOT NULL,
  `clients_direction` VARCHAR(100) NOT NULL,
  `clients_telefon` VARCHAR(12) NOT NULL,
  `clients_email` VARCHAR(45) NOT NULL,
  `clients_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clients_clients_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`clients_id`),
  INDEX `fk_clients_clients1_idx` (`clients_clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_clients1`
    FOREIGN KEY (`clients_clients_id`)
    REFERENCES `culdampolla`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`employees` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Employee';

CREATE TABLE IF NOT EXISTS `culdampolla`.`supliers` (
  `supliers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `supliers_name` VARCHAR(45) NOT NULL,
  `supliers_nif` VARCHAR(10) NOT NULL,
  `supliers_fax` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`supliers_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `glasses_graduation` FLOAT(11) NOT NULL,
  `glasses_price` FLOAT(11) NOT NULL,
  `colors_id` INT(11) NOT NULL,
  `glasses_types_id` INT(11) NOT NULL,
  `brands_id` INT(11) NOT NULL,
  `supliers_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_colors_idx` (`colors_id` ASC) VISIBLE,
  INDEX `fk_glasses_glasses_type_idx` (`glasses_types_id` ASC) VISIBLE,
  INDEX `fk_glasses_brands1_idx` (`brands_id` ASC, `supliers_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_colors`
    FOREIGN KEY (`colors_id`)
    REFERENCES `culdampolla`.`colors` (`colors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_glasses_type`
    FOREIGN KEY (`glasses_types_id`)
    REFERENCES `culdampolla`.`glasses_type` (`glasses_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_brands1`
    FOREIGN KEY (`brands_id` , `supliers_id`)
    REFERENCES `culdampolla`.`brands` (`brands_id` , `supliers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`colors` (
  `colors_id` INT(11) NOT NULL AUTO_INCREMENT,
  `colors_description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`colors_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`glasses_type` (
  `glasses_type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `glasses_type_description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`glasses_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`brands` (
  `brands_id` INT(11) NOT NULL AUTO_INCREMENT,
  `brands_description` VARCHAR(45) NULL DEFAULT NULL,
  `supliers_id` INT(11) NOT NULL,
  PRIMARY KEY (`brands_id`, `supliers_id`),
  INDEX `fk_brands_supliers1_idx` (`supliers_id` ASC) VISIBLE,
  CONSTRAINT `fk_brands_supliers1`
    FOREIGN KEY (`supliers_id`)
    REFERENCES `culdampolla`.`supliers` (`supliers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`supliers_direction` (
  `supliers_direction_id` INT(11) NOT NULL AUTO_INCREMENT,
  `supliers_id` INT(11) NOT NULL,
  `supliers_direction_description` VARCHAR(45) NULL DEFAULT NULL,
  `supliers_direction_street` VARCHAR(45) NULL DEFAULT NULL,
  `supliers_direction_number` INT(11) NULL DEFAULT NULL,
  `supliers_direction_floor` VARCHAR(5) NULL DEFAULT NULL,
  `supliers_direction_door` VARCHAR(5) NULL DEFAULT NULL,
  `supliers_direction_city` VARCHAR(45) NULL DEFAULT NULL,
  `supliers_direction_postalcode` VARCHAR(5) NULL DEFAULT NULL,
  `supliers_direction_country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`supliers_direction_id`, `supliers_id`),
  INDEX `fk_supliers_direction_supliers1_idx` (`supliers_id` ASC) VISIBLE,
  CONSTRAINT `fk_supliers_direction_supliers1`
    FOREIGN KEY (`supliers_id`)
    REFERENCES `culdampolla`.`supliers` (`supliers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`invoice_header` (
  `invoice_id` INT(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` INT(11) NOT NULL,
  `invoice_date` DATETIME NOT NULL,
  `client_id` INT(11) NOT NULL,
  `employee_id` INT(11) NULL DEFAULT NULL,
  `invoice_total_price` FLOAT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `invoice_employee_id_idx` (`employee_id` ASC) VISIBLE,
  INDEX `invoice_client_id_idx` (`client_id` ASC) VISIBLE,
  UNIQUE INDEX `invoice_num_fra_UNIQUE` (`invoice_number` ASC) INVISIBLE,
  CONSTRAINT `invoice_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `culdampolla`.`employees` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `invoice_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `culdampolla`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culdampolla`.`invoice_lines` (
  `invoice_lines_id` INT(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` INT(11) NOT NULL,
  `glasses_id` INT(11) NOT NULL,
  `invoice_lines_quantity` INT(11) NOT NULL,
  `invoice_lines_price` INT(11) NOT NULL,
  PRIMARY KEY (`invoice_lines_id`, `invoice_id`),
  INDEX `fk_invoice_idx` (`invoice_id` ASC) VISIBLE,
  INDEX `fk_glasses_idx` (`glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_header`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `culdampolla`.`invoice_header` (`invoice_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `culdampolla`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table colors AUTO_INCREMENT=1;
insert into colors values (null,"Verd");
insert into colors values (null,"Blau");
insert into colors values (null,"Vermell");
insert into colors values (null,"Gris");
insert into colors values (null,"Negra");
insert into colors values (null,"Groga");
insert into colors values (null,"Taronja");
insert into colors values (null,"Fuxia");
select * from colors;

alter table glasses_type AUTO_INCREMENT=1;
insert into glasses_type values (null,"Flotant");
insert into glasses_type values (null,"Pasta");
insert into glasses_type values (null, "Metal·lica");
select * From glasses_type;

alter table employees AUTO_INCREMENT=1;
insert into employees values (null, "Andrea Sánchez González");
insert into employees values (null, "Xavier Prats Albert");
insert into employees values (null, "Txell Martin Moreno");
select * from employees ;

alter table clients AUTO_INCREMENT=1;
insert into clients values (null,"ESTHER", "DIRECCION ESTHER", "937654477", "ESTHER@GMAIL.COM",now(), NULL);
insert into clients values (null,"JOAN", "DIRECCIO JOAN", "931234567", "JOAN@GMAIL.COM",now(), 1);
insert into clients values (null,"ALBERT", "DIRECCIO ALBERT", "931112233", "ALBERT@GMAIL.COM",now(), NULL);
select * from clients ;

alter table supliers AUTO_INCREMENT=1;
insert into supliers values (null,"OPTICAS ANDORRANA", "A454654654", "937654477");
insert into supliers values (null,"OPTICALIA", "B777888999", "931234567");
insert into supliers values (null,"AFELOU", "A123456844", "931112233");
insert into supliers values (null,"MULTIOPRICAS", "B65487778", "931112233");
select * from supliers ;

alter table supliers_direction AUTO_INCREMENT=1;
insert into supliers_direction values (null, 1, "Facturación", "Meridiana", 8, 2, "A", "Barcelona","08025", "España");
insert into supliers_direction values (null, 1, "General", "St. Antoni", 13, null,null, "Mataró","08303", "España");
insert into supliers_direction values (null, 2, "Facturación", "Mallorca", 300, "Ppal", "2", "Barcelona","08036", "España");
insert into supliers_direction values (null, 3, "Facturación", "Diagonal", 130, "Atic", "F", "Barcelona","08006", "España");
select * from supliers_direction;

alter table brands AUTO_INCREMENT=1;
insert into brands values (null,"TOUS", 1);
insert into brands values (null,"GUCCI", 1);
insert into brands values (null,"AFFELOU", 3);
insert into brands values (null,"MULTIOPTICAS", 4);
insert into brands values (null,"DOLCE & GABANA", 4);
insert into brands values (null,"OPTICALIA", 2);
insert into brands values (null,"TOUS", 2);
insert into brands values (null,"GUCCI", 2);
select * from brands;
select b.*, s.supliers_name from brands b, supliers s where b.supliers_id = s.supliers_id;

delete from glasses;
alter table glasses AUTO_INCREMENT=1;
insert into glasses values (null,2.1, 250, 		2, 2, 1, 1);
insert into glasses values (null,2.2, 125.50, 	4, 3, 2,1);
insert into glasses values (null,1.2, 125.50, 	3, 1, 3,3);
insert into glasses values (null,2.0, 175, 		8, 1, 4,4);
insert into glasses values (null,2.0, 175, 		7, 2, 6,2);
insert into glasses values (null,2.0, 175, 		3, 3, 2,1);
insert into glasses values (null,2.0, 175, 		3, 3, 6,2);
select * from glasses;

delete from invoice_header;
alter table invoice_header AUTO_INCREMENT=1;
insert into invoice_header values (null,1,'2023-02-05', 1,2, 82.5);
insert into invoice_header values (null,2,'2023-02-08', 1,2, 183.9);
insert into invoice_header values (null,3,'2023-02-10', 2,1, 425.80);
insert into invoice_header values (null,4,'2023-02-25', 2,3, 90.0);
insert into invoice_header values (null,5,'2023-03-01', 3,1, 50.0);
insert into invoice_header values (null,6,'2023-03-05', 3,3, 105);
select * from invoice_header;

delete from invoice_lines;
alter table invoice_lines AUTO_INCREMENT=1;
insert into invoice_lines values (null,	1,	1,	1,250);
insert into invoice_lines values (null,	1,	4,	1,175);
insert into invoice_lines values (null,	1,	6,	2,175);
insert into invoice_lines values (null,	2,	1,	2,250);
insert into invoice_lines values (null,	2,	2,	2,125.5);
insert into invoice_lines values (null,	2,	3,	3,125.5);
insert into invoice_lines values (null,	3,	7,	1,175);
insert into invoice_lines values (null,	4,	7,	1,175);
insert into invoice_lines values (null,	4,	4,	1,175);
insert into invoice_lines values (null,	4,	3,	1,125.5);
insert into invoice_lines values (null,	4,	2,	4, 125.5);
insert into invoice_lines values (null,	4,	5,	2,175);
insert into invoice_lines values (null,	5,	5,	1,175);
insert into invoice_lines values (null,	5,	6,	1,175);
insert into invoice_lines values (null,	5,	7,	3,175);
insert into invoice_lines values (null,	6,	3,	1,125.5);
insert into invoice_lines values (null,	6,	2,	1,125.5);
select * from invoice_lines;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


