create table pelicula(id_pelicula integer , titulo varchar2(50), sinopsis varchar2(100), constraint pk_pelicula primary key (id_pelicula));

--creamos la secuencia de pelicula 

create sequence sec_pelicula 
start with 1
increment by 1 
nomaxvalue; 

drop table pelicula;
--creamos la tabla de salas 
create table salas(num_sala integer, id_peliculaa integer, constraint pk_sala primary key (num_sala),
constraint fk1_id_peliculaa foreign key (id_peliculaa) references pelicula (id_pelicula)); 

--creamos la tabla horarios 
create table horarios(id_horario integer, id_pelicula1 integer, fecha date, 
constraint pk_horario primary key (id_horario), constraint fk1_id_pelicula1 foreign key (id_pelicula1) references pelicula (id_pelicula));

--creamos la secuencia del horario 

create sequence sec_horarios
start with 1 
increment by 1 
nomaxvalue; 

--procedimientos
create or replace procedure guardar_pelicula(my_id_pelicula out integer, my_titulo in varchar2, my_sinopsis in varchar2)
as
begin
select sec_pelicula.nextval into my_id_pelicula from dual; 
insert into pelicula values(my_id_pelicula, my_titulo, my_sinopsis); 
end; 
/

create or replace procedure guardar_salas(my_num_sala in integer, my_id_pelicula in integer) 
as 
begin 
insert into salas values (my_num_sala, my_id_pelicula); 
end; 
/

create or replace procedure guardar_horarios(my_id_horario out integer, my_id_pelicula in integer, my_fecha in date)
as
begin 
select sec_horarios.nextval into my_id_horario from dual; 
insert into horarios values(my_id_horario, my_id_pelicula, my_fecha); 
end; 
/
