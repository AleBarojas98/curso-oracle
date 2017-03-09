create table usuario_xxx(id_usuario integer,nombre varchar2(40), edad integer, constraint pk_is_usuario primary key (id_usuario)); 
create or replace trigger disp_usuario_xxx before insert on usuario_xxx
for each row 
begin 
if :new .edad<18 then 
--Esta es la excepcion 
raise_application_error(-20001, 'Eres menor de edad');
end if; 
end; 
/
