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
