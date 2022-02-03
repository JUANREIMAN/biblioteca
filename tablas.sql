create table direcciones(
id serial,
calle varchar (255) not null,
numero varchar (255) not null,
comuna varchar (255) not null,
primary key (id)
);
create table socios(
rut varchar (255) not null,
nombre varchar (255) not null,
apellido varchar (255) not null,
telefono varchar (255) not null,
direccion_id integer not null,
primary key (rut),
foreign key (direccion_id) references direcciones(id)
);

create table libros(
isbn varchar (255) not null,
titulo varchar (255) not null,
paginas integer not null,	
dias_prestamo integer not null,
primary key (isbn)
);
create table autores(
codigo varchar(255) not null,	
nombre varchar(255) not null,
apellido varchar(255) not null,
nacimiento date  not null,
muerte  date,
primary key(codigo)
);

create table libros_autores(
tipo_autor varchar(255) not null,
autor_codigo varchar(255) not null,
libro_isbn varchar(255) not null,
primary key (libro_isbn, autor_codigo),		
foreign key (libro_isbn) references libros(isbn),
foreign key (autor_codigo) references autores(codigo)
);
create table prestamos(
id serial,
socio_rut	varchar (255),
libro_isbn varchar (255),
fecha_entrega date not null,
fecha_devolucion date not null,
primary key (id),	
foreign key (socio_rut) references socios(rut),
foreign key (libro_isbn) references libros(isbn)
);