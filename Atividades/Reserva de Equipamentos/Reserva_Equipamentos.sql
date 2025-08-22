create database reserva_equipamentos;

use reserva_equipamentos;

create table equipamentos (
id_equipamento int auto_increment not null,
descricao varchar(100) not null,
nome_equipamento varchar(100) not null,
valor decimal(5,2) not null,
primary key (id_equipamento)
);

create table fornecedores (
id_fornecedor int auto_increment not null,
nome_fornecedor varchar(100) not null,
endereco varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
primary key (id_fornecedor)
);

create table clientes (
id_cliente int auto_increment not null,
nome_cliente varchar(100) not null,
celular varchar(19) not null,
cpf varchar(14) not null,
endereco varchar(100),
primary key (id_cliente)
);

create table compra (
id_compra int primary key auto_increment not null,
id_cliente int not null,
id_equipamento int not null,
foreign key (id_cliente) references clientes (id_cliente),
foreign key (id_equipamento) references equipamentos (id_equipamento)
);

create table fornece (
id_fornece int primary key auto_increment not null,
id_fornecedor int not null,
id_equipamento int not null,
foreign key (id_fornecedor) references fornecedores (id_fornecedor),
foreign key (id_equipamento) references equipamentos (id_equipamento)
);