create database somativa1;
use somativa1;

CREATE TABLE Alunos (
id_aluno int auto_increment not null primary key PRIMARY KEY,
data_nascimento date not null,
email varchar(100) not null,
nome varchar(100) not null
);

CREATE TABLE Cursos (
id_curso int auto_increment not null primary key PRIMARY KEY,
titulo varchar(100) not null,
descricao varchar(100) not null,
carga_horario int not null,
status_curso varchar(100) default 'Ativo' 
);

CREATE TABLE Inscricoes (
id_inscricao int auto_increment not null primary key PRIMARY KEY,
data_inscricao date not null,
id_aluno int not null,
id_curso int not null ,
FOREIGN KEY(id_aluno) REFERENCES Alunos (id_aluno),
FOREIGN KEY(id_curso) REFERENCES Cursos (id_curso)
);

CREATE TABLE Avaliacoes (
id_avaliacao int auto_increment not null primary key PRIMARY KEY,
comentario  varchar(100) not null,
nota  decimal not null,
id_inscricao int not null,
FOREIGN KEY(id_inscricao) REFERENCES Inscricoes (id_inscricao)
);

-- Parte 3 - Inserção de Dados --

insert into alunos (data_nascimento, email, nome) values ('2008-08-21', 'brunao224@gmail.com', 'Bruno');
insert into alunos (data_nascimento, email, nome) values ('2007-10-19', 'gasoares@gmail.com', 'Gabriel');
insert into alunos (data_nascimento, email, nome) values ('2007-09-12', 'malamus@gmail.com', 'Matheus');
insert into alunos (data_nascimento, email, nome) values ('2006-05-20', 'joael@gmail.com', 'Joel');
insert into alunos (data_nascimento, email, nome) values ('2008-08-03', 'Jeffbezos@gmail.com', 'Jefferson');

select * from alunos;

insert into cursos (titulo, descricao, carga_horario) values ('Mecânica', 'Curso de Mecânica', 88);
insert into cursos (titulo, descricao, carga_horario) values ('Elétrica', 'Curso de Elétrica', 9);
insert into cursos (titulo, descricao, carga_horario, status_curso) values ('Culinária', 'Curso de Culinária', 5, 'Inativo');
insert into cursos (titulo, descricao, carga_horario) values ('Soldagem', 'Curso de Soldagem', 5);
insert into cursos (titulo, descricao, carga_horario) values ('Robótica', 'Curso de Robótica', 10);

select * from cursos;

insert into inscricoes (data_inscricao, id_aluno, id_curso) values ('2025-04-19', 1, 1);
insert into inscricoes (data_inscricao, id_aluno, id_curso) values ('2025-03-22', 2, 2);
insert into inscricoes (data_inscricao, id_aluno, id_curso) values ('2024-07-18', 3, 3);
insert into inscricoes (data_inscricao, id_aluno, id_curso) values ('2025-01-22', 4, 4);
insert into inscricoes (data_inscricao, id_aluno, id_curso) values ('2023-04-18', 5, 5);

select * from inscricoes;

insert into avaliacoes (comentario, nota, id_inscricao) values ('Ótimo!', 10, 1);
insert into avaliacoes (comentario, nota, id_inscricao) values ('Péssimo!', 1, 3);
insert into avaliacoes (comentario, nota, id_inscricao) values ('Bom', 6, 4);

select * from avaliacoes;

-- Parte 4 - Atualização de Dados --

-- Atualizar email de um aluno --
update alunos set email = 'jeff@gmail.com' where nome = 'Jefferson';

-- Alterar carga horária de um curso --
update cursos set carga_horario = 6 where titulo = 'Mecânica';

-- Corrigir nome de aluno --
update alunos set nome = 'Bruninho' where nome = 'Bruno';

-- Mudar status de curso --
update cursos set status_curso = 'Inativo' where titulo = 'Soldagem';

-- Alterar nota de uma avaliação --
update avaliacoes set nota = 3 where id_inscricao = 3;

-- Parte 5 - Exclusão de Dados --

-- Excluir uma inscrição --
delete from inscricoes where id_curso = 1;

-- Excluir um curso --
delete from cursos where titulo = 'Robótica';

-- Excluir uma avaliação ofensiva --
delete from avaliacoes where comentario = 'Péssimo!';

-- Excluir um aluno --
delete from alunos where nome = 'Gabriel';

-- Excluir todas inscrições de um curso encerrado --
delete from inscricoes where id_curso = 3 and 4;

-- Parte 6 - Consultas com Critérios e Agrupamentos --

-- 1. Listar todos os alunos cadastrados --
select * from alunos;

-- 2. Exibir apenas os nomes e e-mails dos alunos --
select nome, email from alunos;

-- 3. Listar cursos com carga horária maior que 30 horas --
select * from cursos where carga_horario > 30;

-- 4. Exibir cursos que estão inativos --
select * from cursos where status_curso = 'Inativo';

-- 5. Buscar alunos nascidos após o ano 1995 --
select * from alunos where data_nascimento > 1995-01-01;

-- 6. Exibir avaliações com nota acima de 9 --
select * from avaliacoes where nota > 9;

-- 7. Contar quantos cursos estão cadastrados --
select count(*) as id_cursos from cursos;

-- 8. Listar os 3 cursos com maior carga horária --
select carga_horario from cursos order by carga_horario desc limit 3;

-- Parte 7 — Desafios Extras --

-- Criar índice para busca rápida por email de aluno --
create index Index_email on alunos (email);
show index from alunos;