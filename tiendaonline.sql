create database tiendaonline;
go

use tiendaonline;
go

create table categorias(
  idCategoria int identity primary key,
  descripcion varchar(50) not null
);
go

create table productos(
  idProducto int identity primary key,
  nombre varchar(50) not null,
  precio float not null,
  idCategoria int not null,
  constraint FK_productos_categorias foreign key (idCategoria)
    references categorias(idCategoria)
);
go

insert into categorias(descripcion) values('Notebooks');
insert into categorias(descripcion) values('Celulares');
insert into categorias(descripcion) values('Periféricos');
insert into categorias(descripcion) values('Audio');
go

insert into productos(nombre, precio, idCategoria) values('Notebook Lenovo IdeaPad 3', 850000, 1);
insert into productos(nombre, precio, idCategoria) values('Notebook HP 15', 920000, 1);
insert into productos(nombre, precio, idCategoria) values('Samsung Galaxy A55', 650000, 2);
insert into productos(nombre, precio, idCategoria) values('Motorola Moto G84', 420000, 2);
insert into productos(nombre, precio, idCategoria) values('Mouse Logitech G203', 35000, 3);
insert into productos(nombre, precio, idCategoria) values('Teclado Redragon Kumara', 55000, 3);
insert into productos(nombre, precio, idCategoria) values('Auriculares JBL Tune 520BT', 70000, 4);
insert into productos(nombre, precio, idCategoria) values('Parlante JBL Go 3', 45000, 4);
go

select pr.idProducto,
       pr.nombre,
       pr.precio,
       ca.descripcion as categoria
  from productos as pr
  join categorias as ca on ca.idCategoria = pr.idCategoria;
go
