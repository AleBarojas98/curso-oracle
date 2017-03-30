create table alumno(num_cta integer , nombre varchar2(25), paterno varchar2(25), constraint pk_num_cta primary key (num_cta) );
create table materia(id_materia integer , nombre varchar2(120), constraint pk_id_materia primary key (id_materia));
create table evaluacion(num_cta integer, id_materia integer, calificacion float, estatus char, constraint fk_num_cta foreign key (num_cta) references alumno(num_cta), constraint 
fk_id_materia foreign key (id_materia) references materia(id_materia));

--creamos la secuencia para la materia 
create sequence sec_materia
start with 1 
increment by 1
nomaxvalue; 


--creamos procedimiento de materia 
create or replace procedure guardar_materia(my_id_materia out integer , my_nombre in varchar2  ) 
as 
begin 
select sec_materia.nextval into my_id_materia from dual; 
insert into materia values(my_id_materia, my_nombre);
end; 
/ 

insert into alumno values (123, 'Diego', 'Medina');
insert into alumno values (345, 'Alejandra', 'Barojas');
insert into alumno values (678, 'Ivan', 'Medina');





declare 
valor integer; 
begin 
guardar_materia(valor,'Metodologia Estructurada');
end; 
/

select * from alumno; 
select * from materia;


create or replace trigger disp_error
before insert on evaluacion for each row 
declare 
sstatus varchar2(30); 
begin
if (calificacion <=5) & (estatus = 'A') then 
sstatus:='ERROR';
else 
if (calificacion >=6) & (estatus = 'R') then
status:='ERROR'; 
end if; 
end if; 
end; 
/

insert into evaluacion values(123, 1, '7.9' , 'A');
insert into evaluacion values(456, 2, '5' , 'A');
insert into evaluacion values(789, 1, '4.2' , 'R');
insert into evaluacion values(123, 3, '8.5' , 'R');
insert into evaluacion values(789, 1, '2.0' , 'F');
