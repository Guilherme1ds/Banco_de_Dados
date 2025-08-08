create database loja_limpeza;

use loja_limpeza;

create table produtos (
cod_produto int,
nome_produto varchar(100),
preco_produto decimal,
imagem blob,
descricao varchar(255)
);

create table pedidos (
cod_pedido int,
nome_cliente varchar(100),
nome_produto varchar(100),
valor_pedido decimal,
observacao text
);

create table estoque (
cod_estoque int,
local_estoque varchar(100),
quantidade int,
nome_produto varchar(100),
observacao text
);

create table funcionarios (
cod_funcionario int,
nome_funcionario varchar(100),
cpf varchar(14),
data_nasc date,
salario decimal
);

create table clientes (
cod_cliente int,
nome_cliente varchar(100),
cpf varchar(14),
data_nasc date,
endereco varchar(100)
);