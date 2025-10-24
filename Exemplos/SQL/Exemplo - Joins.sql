create database joins;
use joins;

create table cliente (
codcli char(3) not null primary key,
nome varchar(40) not null,
endereco varchar(50) not null,
cidade varchar(20) not null,
estado char(2) not null,
cep char(9) not null
);

create table venda (
duplic char(6) not null primary key,
valor decimal(10,2) not null,
vencto date not null,
codcli char(3) not null,
foreign key (codcli) references cliente (codcli)
);

-- clientes

insert into cliente values (
'250',
'BANCO BARCA S/A',
'R. VITO, 34',
'SAO SEBASTIAO',
'CE',
'62380-000'
);

insert into cliente values (
'820',
'MECANICA SAO PAULO',
'R. DO MACUCO, 99',
'SANTO ANTONIO',
'ES',
'29810-020'
);

insert into cliente values (
'170',
'POSTO BRASIL LTDA.',
'AV. IMPERIO, 85',
'GUAGIRUS',
'BA',
'42837-000'
);

-- vendas

insert into venda values (
'230001',
1300.00,
'2001-06-10',
'250'
);

insert into venda values (
'230099',
1000.00,
'2002-10-02',
'820'
);

insert into venda values (
'997818',
3000.00,
'2001-11-11',
'170'
);

-- consultas
-- nome cliente e duplic

select cliente.nome, venda.duplic
from cliente, venda
where cliente.codcli = venda.codcli;

-- consulta com inner join

select venda.duplic, cliente.nome, cliente.cidade
from cliente inner join venda
on cliente.codcli = venda.codcli
order by cliente.nome;

select cliente.nome, count(*) as qtde
from cliente inner join venda
on cliente.codcli = venda.codcli
group by cliente.nome;

select cliente.nome, sum(venda.valor) as soma
from cliente inner join venda
on cliente.codcli = venda.codcli
group by cliente.nome;

select cliente.nome, venda.duplic, max(venda.valor) as maior_venda
from cliente inner join venda
on cliente.codcli = venda.codcli
group by venda.duplic;

select cliente.nome, venda.duplic, min(venda.valor) as menor_venda
from cliente inner join venda
on cliente.codcli = venda.codcli
group by venda.duplic;

-- tabela nova para uso de inner join, left e right

create table ex (
nome varchar(100)
);

create table fx (
nome varchar(100)
);

insert into ex values ("Bruno");
insert into ex values ("Fernando");
insert into ex values ("Bianca");
insert into ex values ("Luis");
insert into ex values ("Gabriel");

insert into fx values ("Daniel");
insert into fx values ("Gustavo");
insert into fx values ("Matheus");
insert into fx values ("Bruno");
insert into fx values ("Otavio");

select fx.nome, ex.nome as duplicado
from fx inner join ex
on fx.nome = ex.nome;

select ex.nome, fx.nome
from ex as ex
left join fx as fx
on ex.nome = fx.nome;

-- junta o left e right

select ex.nome, fx.nome
from ex as ex
left join fx as fx
on ex.nome = fx.nome


union

select ex.nome, fx.nome
from ex as ex
right join fx as fx
on ex.nome = fx.nome;

select cliente.nome, venda.vencto as vencimento
from cliente inner join venda
on cliente.codcli = venda.codcli
where year(venda.vencto) = 2002 and month(venda.vencto) = 10
order by venda.vencto;