CREATE DATABASE escola;

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    matriculado BOOLEAN
);

CREATE TABLE materias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE notas (
    id SERIAL PRIMARY KEY,
    aluno_id INT REFERENCES alunos(id),
    materia_id INT REFERENCES materias(id),
    nota DECIMAL(4,2),
    faltas INT
);