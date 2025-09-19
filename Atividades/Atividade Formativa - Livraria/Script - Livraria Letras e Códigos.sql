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

ALTER TABLE Livros
MODIFY Preco decimal (7,2) not null;


INSERT INTO Autores (Cod_Autor, DataNasc_Autor, Nome_Autor, Nacionalidade) 
VALUES 
(1, '1980-05-12', 'J.K. Rowling', 'Britânica'),
(2, '1965-02-15', 'George R.R. Martin', 'Americana'),
(3, '1974-11-22', 'Suzanne Collins', 'Americana');

SELECT * FROM Autores;

INSERT INTO Editoras (Cod_Editora, Cidade, Nome_Editora, Contato, Tele_Editora, Endereço, CNPJ) 
VALUES 
(1, 'São Paulo', 'Editora Globo', 'atendimento@editoraglobo.com.br', '(11) 1234-5678', 'Av. Paulista, 1000', '12345678000190'),
(2, 'Rio de Janeiro', 'Editora Record', 'contato@editorarecord.com.br', '(21) 2345-6789', 'Rua da Carioca, 500', '9876432000100'),
(3, 'Belo Horizonte', 'Editora Intrínseca', 'sac@editoraintrinseca.com.br', '(31) 3456-7890', 'Av. Afonso Pena, 700', '34567890000111');

SELECT * FROM Editoras;

INSERT INTO Livros (Cod_Livro, Genero, Editora, Autor, Titulo, Quantidade, Preco) 
VALUES 
(1, 'Fantasia', 'Editora Globo', 'J.K. Rowling', 'Harry Potter e a Pedra Filosofal', 100, 39.90),
(2, 'Fantasia', 'Editora Record', 'George R.R. Martin', 'A Guerra dos Tronos', 50, 49.90),
(3, 'Ficção Científica', 'Editora Intrínseca', 'Suzanne Collins', 'Jogos Vorazes', 75, 29.90);

SELECT * FROM Livros;

INSERT INTO Clientes (Cod_Cliente, Email, CPF, DataNasc_Cliente, Tele_Cliente, Nome_Cliente) 
VALUES 
(1, 'jose.silva@gmail.com', '123.456.789-00', '1985-03-20', '(11) 9876-5432', 'José Silva'),
(2, 'maria.oliveira@hotmail.com', '234.567.890-11', '1990-08-10', '(21) 8765-4321', 'Maria Oliveira'),
(3, 'paulo.santos@yahoo.com', '345.678.901-22', '1982-12-30', '(31) 7654-3210', 'Paulo Santos');

SELECT * FROM Clientes;

INSERT INTO Vendas (Valor_Total, Data_Venda, Cod_Cliente, Cod_Livro) 
VALUES 
(39.90, '2025-09-15 10:30:00', 1, 1),
(49.90, '2025-09-16 15:45:00', 2, 2),
(29.90, '2025-09-17 11:00:00', 3, 3);

SELECT * FROM Vendas;

-- CONSULTAS
-- TODOS OS VALORES
SELECT * FROM Livros;

-- CONSULTA POR TITULO E ANO
SELECT Titulo, Preco
FROM Livros
WHERE Preco > 40.00;

-- CONSULTAS POR TITULO E PREÇO EM ORDEM DECRESCENTE
SELECT Titulo, Preco
FROM Livros
ORDER BY Preco DESC;

-- LIMITAR CONSULTAS POR VALOR DE QUANTIDADE APRESENTADAS
SELECT Titulo FROM Livros
LIMIT 5;

-- RENOMEAR COLUNAS COM AS
SELECT Titulo AS Nome, Preco AS Preco
FROM Livros;

-- CONSULTAS AGREGADAS
SELECT COUNT(*) AS Quantidade
FROM Livros;

-- CONSULTA COM JOINS
SELECT Livros.Titulo, Autores.Nome_Autor FROM Livros
JOIN Autores ON Livros.Cod_Livro = Autores.Cod_Autor;

-- CONSULTA POR AGRUPAMENTOS GROUP BY
SELECT Titulo, COUNT(*) AS Quantidade
FROM Livros
GROUP BY Titulo;