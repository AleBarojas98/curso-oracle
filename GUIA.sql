create table hobbies(id_hobbies integer, nombre varchar2(30),  fkid_persona integer , constraint pk_id_hobbies primary key (id_hobbies), 
constraint fk_persona foreign key (fkid_persona) references persona(id_persona));

create table direccion(id_direccion integer, calle varchar2(25), cp integer, municipio varchar2(30), estado varchar2(30),pid_persona integer, 
constraint pk_id_direccion primary key (id_direccion), constraint pid_persona foreign key (pid_persona) references persona(id_persona)); 

create table persona(id_persona integer, nombre varchar2(40), login varchar2(15), password integer, email varchar2(40), 
constraint pk_id_persona primary key (id_persona));

--drop table persona; 

--creamos la secuencia de persona 
create sequence sec_persona
start with 1 
increment by 1 
nomaxvalue; 

--creamos la secuencia de direccion 
create sequence sec_direccion 
start with 1 
increment by 1 
nomaxvalue; 

--creamos la secencia hobbies 
create sequence sec_hobbies 
start with 1 
increment by 1 
nomaxvalue;

-- Procedimiento para guardar persona 
create or replace procedure guardar_persona(my_id_persona out integer,my_nombre in varchar2,my_login in varchar2, my_password in integer , my_email in varchar2)
as
begin
select sec_persona.netxval into my_id_persona from dual; 
insert into persona values (my_id_persona, my_nombre, my_login, my_password, my_email);
end; 

--Procedimiento para guardar direccion 
create or replace procedure guardar_direccion(my_id_direccion out integer, my_calle varchar2, my_cp in integer, my_municipio in varchar2, my_estado in varchar2, my_pid_persona in integer)
as 
begin 
select sec_direccion.nextval into my_id_direccion from dual; 
insert into direccion values(my_id_direccion, my_calle, my_cp, my_municipio,my_estado, my_pid_persona); 
end; 

--Procedimiento para guardar hobbies 
create or replace procedure guardar_hobbies (my_id_hobbies out integer, my_nombre in varchar2,my_fkid_persona in integer )
as 
begin 
