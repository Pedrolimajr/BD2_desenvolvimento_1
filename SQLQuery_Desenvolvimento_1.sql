CREATE DATABASE CURSO
GO

USE CURSO

CREATE TABLE alunos(
id_aluno INT PRIMARY KEY NOT NULL,
nome VARCHAR(30) NOT NULL,
data_nascimento DATE NOT NULL,
sexo VARCHAR(1) NOT NULL,
data_cadastro DATE NOT NULL
);

INSERT INTO alunos 
(id_aluno, nome, data_nascimento, sexo, data_cadastro)
VALUES
(1, 'Jão Carlos', '04/09/2000', 'M', '20/10/2023')

SELECT * FROM alunos

CREATE TABLE cursos(
id_curso INT PRIMARY KEY NOT NULL,
nome_curso VARCHAR(200) NOT NULL,
data_cadastro DATETIME NOT NULL
);

INSERT INTO cursos
(id_curso, nome_curso, data_cadastro)
VALUES
(20, 'Banco de Dados', '04/09/2023 15:00:00')

SELECT * FROM cursos


CREATE TABLE situacao(
id_situacao INT PRIMARY KEY NOT NULL,
situacao VARCHAR(25) NOT NULL,
);


INSERT INTO situacao
(id_situacao, situacao)
VALUES
(1, 'Em dias')

CREATE TABLE turmas(
id_turma INT PRIMARY KEY NOT NULL,
id_aluno INT NOT NULL,
id_curso INT NOT NULL,
nome_curso VARCHAR(30) NOT NULL
);

INSERT INTO turmas
(id_turma, id_aluno, id_curso, nome_curso)
VALUES
(13, 1, 20, 'Banco de Ddos')

CREATE TABLE registro_presenca(
id_turma INT NOT NULL,
id_aluno INT NOT NULL,
id_situacao INT PRIMARY KEY NOT NULL,
id_curso INT NOT NULL,
data_presenca DATE NOT NULL
);

INSERT INTO registro_presenca
(id_turma, id_aluno, id_situacao, id_curso, data_presenca)
VALUES
(13, 1, 1, 20, '30/03/2024')



ALTER TABLE turmas
ADD CONSTRAINT fk_turmas_alunos FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno);

ALTER TABLE turmas
ADD CONSTRAINT fk_turmas_cursos FOREIGN KEY (id_curso) REFERENCES cursos (id_curso);

ALTER TABLE registro_presenca
ADD CONSTRAINT fk_registroPresenca_cursos FOREIGN KEY (id_turma) REFERENCES turmas (id_turma);

ALTER TABLE registro_presenca
ADD CONSTRAINT fk_registroPresenca_alunos FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno);

ALTER TABLE registro_presenca
ADD CONSTRAINT fk_registroPresenca_situacao FOREIGN KEY (id_situacao) REFERENCES situacao (id_situacao);


SELECT c.id_curso, c.nome_curso, count(t.id_turma) Total_turmas FROM turmas t
INNER JOIN cursos c on c.id_curso = t.id_curso
group by c.id_curso, c.nome_curso 

