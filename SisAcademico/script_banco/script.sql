
-- Durante a aula criamos o seguinte banco com estes parâmetros:
-- Nome do banco: SisAcademico_2manha
-- Usuário: uninove
-- Senha: Senha123


-- Tabela: CURSO
CREATE TABLE "tb_curso"
(
    "idCurso" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "nome_curso" VARCHAR(90) NOT NULL,
    "tipo_curso" VARCHAR(50)
);

-- Tabela: ALUNO
CREATE TABLE "tb_aluno"
(
    "idAluno" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "ra" INT NOT NULL,
    "nome" VARCHAR(100),
    "idCurso" INT,
    CONSTRAINT fk_aluno_curso FOREIGN KEY("idCurso")
    REFERENCES "tb_curso"
);
