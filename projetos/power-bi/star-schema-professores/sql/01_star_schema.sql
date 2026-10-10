CREATE DATABASE IF NOT EXISTS universidade_dw;
USE universidade_dw;

CREATE TABLE D_Professor (
    ProfessorKey INT PRIMARY KEY,
    ProfessorID INT NOT NULL,
    ProfessorNome VARCHAR(100) NOT NULL,
    Titulacao VARCHAR(40),
    Coordenador VARCHAR(3)
);

CREATE TABLE D_Departamento (
    DepartamentoKey INT PRIMARY KEY,
    DepartamentoID INT NOT NULL,
    DepartamentoNome VARCHAR(100) NOT NULL,
    Campus VARCHAR(80)
);

CREATE TABLE D_Curso (
    CursoKey INT PRIMARY KEY,
    CursoID INT NOT NULL,
    CursoNome VARCHAR(120) NOT NULL,
    Nivel VARCHAR(40)
);

CREATE TABLE D_Disciplina (
    DisciplinaKey INT PRIMARY KEY,
    DisciplinaID INT NOT NULL,
    DisciplinaNome VARCHAR(120) NOT NULL,
    AreaConhecimento VARCHAR(80)
);

CREATE TABLE D_Calendario (
    DataKey INT PRIMARY KEY,
    Data DATE NOT NULL,
    Ano SMALLINT NOT NULL,
    Semestre TINYINT NOT NULL,
    MesNumero TINYINT NOT NULL,
    Mes VARCHAR(20) NOT NULL,
    AnoMes CHAR(7) NOT NULL
);

CREATE TABLE F_OfertaProfessor (
    OfertaKey INT PRIMARY KEY,
    ProfessorKey INT NOT NULL,
    DepartamentoKey INT NOT NULL,
    CursoKey INT NOT NULL,
    DisciplinaKey INT NOT NULL,
    DataKey INT NOT NULL,
    CargaHoraria DECIMAL(8,2) NOT NULL,
    NumeroTurmas INT NOT NULL,
    AlunosMatriculados INT NOT NULL,
    CONSTRAINT FK_Fato_Professor FOREIGN KEY (ProfessorKey) REFERENCES D_Professor(ProfessorKey),
    CONSTRAINT FK_Fato_Departamento FOREIGN KEY (DepartamentoKey) REFERENCES D_Departamento(DepartamentoKey),
    CONSTRAINT FK_Fato_Curso FOREIGN KEY (CursoKey) REFERENCES D_Curso(CursoKey),
    CONSTRAINT FK_Fato_Disciplina FOREIGN KEY (DisciplinaKey) REFERENCES D_Disciplina(DisciplinaKey),
    CONSTRAINT FK_Fato_Calendario FOREIGN KEY (DataKey) REFERENCES D_Calendario(DataKey)
);
