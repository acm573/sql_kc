-- Autor: César Armando Cruz Mendoza  (acm)


-- Crea el espacio de trabajo
create schema acm authorization uqmovtzu

-- se crea la tabla de Colores
create table acm.colores(
	id_color varchar(10) not null, --PK
	nombre varchar(50) not null,
	descripcion varchar(200) null
);

alter table acm.colores 
add constraint id_color_PK primary key (id_color);


-- crea la tabla de Aseguradoras
create table acm.aseguradoras(
	id_aseguradora varchar(10) not null, --PK
	nombre varchar(50) not null,
	descripcion varchar(200) null
);

alter table acm.aseguradoras 
add constraint id_aseguradora_PK primary key (id_aseguradora);


-- crea la tabla de Grupo empresarial
create table acm.grupos(
	id_grupo varchar(10) not null, --PK
	nombre varchar(50) not null,
	descripcion varchar(200) null
);

alter table acm.grupos
add constraint id_grupo_PK primary key (id_grupo);


-- crea la tabla de Marcas
create table acm.marcas(
	id_marca varchar(10) not null, --PK
	id_grupo varchar(10) not null, --FK
	nombre varchar(50) not null,
	descripcion varchar(200) null
);

alter table acm.marcas 
add constraint id_marca_PK primary key (id_marca);

alter table acm.marcas
add constraint marcas_id_grupo_FK 
foreign key (id_grupo) 
references acm.grupos(id_grupo);



-- crea la tabla de Modelos
create table acm.modelos(
	id_modelo varchar(10) not null, --PK
	id_marca varchar(10) not null, --FK
	nombre varchar(50) not null,
	descripcion varchar(200) null
);

alter table acm.modelos 
add constraint id_modelo_PK primary key (id_modelo);

alter table acm.modelos
add constraint modelos_id_marca_FK 
foreign key (id_marca) 
references acm.marcas(id_marca);


-- Crea la tabla de coches
create table acm.vehiculos(
	id_vehiculo varchar(10) not null, --PK
	id_color varchar(10) not null,  --FK
	id_modelo varchar(10) not null,  --FK
	id_aseguradora varchar(10) not null, --FK
	matricula varchar(10) not null,
	kilometraje varchar(10) not null,
	numero_poliza varchar(10) not null,
	fecha_compra date not null
);

alter table acm.vehiculos 
add constraint id_vehiculo_PK primary key (id_vehiculo);

alter table acm.vehiculos
add constraint colores_id_color_FK 
foreign key (id_color) 
references acm.colores(id_color);

alter table acm.vehiculos
add constraint modelos_id_modelo_FK 
foreign key (id_modelo) 
references acm.modelos(id_modelo);

alter table acm.vehiculos 
add constraint aseguradoras_id_aseguradora_FK 
foreign key (id_aseguradora) 
references acm.aseguradoras(id_aseguradora);



-- crea la tabla de Monedas
create table acm.monedas(
	id_moneda varchar(10) not null, --PK
	nombre varchar(50) not null,
	descripcion varchar(200) null
);

alter table acm.monedas
add constraint id_moneda_PK primary key (id_moneda);


-- crea la tabla de revisiones
create table acm.revisiones(
	id_vehiculo varchar(10) not null, --PK
	fecha_revision date not null, --PK
	kilometraje varchar(10) not null,
	importe_revision numeric(10,2) not null,
	id_moneda varchar(10) not null --FK
);

alter table acm.revisiones
add constraint fecha_revision_PK primary key (fecha_revision, id_vehiculo);

alter table acm.revisiones 
add constraint vehiculos_id_vehiculo_FK 
foreign key (id_vehiculo) 
references acm.vehiculos(id_vehiculo);

alter table acm.revisiones 
add constraint mondedas_id_moneda_FK 
foreign key (id_moneda) 
references acm.monedas(id_moneda);




-- Carga el modelo

-- Carga monedas
insert into acm.monedas (id_moneda, nombre, descripcion)
values ('01', 'USD', 'Dolar estadounidense');

insert into acm.monedas (id_moneda, nombre, descripcion)
values ('02', 'MXN', 'Peso mexicano');

insert into acm.monedas (id_moneda, nombre, descripcion)
values ('03', 'EUR', 'Unión europea');

insert into acm.monedas (id_moneda, nombre, descripcion)
values ('04', 'GPB', 'Libra esterlina');

insert into acm.monedas (id_moneda, nombre, descripcion)
values ('05', 'CHF', 'Franco suizo');

insert into acm.monedas (id_moneda, nombre, descripcion)
values ('06', 'JPY', 'Yen japones');

-- select * from acm.monedas;


-- Carga aseguradoras

insert into acm.aseguradoras (id_aseguradora, nombre)
values ('01', 'Mapfre');

insert into acm.aseguradoras (id_aseguradora, nombre)
values ('02', 'MMT');

insert into acm.aseguradoras (id_aseguradora, nombre)
values ('03', 'AXA');

insert into acm.aseguradoras (id_aseguradora, nombre)
values ('04', 'HDI');

insert into acm.aseguradoras (id_aseguradora, nombre)
values ('05', 'GNP Seguros');

-- select * from acm.aseguradoras;


-- Carga colores

insert into acm.colores (id_color, nombre)
values ('01', 'Blanco');

insert into acm.colores (id_color, nombre)
values ('02', 'Gris');

insert into acm.colores (id_color, nombre)
values ('03', 'Negro');

insert into acm.colores (id_color, nombre)
values ('04', 'Plata');

insert into acm.colores (id_color, nombre)
values ('05', 'Azul');

insert into acm.colores (id_color, nombre)
values ('06', 'Rojo');

insert into acm.colores (id_color, nombre)
values ('07', 'Verde');

insert into acm.colores (id_color, nombre)
values ('08', 'Amarillo');

-- select * from acm.colores;


-- Carga los grupos

insert into acm.grupos (id_grupo, nombre)
values ('01', 'Volkswagen');

insert into acm.grupos (id_grupo, nombre)
values ('02', 'Toyoya Motor');

insert into acm.grupos (id_grupo, nombre)
values ('03', 'Ford Motor');

insert into acm.grupos (id_grupo, nombre)
values ('04', 'General Motor');

insert into acm.grupos (id_grupo, nombre)
values ('05', 'Renault Nissan');

-- select * from acm.grupos;


-- cargas las marcas

--Toyota Motor
insert into acm.marcas (id_marca, id_grupo, nombre)
values ('01', '02', 'Toyota');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('02', '02', 'Lexus');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('03', '02', 'Subaru');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('04', '02', 'Scion');

-- Volkswagen
insert into acm.marcas (id_marca, id_grupo, nombre)
values ('05', '01', 'Audi');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('06', '01', 'Bentley');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('07', '01', 'Bugatti');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('08', '01', 'Lamborghini');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('09', '01', 'SEAT');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('10', '01', 'Volkswagen');

-- Ford Motor
insert into acm.marcas (id_marca, id_grupo, nombre)
values ('11', '03', 'Ford');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('12', '03', 'Mazda');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('13', '03', 'Lincoln');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('14', '03', 'Troller');

-- General Motor
insert into acm.marcas (id_marca, id_grupo, nombre)
values ('15', '04', 'Buick');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('16', '04', 'Chevrolet');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('17', '04', 'GMC');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('18', '04', 'Cadillac');

-- Renault Nissan
insert into acm.marcas (id_marca, id_grupo, nombre)
values ('19', '05', 'Renualt');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('20', '05', 'Nissan');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('21', '05', 'Infiniti');

insert into acm.marcas (id_marca, id_grupo, nombre)
values ('22', '05', 'Dacia');

-- select * from acm.marcas;

-- carga Modelos
insert into acm.modelos (id_modelo, id_marca, nombre)
values ('01', '01', 'Matrix');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('02', '01', 'Prius');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('03', '05', 'TT');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('04', '09', 'Leon');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('05', '09', 'Cupra');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('06', '09', 'Toledo');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('07', '10', 'Jetta');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('08', '10', 'Vento');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('09', '10', 'Polo');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('10', '11', 'Fiesta');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('11', '11', 'Lobo');

insert into acm.modelos (id_modelo, id_marca, nombre)
values ('12', '20', 'Versa');

-- select * from acm.modelos;

-- carga vehiculos de la compañía

insert into acm.vehiculos (id_vehiculo, id_color, id_aseguradora, id_modelo, matricula, kilometraje, numero_poliza, fecha_compra)
values ('01', '06', '01', '01', 'UKJ6601', '80000', 'G-1000', '2007-09-25');

insert into acm.vehiculos (id_vehiculo, id_color, id_aseguradora, id_modelo, matricula, kilometraje, numero_poliza, fecha_compra)
values ('02', '03', '01', '04', 'AAA0011', '12000', 'G-2000', '2009-02-05');

insert into acm.vehiculos (id_vehiculo, id_color, id_aseguradora, id_modelo, matricula, kilometraje, numero_poliza, fecha_compra)
values ('03', '02', '03', '06', 'ABC987', '167000', 'RE-1245', '2011-05-01');

insert into acm.vehiculos (id_vehiculo, id_color, id_aseguradora, id_modelo, matricula, kilometraje, numero_poliza, fecha_compra)
values ('04', '01', '02', '07', 'L-OP-992', '90000', '8787287', '2017-09-01');

insert into acm.vehiculos (id_vehiculo, id_color, id_aseguradora, id_modelo, matricula, kilometraje, numero_poliza, fecha_compra)
values ('05', '02', '05', '08', 'UMM-9898', '2000', 'QW-90911', '2019-02-02');

insert into acm.vehiculos (id_vehiculo, id_color, id_aseguradora, id_modelo, matricula, kilometraje, numero_poliza, fecha_compra)
values ('06', '03', '05', '11', 'FAF-5522', '76000', 'QW-66277', '2018-10-05');

insert into acm.vehiculos (id_vehiculo, id_color, id_aseguradora, id_modelo, matricula, kilometraje, numero_poliza, fecha_compra)
values ('07', '05', '01', '12', 'QQQ7777', '365000', 'G-34562', '2005-12-05');


-- select * from acm.vehiculos;


-- carga históricos de servicios

insert into acm.revisiones (id_vehiculo, fecha_revision, kilometraje, importe_revision, id_moneda)
values ('01', '2007-12-01', '25000', 125.67, '03');

insert into acm.revisiones (id_vehiculo, fecha_revision, kilometraje, importe_revision, id_moneda)
values ('01', '2008-03-01', '40000', 100.00, '03');

insert into acm.revisiones (id_vehiculo, fecha_revision, kilometraje, importe_revision, id_moneda)
values ('07', '2006-02-01', '10000', 98.00, '03');



















