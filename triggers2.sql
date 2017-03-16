create table PAPA (id integer primary key, nombre varchar2(40), edad integer);
create table HIJOMAYOR(id integer primary key, nombre varchar2(40), edad integer);
create table HIJOMENOR(id integer primary key, nombre varchar2(40), edad integer);

create or replace trigger disp_papa after insert on papa for each row 
begin 
if :new.edad >18 then 
insert into HIJOMAYOR values(:new.id, :new.nombre, :new.edad);
else 
insert into HIJOMENOR values(:new.id, :new.nombre, :new.edad);
end if; 
end; 
/

insert into PAPA values(1, 'JUAN', 23);
insert into PAPA values(2,'ANA',15);
--HACEMOS UN SELECT EN PAPA 

select * from PAPA; 
select * from HIJOMAYOR; 
select * from HIJOMENOR; 

create table trabajador(id integer primary key, nombre varchar2(20), sueldo_base float);
create table respaldo(id integer, nombre varchar2(20), sueldo_base float);

create or replace trigger disp_trabajador after insert on trabajador for each row 
begin 
if :new.id >3 then 
insert into
