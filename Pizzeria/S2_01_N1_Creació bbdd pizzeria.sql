-- MySQL Workbench Synchronization
-- Generated: 2023-03-02 12:50
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Susana

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `pizzeria`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`customers` (
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
    REFERENCES `pizzeria`.`locations` (`locations_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`locations` (
  `locations_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provinces_id` INT(11) NOT NULL,
  `locations_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`locations_id`, `provinces_id`),
  UNIQUE INDEX `locations_id_UNIQUE` (`locations_id` ASC) VISIBLE,
  INDEX `fk_locations_provinces1_idx` (`provinces_id` ASC) VISIBLE,
  CONSTRAINT `fk_locations_provinces1`
    FOREIGN KEY (`provinces_id`)
    REFERENCES `pizzeria`.`provinces` (`provinces_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`provinces` (
  `provinces_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provinces_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`provinces_id`),
  UNIQUE INDEX `provinces_id_UNIQUE` (`provinces_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`products` (
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
    REFERENCES `pizzeria`.`products_images` (`products_images_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`products_images` (
  `products_images_id` INT(11) NOT NULL AUTO_INCREMENT,
  `products_images_photo` BLOB NOT NULL,
  PRIMARY KEY (`products_images_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizzes` (
  `products_id` INT(11) NOT NULL,
  `categories_id` INT(11) NOT NULL,
  INDEX `fk_pizzes_products1_idx` (`products_id` ASC) VISIBLE,
  PRIMARY KEY (`products_id`),
  INDEX `fk_pizzes_categories1_idx` (`categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizzes_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `pizzeria`.`products` (`products_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pizzes_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `pizzeria`.`categories` (`categories_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`categories` (
  `categories_id` INT(11) NOT NULL AUTO_INCREMENT,
  `categories_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categories_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employees` (
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
    REFERENCES `pizzeria`.`stores` (`stores_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`stores` (
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
    REFERENCES `pizzeria`.`locations` (`locations_id` , `provinces_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`orders` (
  `orders_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customers_id` INT(11) NOT NULL,
  `orders_data` DATETIME NOT NULL,
  `orders_option` ENUM('1', '2') NOT NULL COMMENT 'Value 1 - Home delivery\nValue 2 - Store pickup',
  `orders_totalprice` DOUBLE NOT NULL,
  PRIMARY KEY (`orders_id`),
  INDEX `fk_orders_clients1_idx` (`customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_clients1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `pizzeria`.`customers` (`customers_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order_delivery` (
  `orders_id` INT(11) NOT NULL,
  `employees_id` INT(11) NOT NULL,
  `order_delivery_delivery_date` DATETIME NOT NULL,
  INDEX `fk_orders_delivery_orders_idx` (`orders_id` ASC) VISIBLE,
  PRIMARY KEY (`orders_id`),
  INDEX `fk_orders_delivery_employees_idx` (`employees_id` ASC) INVISIBLE,
  CONSTRAINT `fk_order_delivery_orders`
    FOREIGN KEY (`orders_id`)
    REFERENCES `pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_delivery_employees`
    FOREIGN KEY (`employees_id`)
    REFERENCES `pizzeria`.`employees` (`employees_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`order_lines` (
  `order_lines_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_lines_quantity` INT(11) NOT NULL,
  `products_id` INT(11) NOT NULL,
  `orders_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_lines_id`, `orders_id`),
  INDEX `fk_order_lines_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_order_lines_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_lines_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `pizzeria`.`products` (`products_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_lines_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `pizzeria`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Insert en la bbdd de pizzeria

alter table provinces AUTO_INCREMENT=1;
insert into provinces values (null,'Barcelona');
insert into provinces values (null,'Tarragona');
insert into provinces values (null,'Lleida');
insert into provinces values (null,'Girona');

alter table locations AUTO_INCREMENT=1;
insert into locations values (null, 1, 'Mataró');
insert into locations values (null, 1, 'Argentona');
insert into locations values (null, 4, 'Cassà de la Selva');

alter table stores AUTO_INCREMENT=1;
insert into stores values (null, 'Carrer Gran, 13', '08310', 2, 1);
insert into stores values (null, 'Carrer Argentona, 10', '08304', 1, 1);
insert into stores values (null, 'Ronda Alfons X, 28', '17244', 3, 4);

alter table employees AUTO_INCREMENT=1;
insert into employees values (null, 'Pedro', 'Ramirez', '45332463P', '670876543', 1, 1);
insert into employees values (null, 'Joan', 'Pons', '11132463P', '67223344', 2, 1);
insert into employees values (null, 'Sandra', 'Sans', '333445566P', '825876543', 1, 2);
insert into employees values (null, 'Aina', 'Albert', '222334455F', '931233498', 2, 2);

alter table customers AUTO_INCREMENT=1;
insert into customers values (null, 'Alex', 'Sanchez', 'La Riera 14', '08302', '934567891', 1);
insert into customers values (null, 'Gerard', 'Lopez', 'c. Ansel Clave 21', '08310', '931112233', 2);
insert into customers values (null, 'Alfred', 'Riera', 'c. Santa Teresa, 1', '08301', '661121314', 4);

alter table categories AUTO_INCREMENT=1;
insert into categories values (null, 'Mediana');
insert into categories values (null, 'Familiar');
insert into categories values (null, 'Individual');
insert into categories values (null, 'Promoción');

alter table products AUTO_INCREMENT=1;
alter table products_images AUTO_INCREMENT=1;
insert into products_images values (null, 1);
insert into products values (null, 'Pizza 4 estaciones', 'Queso-Tomate-Mozzarela-Jamon', 8.50, 1, 1);
insert into products_images values (null,4);
insert into products values (null, 'Pizza 4 formatges', 'Gorgonzola-Brie-Mozzarela-Gouda',10.0,2, 1);
insert into products values (null, 'Hamburguesa básica', 'Pan-Carne-Queso', 8.50,null, 2);
insert into products values (null, 'Hamburguesa con huevo', 'Basica + huevo', 9.50, null, 2);
insert into products values (null, 'Coca-cola light', 'Coca-cola light', 2.5, null, 3);
insert into products values (null, 'Aigua', 'Aigua', 2, null, 3);
insert into products values (null, 'Cervesa', 'Cervesa', 2.5, null, 3);

alter table pizzes AUTO_INCREMENT=1;
insert into pizzes values (1,1);
insert into pizzes values (2,4);

alter table orders AUTO_INCREMENT=1;
alter table order_lines AUTO_INCREMENT=1;
insert into orders values (null, 1, now(), 1, 8.50);
insert into order_lines values (null, 1, 1,1);

insert into orders values (null, 2, now(), 1, 35.0);
insert into order_lines values (null, 2, 1, 2);
insert into order_lines values (null, 1, 2, 2);
insert into order_lines values (null, 1, 4, 2);

insert into orders values (null, 3, now(), 2, 15.0);
insert into order_lines values (null, 3, 1, 3);
insert into order_lines values (null, 3, 1, 7);
insert into order_delivery values (3, 1, now());

insert into orders values (null, 2, now(), 2, 25.0);
insert into order_lines values (null, 4, 1, 3);
insert into order_lines values (null, 4, 1, 5);
insert into order_delivery values (4, 3, now());

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
