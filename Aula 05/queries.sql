/* Create tables */

USE clinica;

CREATE TABLE Ambulatorios(
	nroa INT PRIMARY KEY,
    andar decimal(3) NOT NULL
);

CREATE TABLE Medicos(
	codm INT,
	nome VARCHAR(50) NOT NULL,
    idade SMALLINT NOT NULL,
    especialidade CHAR(20),
    CPF DECIMAL(11) UNIQUE,
    cidade VARCHAR(30),
    nroa INT,
    PRIMARY KEY(codm)
);

CREATE TABLE Pacientes(
	codp INT,
    nome VARCHAR(40) NOT NULL,
    idade SMALLINT,
    CPF DECIMAL(11) UNIQUE, 
    doenca VARCHAR(40) NOT NULL,
    PRIMARY KEY (codp)
);

CREATE TABLE Funcionarios(
	codf INT,
    nome VARCHAR(40) NOT NULL,
    idade SMALLINT,
    CPF DECIMAL(11) UNIQUE,
    cidade VARCHAR(30) NOT NULL,
    salario DECIMAL(10), 
    cargo VARCHAR(20),
    PRIMARY KEY (codf)
);

CREATE TABLE Consultas(
    data DATE,
    hora TIME,
    codm INT,
    PRIMARY KEY (data, hora, codm),
    FOREIGN KEY (codm) REFERENCES Medicos(codm)
);

/* Queries to grant permission to users */
GRANT SELECT, INSERT, UPDATE, DELETE
	ON clinica.*
    TO 'clinica_suporte'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON clinica.consultas
    TO 'clinica_operador'@'%';
    
GRANT SELECT, INSERT, UPDATE
	ON clinica.pacientes
    TO 'clinica_operador'@'%';
    
GRANT SELECT 
	ON clinica.consultas
    TO 'clinica_consultas'@'localhost';
    
GRANT SELECT
	ON clinica.pacientes
    TO 'clinica_consultas'@'localhost';