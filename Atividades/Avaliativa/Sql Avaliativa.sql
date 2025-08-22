create database avaliativa;

use avaliativa;

create table fornecedor (
cod_fornecedor int auto_increment not null,
nome_fornecedor varchar(100) not null,
cidade_fornecedor varchar(100) not null,
status_fornecedor char(10) default "Ativo",
primary key (cod_fornecedor)
);

create table peca (
cod_peca int auto_increment not null,
nome_peca varchar(100) not null,
cor varchar(25) not null,
peso decimal not null,
cidade varchar(100) not null
);

create table instituicao (
cod_instituicao int auto_increment not null,
nome varchar(100) not null
);

create table projeto (
cod_projeto int auto_increment not null,
nome_projeto varchar(100) not null,
cidade_projeto varchar(100) not null,
foreign key (cod_instituicao) references instituicao (cod_instituicao)
);

create table fornecimento (
cod_fornecimento int auto_increment not null,
quantidade int not null,
foreign key (cod_fornecedor) references fornecedor (cod_fornecedor),
foreign key (cod_peca) references peca (cod_peca),
foreign key (cod_projeto) references projeto (cod_projeto)
);
