-- Llista el total de factures d'un client/a en un període determinat.
select * from invoice_header where client_id= 2 and invoice_date between '2023-02-01' and '2023-02-28';

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
select distinct(lin.glasses_id), count(*), hea.employee_id from invoice_header hea, invoice_lines lin
where hea.invoice_id = lin.invoice_id
and hea.employee_id = 3
group by lin.glasses_id;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
select distinct(gla.supliers_id), count(*) num_ulleres from glasses gla, invoice_lines lin
where gla.glasses_id = lin.glasses_id
group by gla.supliers_id
order by num_ulleres desc
limit 3;
