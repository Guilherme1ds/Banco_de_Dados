-- Criar Banco de Dados 
create database loja_informatica;

-- Ativar Banco de Dados
use loja_informatica;

create table produtos (
cod_produto int,
descricao varchar(255),
nome_produto varchar(100),
preco_produto decimal,
imagem blob
);

create table estoque (
cod_estoque int,
local_estoque varchar(100),
quantidade int,
nome_produto varchar(100),
observacao text
);

create table servicos (
cod_servico int,
tipo_servico varchar(100),
agendamento datetime,
valor_servico decimal,
observacao text
);

create table funcionarios (
cod_funcionario int,
nome_funcionario varchar(100),
data_nasc date,
cpf varchar(14),
salario decimal
);

create table clientes (
cod_cliente int,
nome_cliente varchar(100),
data_nasc date,
cpf varchar(14),
endereco varchar(100)
);