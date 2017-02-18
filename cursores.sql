create table dance(id_dance integer, nombre varchar2(20), edad integer, constraint pk_id_dance primary key (id_dance)); 
insert into dance values(1,'Juan', 16); 
insert into dance values(2,'Pedro', 20);
insert into dance values(3, 'Luis', 45);
insert into dance values(4, 'Jose', 70);

set serveroutput on; 
declare
estatus varchar2(20);
cursor cur1 is select * from dance; 
begin 
for rec in cur1 LOOP
if rec.edad<18 THEN 
estatus:='precoz'; 
dbms_output.put_line('nombre'||rec.nombre||'edad'||rec.edad||'estatus'||estatus); 
else 
estatus:='viejo'; 
dbms_output.put_line('nombre'||rec.nombre||'edad'||rec.edad||'estatus'||estatus);
end if; 
end loop; 
end; 
/

--ejercicio numero 2:cursores 
--implementar el sig esquema
----------------------------------------------------------------
--|     TRABAJADOR     | ---------|      NOMINA      |----------
--|--------------------|----------|------------------|----------
--| seguro int pk      |----------| id_nomina int pk |----------
--| nombre varchar2(25)|----------| seguro int fk    |----------
--| edad int           |----------|sueldo_base float |----------
--|                    |----------|hrs_laboradas int |----------
----------------------------------|fecha_pago date   |----------
----------------------------------------------------------------
----------------------------------------------------------------

create table trabajador (seguro integer, nombre varchar2(25), edad integer, constraint pk_seguro primary key (seguro)); 
create table nomina (id_nomina integer, seguro integer, sueldo_base float, hrs_laboradas integer, fecha_pago date, constraint pk_id_nomina primary key (id_nomina), 
constraint fk1_seguro foreign key (seguro) references trabajador(seguro) ); 

insert into trabajador values (1, 'Ana', 28); 
insert into trabajador values (2, 'Pedro', 40);
insert into trabajador values (3, 'Juan', 35);
insert into trabajador values (4, 'Karla', 41); 

insert into nomina values(1,1,6000,40,'');
insert into nomina values(2,2,8000,30,'');
insert into nomina values(3,3,7000,42,'');
insert into nomina values(4,4,10000,48,'');
