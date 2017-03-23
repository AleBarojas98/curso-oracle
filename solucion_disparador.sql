create table trabajador(id integer primary key, nombre varchar2(20), sueldo_base float);
create table respaldo(id integer, nombre varchar2(20), sueldo_base float);

create or replace procedure contar(numero out integer)
as
begin 
select count(*) into numero from trabajador; 
dbms_output.put_line('encontrados' || numero);
end; 
/

create or replace procedure copiar 
as 
cursor cur_trabajador is select * from trabajador; 
begin 
for rec in cur_trabajador loop 
insert into respaldo values(rec.id, rec.nombre, rec.sueldo_base); 
end loop; 
end; 
/

create or replace trigger disp_trabajador 
before insert on trabajador for each row 
declare 
valor integer; 
begin 
contar(valor);
if valor = 3 then 
copiar(); 
delete from trabajador; 
end if; 
end; 
/

insert into trabajador values(1,'juana', 1500);
insert into trabajador values(2,'juana', 1500);
insert into trabajador values(3,'juana', 1500);

select * from trabajador; 
select * from respaldo; 
insert into trabajador values(4,'juana', 1500);

