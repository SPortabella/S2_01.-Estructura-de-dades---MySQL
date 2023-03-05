-- MySQL Workbench Synchronization
-- Generated: 2023-03-05 22:40
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Susana

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`customers` (
  `customers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customers_firstname` VARCHAR(45) NOT NULL,
  `customers_lastname` VARCHAR(45) NOT NULL,
  `customers_direction` VARCHAR(100) NOT NULL,
  `customers_postalcode` VARCHAR(5) NOT NULL,
  `customer_telefon` VARCHAR(10) NOT NULL,
  `locations_id` INT(11) NOT NULL,
  PRIMARY KEY (`customers_id`),
  UNIQUE INDEX `clients_id_UNIQUE` (`customers_id` ASC) VISIBLE,
  INDEX `fk_clients_locations1_idx` (`locations_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_locations1`
    FOREIGN KEY (`locations_id`)
    REFERENCES `Pizzeria`.`locations` (`locations_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`locations` (
  `locations_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provinces_id` INT(11) NOT NULL,
  `locations_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`locations_id`, `provinces_id`),
  UNIQUE INDEX `locations_id_UNIQUE` (`locations_id` ASC) VISIBLE,
  INDEX `fk_locations_provinces1_idx` (`provinces_id` ASC) VISIBLE,
  CONSTRAINT `fk_locations_provinces1`
    FOREIGN KEY (`provinces_id`)
    REFERENCES `Pizzeria`.`provinces` (`provinces_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`provinces` (
  `provinces_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provinces_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`provinces_id`),
  UNIQUE INDEX `provinces_id_UNIQUE` (`provinces_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`products` (
  `products_id` INT(11) NOT NULL AUTO_INCREMENT,
  `products_name` VARCHAR(45) NOT NULL,
  `products_description` VARCHAR(100) NOT NULL,
  `products_price` DOUBLE NULL DEFAULT NULL,
  `products_images_id` INT(11) NULL DEFAULT NULL,
  `products_type` ENUM('1', '2', '3') NOT NULL COMMENT 'Value 1 - Pizza\nValue 2 - Hamburguer\nValue 3 - Drinks',
  PRIMARY KEY (`products_id`),
  INDEX `fk_products_products_images1_idx` (`products_images_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_products_images1`
    FOREIGN KEY (`products_images_id`)
    REFERENCES `Pizzeria`.`products_images` (`products_images_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`products_images` (
  `products_images_id` INT(11) NOT NULL AUTO_INCREMENT,
  `products_images_photo` BLOB NOT NULL,
  PRIMARY KEY (`products_images_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`pizzes` (
  `products_id` INT(11) NOT NULL,
  `categories_id` INT(11) NOT NULL,
  INDEX `fk_pizzes_products1_idx` (`products_id` ASC) VISIBLE,
  PRIMARY KEY (`products_id`),
  INDEX `fk_pizzes_categories1_idx` (`categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizzes_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `Pizzeria`.`products` (`products_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pizzes_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `Pizzeria`.`categories` (`categories_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`categories` (
  `categories_id` INT(11) NOT NULL AUTO_INCREMENT,
  `categories_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categories_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`employees` (
  `employees_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employees_firstname` VARCHAR(45) NOT NULL,
  `employees_lastname` VARCHAR(45) NOT NULL,
  `employees_nif` VARCHAR(10) NULL DEFAULT NULL,
  `employees_telefon` VARCHAR(9) NULL DEFAULT NULL,
  `employees_type` ENUM('1', '2') NOT NULL COMMENT 'Value 1 - Chef\nValue 2 - Delivery people',
  `stores_stores_id` INT(11) NOT NULL,
  PRIMARY KEY (`employees_id`),
  UNIQUE INDEX `employees_nif_UNIQUE` (`employees_nif` ASC) VISIBLE,
  UNIQUE INDEX `employees_id_UNIQUE` (`employees_id` ASC) VISIBLE,
  INDEX `fk_employees_stores1_idx` (`stores_stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_stores1`
    FOREIGN KEY (`stores_stores_id`)
    REFERENCES `Pizzeria`.`stores` (`stores_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`stores` (
  `stores_id` INT(11) NOT NULL AUTO_INCREMENT,
  `stores_direction` VARCHAR(100) NOT NULL,
  `stores_postalcode` VARCHAR(5) NULL DEFAULT NULL,
  `locations_id` INT(11) NOT NULL,
  `provinces_id` INT(11) NOT NULL,
  PRIMARY KEY (`stores_id`),
  INDEX `fk_stores_locations1_idx` (`locations_id` ASC, `provinces_id` ASC) VISIBLE,
  UNIQUE INDEX `stores_id_UNIQUE` (`stores_id` ASC) VISIBLE,
  CONSTRAINT `fk_stores_locations1`
    FOREIGN KEY (`locations_id` , `provinces_id`)
    REFERENCES `Pizzeria`.`locations` (`locations_id` , `provinces_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`orders` (
  `orders_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customers_id` INT(11) NOT NULL,
  `orders_data` DATETIME NOT NULL,
  `orders_option` ENUM('1', '2') NOT NULL COMMENT 'Value 1 - Home delivery\nValue 2 - Store pickup',
  `orders_totalprice` DOUBLE NOT NULL,
  PRIMARY KEY (`orders_id`),
  INDEX `fk_orders_clients1_idx` (`customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_clients1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `Pizzeria`.`customers` (`customers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`order_delivery` (
  `orders_id` INT(11) NOT NULL,
  `employees_id` INT(11) NOT NULL,
  `order_delivery_delivery_date` DATETIME NOT NULL,
  INDEX `fk_orders_delivery_orders_idx` (`orders_id` ASC) VISIBLE,
  PRIMARY KEY (`orders_id`),
  INDEX `fk_orders_delivery_employees_idx` (`employees_id` ASC) INVISIBLE,
  CONSTRAINT `fk_order_delivery_orders`
    FOREIGN KEY (`orders_id`)
    REFERENCES `Pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_delivery_employees`
    FOREIGN KEY (`employees_id`)
    REFERENCES `Pizzeria`.`employees` (`employees_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`order_lines` (
  `order_lines_id` INT(11) NOT NULL AUTO_INCREMENT,
  `orders_id` INT(11) NOT NULL,
  `products_id` INT(11) NOT NULL,
  `order_lines_quantity` INT(11) NOT NULL,
  PRIMARY KEY (`order_lines_id`, `orders_id`),
  INDEX `fk_order_lines_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_order_lines_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_lines_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `Pizzeria`.`products` (`products_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_lines_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `Pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
