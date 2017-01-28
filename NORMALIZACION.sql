set serveroutput on;

--Recapitulando lo que es un bloque PL SQL 

declare 
nombre varchar2(20):='Diego Medina'; 
begin
dbms_output.put_line('Buenas Noches ' || nombre);
end ; 

/

declare 
edad integer:=20;
dias integer; 
estatus varchar2(12); 
begin 
dias:=edad*365; 
if dias >10000 then 
estatus:='VIEJO'; 
else 
estatus:='JOVEN'; 
end if; 
dbms_output.put_line('Tu edad en dias es ' ||dias || ' Estatus:'|| estatus); 
end; 
/

--Veremos nuestro primer procedimiento almacenado 

create or replace procedure saludar(mensaje in varchar2)
as 
begin 
dbms_output.put_line('Hola buenas noches' || mensaje); 
end; 
/

--Ejecutamos el procedimiento 
exec saludar(' Ale Barojas'); 
/

--Generamos una secuencia 
create sequence sec_persona
start with 1
increment by 1
nomaxvalue; 
/
--Generamos la tabla 
create table persona(id_persona integer, nombre varchar2(20), edad integer, constraint pk_id_persona primary key (id_persona)); 
/

create or replace procedure guardar_persona(my_id out integer, my_nombre in varchar2, my_edad in integer)
as
begin 
select sec_persona.nextval into my_id from dual; 
insert into persona values(my_id, my_nombre,my_edad);  
end; 
/

declare 
valor integer; 
begin 
guardar_persona(valor, 'Juan', 23); 
end; 
/ 
select * from persona;
