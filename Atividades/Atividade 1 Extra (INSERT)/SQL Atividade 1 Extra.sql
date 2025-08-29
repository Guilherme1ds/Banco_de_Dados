create database remoterc;

use remoterc;

create table produtos (
cod_produto int auto_increment not null,
descricao varchar(100) not null,
peso char(2) not null,
valor_unit decimal not null,
primary key (cod_produto)
);

create table vendedor (
cod_vendedor int auto_increment not null,
salario decimal(6) not null,
nome varchar(100) not null,
f_salario int not null,
primary key (cod_vendedor)
);

create table cliente (
cod_cliente int auto_increment not null,
nome_cliente varchar(100) not null,
endereco varchar(100) not null,
cidade varchar(100) not null,
uf char(2) not null,
primary key (cod_cliente)
);

insert into produtos(cod_produto, descricao, peso, valor_unit) values 
(1, 'Teclado', 'KG',  35.00),
(2, 'Mouse', 'KG',  25.00),
(3, 'HD', 'KG',  350.00);

insert into vendedor(cod_vendedor, salario, nome, f_salario) values 
(1, 3512.00, 'Ronaldo', 1),
(2, 3225.00, 'Robertson', 2),
(3, 4350.00, 'Clodoaldo', 3);

insert into cliente(cod_cliente, nome_cliente, endereco, cidade, uf) values
(11, 'Bruno', 'Rua 1 456', 'Rio Claro', 'SP'),
(12, 'Cláudio', 'Rua Quadrada 234', 'Campinas', 'SP'),
(13, 'Cremilda', 'Rua das Flores 666', 'São Paulo', 'SP');

update vendedor set salario = 3150.00 where cod_vendedor = 1;

alter table vendedor
modify column salario decimal(10,2) not null;

update vendedor set salario = salario * 1.10 where cod_vendedor = 2;

update vendedor set salario = 3500.00 where cod_vendedor = 3;

select * from vendedor