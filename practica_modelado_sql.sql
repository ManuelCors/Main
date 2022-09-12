-- creacion de esquema
create schema flotavehiculos

-- crecion de las tablas
create table flotavehiculos.carros(
	id serial not null,
	modelo_carro varchar(25),
	color varchar(25),
	matricula varchar(8),
	fecha_compra date,
	km_totales decimal,
	id_marca int, -- fk
	num_poliza int, -- fk
	id_aseguradora int -- fk
);


create table flotavehiculos.marca(
	id serial not null,
	nombre_marca varchar(100),
	id_grupo int
);

create table flotavehiculos.grupo_empresarial(
	id serial not null,
	nombre_grupo varchar(100),
	direccion varchar(255),
	numero_marcas int
);

create table flotavehiculos.revision(
	id serial not null,
	importe numeric(10,2),
	moneda_importe varchar(25),
	fecha_revision timestamp,
	id_carro int
);

create table flotavehiculos.poliza(
	id serial not null -- num. de poliza
); 

create table flotavehiculos.aseguradora(
	id serial not null,
	nombre_aseguradora varchar(255)
); 

-- definiendo llaves primarias(PK)
alter table flotavehiculos.carros add constraint PK_carros_id primary key(id);
alter table flotavehiculos.marca add constraint PK_marca_id primary key(id);
alter table flotavehiculos.grupo_empresarial add constraint PK_grupo_empresarial_id primary key(id);
alter table flotavehiculos.revision add constraint PK_revision_id primary key(id);
alter table flotavehiculos.poliza add constraint PK_poliza_id primary key(id);
alter table flotavehiculos.aseguradora add constraint PK_aseguradora_id primary key(id);


-- definicion llaves foraneas (FK)
alter table flotavehiculos.carros add constraint FK_carro_marca
  foreign key (id_marca)
  references flotavehiculos.marca (id);

alter table flotavehiculos.carros add constraint FK_carro_poliza
  foreign key (num_poliza)
  references flotavehiculos.poliza (id);
  
  alter table flotavehiculos.carros add constraint FK_carro_aseguradora
  foreign key (id_aseguradora)
  references flotavehiculos.aseguradora (id);
  
  
  alter table flotavehiculos.marca add constraint FK_marca_grupo_empresarial
  foreign key (id_grupo)
  references flotavehiculos.grupo_empresarial (id);
  
  alter table flotavehiculos.revision add constraint FK_revision_carro
  foreign key (id_carro)
  references flotavehiculos.carros (id);
  
 -- inserciones
insert into flotavehiculos.grupo_empresarial(id, nombre_grupo) values(1, 'Grupo Volkswagen');
insert into flotavehiculos.grupo_empresarial(id, nombre_grupo) values(2, 'Grupo Toyota');
insert into flotavehiculos.grupo_empresarial(id, nombre_grupo) values(3, 'Grupo KIA');
insert into flotavehiculos.grupo_empresarial(id, nombre_grupo) values(4, 'Grupo Nissan');
insert into flotavehiculos.grupo_empresarial(id, nombre_grupo) values(5, 'Grupo Suzuki');
insert into flotavehiculos.grupo_empresarial(id, nombre_grupo) values(6, 'Ford Motor Company');
insert into flotavehiculos.grupo_empresarial(id, nombre_grupo) values(7, 'Subaru Corporation');

insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (1, 'AUDI', 1);
insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (2, 'VW SEAT', 1);
insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (3, 'SUZUKI', 5);
insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (4, 'RENAULT', 4);
insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (5, 'KIA', 3);
insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (6, 'TOYOTA', 2);
insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (7, 'FORD', 6);
insert into flotavehiculos.marca(id, nombre_marca, id_grupo) values (8, 'SUBARU', 7);


insert into flotavehiculos.poliza(id) values(10001);
insert into flotavehiculos.poliza(id) values(10101);
insert into flotavehiculos.poliza(id) values(10030);
insert into flotavehiculos.poliza(id) values(11234);
insert into flotavehiculos.poliza(id) values(12456);

insert into flotavehiculos.aseguradora(id,nombre_aseguradora) values(1, 'AXA S.A de C.V.');
insert into flotavehiculos.aseguradora(id,nombre_aseguradora) values(2, 'MAPFRE');
insert into flotavehiculos.aseguradora(id,nombre_aseguradora) values(3, 'MMT');
insert into flotavehiculos.aseguradora(id,nombre_aseguradora) values(4, 'HDI');
insert into flotavehiculos.aseguradora(id,nombre_aseguradora) values(5, 'GNP');

insert into flotavehiculos.carros(id, modelo_carro, color, matricula, fecha_compra, km_totales, id_marca, num_poliza, id_aseguradora) 
values(100001, 'Audi A1', 'Rojo', 'VTY5189', '2022-05-01', 25.00, 1, 10001, 1);
insert into flotavehiculos.carros(id, modelo_carro, color, matricula, fecha_compra, km_totales, id_marca, num_poliza, id_aseguradora) 
values(100002, 'SEAT Leon', 'Gris', 'BGH9087', '2002-11-11', 50.00, 2, 10101, 4);
insert into flotavehiculos.carros(id, modelo_carro, color, matricula, fecha_compra, km_totales, id_marca, num_poliza, id_aseguradora) 
values(100003, 'TRANSIT', 'Blanco', 'MXN2202', '2022-01-13', 15.00, 7, 10030, 3);
insert into flotavehiculos.carros(id, modelo_carro, color, matricula, fecha_compra, km_totales, id_marca, num_poliza, id_aseguradora) 
values(100004, 'Sedona', 'azul', 'STF0912', '2021-05-15', 70.00, 5, 11234, 5);
insert into flotavehiculos.carros(id, modelo_carro, color, matricula, fecha_compra, km_totales, id_marca, num_poliza, id_aseguradora) 
values(100005, 'Master Minibus', 'negra', 'HJK4837', '2015-08-05', 100.00, 4, 12456, 2);


insert into flotavehiculos.revision(id, importe, moneda_importe, fecha_revision, id_carro)
values(1, 150.00, 'USD', '2022-05-12', 100001);
insert into flotavehiculos.revision(id, importe, moneda_importe, fecha_revision, id_carro)
values(2, 200.00, 'EUR', '2004-07-21', 100002);
insert into flotavehiculos.revision(id, importe, moneda_importe, fecha_revision, id_carro)
values(3, 100.00, 'USD', '2022-06-15', 100003);
insert into flotavehiculos.revision(id, importe, moneda_importe, fecha_revision, id_carro)
values(4, 350.00, 'EUR', '2022-05-06', 100004);
insert into flotavehiculos.revision(id, importe, moneda_importe, fecha_revision, id_carro)
values(5, 600.00, 'EUR', '2017-02-14', 100005);