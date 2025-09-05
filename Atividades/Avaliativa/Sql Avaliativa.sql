create database avaliativa;

use avaliativa;

select database(); -- Seleciona e usa o banco de dados automaticamente

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
cidade varchar(100) not null,
primary key (cod_peca)
);

create table instituicao (
cod_instituicao int auto_increment not null,
nome varchar(100) not null,
primary key (cod_instituicao)
);

create table projeto (
cod_projeto int auto_increment not null,
nome_projeto varchar(100) not null,
cidade_projeto varchar(100) not null,
cod_instituicao int,
primary key (cod_projeto),
foreign key (cod_instituicao) references instituicao (cod_instituicao)
);

create table fornecimento (
cod_fornecimento int not null,
cod_projeto int not null,
cod_peca int not null,
cod_fornecedor int not null,
quantidade int primary key not null,
foreign key (cod_fornecedor) references fornecedor (cod_fornecedor),
foreign key (cod_peca) references peca (cod_peca),
foreign key (cod_projeto) references projeto (cod_projeto)
);

show tables;

-- INDEXES
create index idx_cod_instituicao on projeto(cod_instituicao);
create index idx_cod_fornecimento on projeto(cod_instituicao);
create index idx_cod_peca on projeto(cod_instituicao);
create index idx_cod_projeto on fornecimento(cod_instituicao);

use avaliativa;
select database();

-- Alterações (Parte 02)
show tables;
-- Consulta de  Tabelas
select fnome from fornecedor;
select * from peca;
select * from instituicao;
select * from projeto;
select * from fornecimento;

alter table fornecimento
drop foreign key fornecimento_ibfk_1;

alter table instituicao
drop column cod_instituicao;

-- Adiciona o campo primeiro
alter table fornecedor
add column cod_cidade int not null;

alter table fornecedor
drop column ccod;

-- adiciona em fk
alter table fornecedor
add constraint fk_ccod_fornecedor
foreign key (cod_cidade) references cidade (cod_cidade);

show create table fornecedor;

create table cidade (
cod_cidade int primary key auto_increment not null,
nome_cidade varchar(100) not null,
uf char(2) not null
);

-- Tabela Cidade
insert into cidade values (11, 'Limeira', 'SP');
insert into cidade values (12, 'Artur Nogueira', 'SP');
insert into cidade values (13, 'Engenheiro Coelho', 'SP');
insert into cidade values (14, 'Campinas', 'SP');

-- Verificar Último Valor Inserido de ID
select last_insert_id();

insert into fornecedor values (34, 'UOL', 'Guarulhos', 'Ativo', 11);
insert into fornecedor values (35, 'Ajinomoto', 'Limeira', 'Ativo', 12);

insert into peca values (41, 'Garrafa', 'Cinza', 47, 'Limeira');
insert into peca values (42, 'Bolsa', 'Preto', 1, 'São Paulo');

insert into instituicao values (21, 'Equipa Legal');
insert into instituicao values (22, 'Equipando');

insert into projeto values (51, 'Distribuiçâo Legal', 'Cosmópolis', 21);
insert into projeto values (52, 'Fazendo o Bem', 'Campinas', 22);

insert into fornecimento values (61, 51, 41, 34, 5);
insert into fornecimento values (62, 52, 42, 35, 9);