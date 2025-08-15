create database solar;

use solar;

create table if not exists clientes (
id_cliente int auto_increment not null,
nome_cliente varchar(100),
cpf varchar(14) not null,
endereco varchar(100),
celular varchar(19),
primary key (id_cliente)
);

create table if not exists produtos (
cod_produto int auto_increment not null,
nome_produto varchar(100) not null,
quantidade int,
descricao text,
valor decimal(5,2) not null,
primary key (cod_produto)
);

create table fornecedores (
id_fornecedor int auto_increment not null,
nome_fornecedor varchar(100),
endereco varchar(100) not null,
cnpj varchar(18) not null,
celular varchar(19),
cidade varchar(100),
estado char(2) default 'SP',
primary key (id_fornecedor)
);

create table vende (
cod_venda int primary key auto_increment not null,
id_fornecedor int not null,
cod_produto int not null,
foreign key (cod_produto) references produtos (cod_produto),
foreign key (id_fornecedor) references fornecedores (id_fornecedor)
);

create table compra (
cod_compra int primary key auto_increment not null,
id_cliente int not null,
cod_produto int not null,
foreign key (id_cliente) references clientes (id_cliente),
foreign key (cod_produto) references produtos (cod_produto)
);

create table funcionarios (
id_funcionario int auto_increment not null,
nome_funcionario varchar(100) not null,
cpf_funcionario varchar(14) not null,
endereco varchar(100) not null,
celular varchar(19) not null,
salario decimal(5,2) not null,
data_nascimento datetime not null,
primary key (id_funcionario)
);

create table departamentos (
id_departamento int auto_increment not null,
nome_departamento varchar(100) not null,
responsavel varchar(100) not null,
setor varchar(50) not null,
primary key (id_departamento)
);

create table pertence (
id_pertence int primary key auto_increment,
id_funcionario int not null,
id_departamento int not null,
foreign key (id_funcionario) references funcionarios (id_funcionario),
foreign key (id_departamento) references departamentos (id_departamento)
);