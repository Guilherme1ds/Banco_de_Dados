CREATE DATABASE Oficina;

USE Oficina;

CREATE TABLE Mecanicos (
cpf_mecanico varchar(14) not null,
data_nasc_mec date not null,
endereco_mec varchar(100) not null,
nome_mec varchar(100) not null,
id_mecanico int auto_increment PRIMARY KEY
);

CREATE TABLE Pecas (
categoria varchar(100) not null,
quantidade int not null,
preco_peca decimal(8,2) not null,
id_peca int auto_increment PRIMARY KEY,
nome_peca varchar(100) not null,
descricao_peca varchar(100) not null
);

CREATE TABLE Clientes (
nome_cliente varchar(100) not null,
id_cliente int auto_increment PRIMARY KEY,
data_nasc date not null,
cpf_cliente varchar(14) not null,
endereco_cliente varchar(100) not null
);

CREATE TABLE Veiculos (
modelo varchar(100) not null,
marca varchar(100) not null,
ano int not null,
cor varchar(100) not null,
id_veiculo int auto_increment PRIMARY KEY
);

CREATE TABLE Servico (
id_servico int auto_increment PRIMARY KEY,
descricao_servico varchar(100),
nome_servico varchar(100) not null,
preco_servico decimal(8,2) not null,
tipo_servico varchar(100) not null
);

CREATE TABLE OS (
prazo_inicial date not null,
descricao varchar(100) not null,
preco_os decimal(5,2) not null,
id_os int auto_increment PRIMARY KEY,
prazo_final date not null,
id_veiculo int,
id_cliente int,
id_mecanico int,
id_peca int,
id_servico int,
FOREIGN KEY(id_mecanico) REFERENCES Mecanicos (id_mecanico),
FOREIGN KEY(id_peca) REFERENCES Pecas (id_peca),
FOREIGN KEY(id_veiculo) REFERENCES Veiculos (id_veiculo),
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente),
FOREIGN KEY(id_servico) REFERENCES Servico (id_servico)
);

CREATE TABLE possuem (
id_cliente int,
id_veiculo int,
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente),
FOREIGN KEY(id_veiculo) REFERENCES Veiculos (id_veiculo)
);

INSERT INTO Mecanicos (cpf_mecanico, data_nasc_mec, endereco_mec, nome_mec)
VALUES ('123.456.789-00', '1985-04-12', 'Rua Alfa, 123', 'Carlos Mecânico');

SELECT * FROM Mecanicos;

INSERT INTO Pecas (categoria, quantidade, preco_peca, nome_peca, descricao_peca)
VALUES ('Motor', 10, 350.90, 'Filtro de Óleo', 'Filtro lubrificante para motor');

SELECT * FROM Pecas;

INSERT INTO Clientes (nome_cliente, data_nasc, cpf_cliente, endereco_cliente)
VALUES ('João Silva', '1990-09-15', '987.654.321-00', 'Av. Brasil, 500');

SELECT * FROM Clientes;

INSERT INTO Veiculos (modelo, marca, ano, cor)
VALUES ('K', 'Ford', '2020', 'Vermelho');
INSERT INTO Veiculos (modelo, marca, ano, cor)
VALUES ('Civic', 'Honda', 2018, 'Prata');

SELECT * FROM Veiculos;

INSERT INTO Servico (descricao_servico, nome_servico, preco_servico, tipo_servico)
VALUES ('Troca completa do óleo do motor', 'Troca de Óleo', 120.00, 'Manutenção');

SELECT * FROM Servico;

INSERT INTO OS (prazo_inicial, descricao, preco_os, prazo_final, id_veiculo, id_cliente, id_mecanico, id_peca, id_servico)
VALUES ('2025-01-10', 'Revisão completa do veículo', 480.00, '2025-01-12', 1, 1, 1, 1, 1);
INSERT INTO OS (prazo_inicial, descricao, preco_os, prazo_final, id_veiculo, id_cliente, id_mecanico, id_peca, id_servico)
VALUES ('2025-11-25', 'Verificação e reparo de freios', 550.50, '2025-11-28', 2, 2, 2, 2, 2);

SELECT * FROM OS;

INSERT INTO possuem (id_cliente, id_veiculo)
VALUES (1, 1);

SELECT * FROM possuem;

-- Atividade --

-- 1. SELECT
-- Selecione todos os veículos cadastrados que são da marca "Ford"
SELECT * FROM Veiculos WHERE marca = "Ford";

-- Liste todos os clientes que abriram uma Ordem de Serviço (OS) nos últimos 6 meses
SELECT DISTINCT
    C.nome_cliente
FROM
    Clientes C
JOIN
    OS ON C.id_cliente = OS.id_cliente
WHERE
    OS.prazo_inicial >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);