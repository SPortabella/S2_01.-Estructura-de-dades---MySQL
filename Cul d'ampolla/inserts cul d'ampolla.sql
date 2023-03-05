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
select b.*, s.supliers_name from brands b, supliers s where b.supliers_supliers_id = s.supliers_id;

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

alter table invoice_header AUTO_INCREMENT=1;
insert into invoice_header values (null,"A",1,now(), 1,2, null);
insert into invoice_header values (null,"A",2,now(), 1,2, null);
insert into invoice_header values (null,"A",3,now(), 2,1, null);
insert into invoice_header values (null,"A",4,now(), 2,3, null);
insert into invoice_header values (null,"A",5,now(), 3,1, null);
insert into invoice_header values (null,"A",6,now(), 3,3, null);
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