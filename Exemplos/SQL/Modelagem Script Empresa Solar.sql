-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE Empresa_Solar;
USE Empresa_Solar;
SELECT DATABASE();


CREATE TABLE Clientes (
ID_Cliente int auto_increment not null PRIMARY KEY,
Nome_Cliente varchar(100) not null
);

CREATE TABLE Produtos (
ID_Produto int auto_increment not null PRIMARY KEY,
Nome_Produto varchar(100) not null
);

CREATE TABLE Compra (
ID_Compra int auto_increment PRIMARY KEY not null,
ID_Produto int,
ID_Cliente int,
FOREIGN KEY(ID_Produto) REFERENCES Produtos (ID_Produto),
FOREIGN KEY(ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

CREATE TABLE Vendedores (
Id_Vendedor int auto_increment PRIMARY KEY,
Nome_Vendedor varchar(100),
Salario decimal(5,2),
fsalarial char(1)
);

DROP TABLE Vendedor;

INSERT INTO Clientes (Nome_Cliente) VALUES ('Guilherme');
INSERT INTO Produtos VALUES (2,'Teclado');
INSERT INTO Vendedores (Nome_Vendedor, Salario, fsalarial) VALUES ('Bruno','5000.00',1);
INSERT INTO Vendedores (Nome_Vendedor, Salario, fsalarial) VALUES ('Roberto','5000.00',2);
INSERT INTO Vendedores (Nome_Vendedor, Salario, fsalarial) VALUES ('Amanda','5000.00',3);

ALTER TABLE Vendedores
MODIFY Salario decimal(10,2);

UPDATE Produtos SET Nome_Produto = 'Mouse'
WHERE ID_Produto = 2;

UPDATE Vendedores SET Salario = 3150
WHERE fsalarial = 1;

UPDATE Vendedores SET Salario = (Salario * 1.10)
WHERE fsalarial = 2;

UPDATE Vendedores SET Salario = 3500.00
WHERE fsalarial = 3;

UPDATE Vendedores SET Salario = 10000.00
WHERE Nome_Vendedor = 'Bruno';

SELECT * FROM Vendedores;

DELETE FROM Vendedores
WHERE Salario < 4000.00;

TRUNCATE TABLE Vendedores;

-- Autorizar Update em forma de Comando
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Produtos WHERE ID_Produto = 1;
DELETE FROM Clientes WHERE Nome_Cliente = 'Bruno';
DELETE FROM Vendedores WHERE Id_Vendedor>=1 AND Id_Vendedor<=10;
DELETE FROM Vendedores WHERE Id_Vendedor<=10 OR Id_Vendedor>=20;

DELETE FROM Clientes;

TRUNCATE TABLE Clientes;