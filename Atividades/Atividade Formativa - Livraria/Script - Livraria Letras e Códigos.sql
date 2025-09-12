CREATE DATABASE Livraria;
USE Livraria;
SELECT database();

CREATE TABLE Livros (
Cod_Livro int auto_increment not null PRIMARY KEY,
Genero varchar(100) not null,
Editora varchar(100) not null,
Autor varchar(100) not null,
Titulo varchar(100) not null,
Quantidade int not null,
Preco decimal (3,2) not null
);

CREATE TABLE Autores (
Cod_Autor int auto_increment not null PRIMARY KEY,
DataNasc_Autor datetime,
Nome_Autor varchar(100) not null,
Nacionalidade varchar(100) 
);

CREATE TABLE Editoras (
Cod_Editora int auto_increment not null PRIMARY KEY,
Cidade varchar(100) not null,
Nome_Editora varchar(100) not null,
Contato varchar(100) not null,
Tele_Editora varchar(14) not null,
Endereço varchar(100) not null,
CNPJ varchar(14) not null
);

CREATE TABLE Clientes (
Cod_Cliente  int auto_increment not null PRIMARY KEY,
Email varchar(100) not null,
CPF varchar(14) not null,
DataNasc_Cliente datetime not null,
Tele_Cliente varchar(14) not null,
Nome_Cliente varchar(100) not null
);

CREATE TABLE Vendas (
Cod_Venda int auto_increment not null PRIMARY KEY,
Valor_Total decimal not null,
Data_Venda datetime not null,
Cod_Cliente  int not null,
Cod_Livro int not null,
FOREIGN KEY(Cod_Cliente ) REFERENCES Clientes (Cod_Cliente),
FOREIGN KEY(Cod_Livro) REFERENCES Livros (Cod_Livro)
);

