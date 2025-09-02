-- 1. Listar todos os alunos matriculados
SELECT * 
FROM alunos
WHERE matriculado = TRUE;

-- 2. Mostrar nome e idade dos alunos em ordem alfabética
SELECT nome, idade 
FROM alunos
ORDER BY nome ASC;

-- 3. Média de notas de cada aluno
SELECT a.nome, ROUND(AVG(n.nota), 2) AS media
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.nome
ORDER BY media DESC;

-- 4. Alunos com mais de 5 faltas no total
SELECT a.nome, SUM(n.faltas) AS total_faltas
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.nome
HAVING SUM(n.faltas) > 5
ORDER BY total_faltas DESC;

-- 5. Ranking dos 5 melhores alunos por média
SELECT a.nome, ROUND(AVG(n.nota), 2) AS media
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.nome
ORDER BY media DESC
LIMIT 5;

-- 6. Notas dos alunos em Matemática
SELECT a.nome, n.nota
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
JOIN materias m ON m.id = n.materia_id
WHERE m.nome = 'Matemática'
ORDER BY n.nota DESC;

-- 7. Número de alunos cadastrados
SELECT COUNT(*) AS total_alunos
FROM alunos;

-- 8. Média de nota por disciplina
SELECT m.nome AS materia, ROUND(AVG(n.nota), 2) AS media
FROM materias m
JOIN notas n ON m.id = n.materia_id
GROUP BY m.nome
ORDER BY media DESC;

-- 9. Alunos reprovados (média < 6)
SELECT a.nome, ROUND(AVG(n.nota), 2) AS media
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.nome
HAVING AVG(n.nota) < 6
ORDER BY media ASC;

-- 10. Top 3 matérias com mais faltas
SELECT m.nome, SUM(n.faltas) AS total_faltas
FROM materias m
JOIN notas n ON m.id = n.materia_id
GROUP BY m.nome
ORDER BY total_faltas DESC
LIMIT 3;
