use prova;

# Questão 01 - Criação das tabelas
CREATE TABLE Usuarios(
	cpf DECIMAL(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dataCadastro DATE NOT NULL,
    telefone DECIMAL(11) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    multa DECIMAL(11) NOT NULL
);

CREATE TABLE Livros(
	idLivro INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    autores TEXT NOT NULL,
    paginas SMALLINT NOT NULL
);

CREATE TABLE Exemplares(
	idLivro INT NOT NULL,
    sequencia TINYINT NOT NULL PRIMARY KEY, 
    observacao TEXT,
    dataCompra DATE NOT NULL,
    CONSTRAINT fk_exemplares_idLivro FOREIGN KEY (idLivro)
		REFERENCES Livros(idLivro)
			ON DELETE CASCADE
            ON UPDATE CASCADE
);
	

CREATE TABLE Emprestimos(
	cpfUsuario DECIMAL(11) NOT NULL PRIMARY KEY,
    idLivro INT NOT NULL,
    sequencia TINYINT NOT NULL,
    dataEmprestimo DATE NOT NULL,
    dataDevolucao DATE,
    
    # adding foreign keys
    CONSTRAINT fk_cpfUsuario_cpf FOREIGN KEY (cpfUsuario) 
    REFERENCES Usuarios(cpf)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
        
	CONSTRAINT fk_emprestimo_IdLivro FOREIGN KEY (idLivro)
		REFERENCES Livros(idLivro)
			ON DELETE CASCADE
            ON UPDATE CASCADE,
            
	CONSTRAINT fk_sequenciaEmprestimo_SequenciaExemplares FOREIGN KEY (sequencia)
		REFERENCES Exemplares(sequencia)
			ON DELETE CASCADE
            ON UPDATE CASCADE
);

# QUestao 2
use prova;

## Tentativa frustrada
ALTER TABLE usuarios
	ALTER COLUMN endereco
		SET DATA TYPE VARCHAR(100);

# Atualizando na força bruta
ALTER TABLE usuarios
		DROP COLUMN endereco;

ALTER TABLE usuarios
	ADD COLUMN 
    endereco VARCHAR(100) NOT NULL;
		
# Questao 3
ALTER TABLE Emprestimos
		add constraint check_date 
        check (usuarios.`dataDevolucao` > usuarios.`dataEmprestimo`);
		

# Questao 4
CREATE USER 'operador'@'localhost'
	IDENTIFIED BY 'provaBan@2024';
    
GRANT SELECT, INSERT, UPDATE 
	ON prova.emprestimos
    TO 'operador'@'localhost';


# Questoes Base de DADOS Prova-Transporte
use `prova-transporte`;

# QUESTÃO 05
INSERT INTO passageiros(cpf, nome, idade, telefone, cpfResponsavel)
	VALUES (46005896330, 'Cloud Strife', 23, 4734113011, null);

select * from passageiros;

INSERT INTO bilhetes(cpfPassageiro, codTrecho, dataEmbarque, dataEmissao, preco, poltrona)
	VALUES(46005896330, 7, '2024-12-05', '2024-11-01', 125, 11);

select * from bilhetes where cpfPassageiro = 46005896330;
# QUESTÃO 06
select * from passageiros where nome = 'Lucas Andrade';
UPDATE bilhetes
	SET poltrona=12 
    WHERE cpfPassageiro = 53291764842;

select * from bilhetes where cpfPassageiro = 53291764842;


# QUESTÃO 7
select cpf, nome as 'Nome Completo', telefone, idade
	from passageiros 
    where idade > 18
    order by nome, idade;
    
# QUESTÃO 8
select t.codTrecho, e.nome as 'Nome empresa', lor.nome as 'Origem', ld.nome as 'Destino'
	from trechos as t
	join empresas as e on e.codEmpresa = t.codEmpresa
    join locais as lor on lor.idLocal = t.idOrigem
    join locais as ld on ld.idLocal = t.idDestino;


# QUESTÃO 9
delete p.* from     
	passageiros as p
    join bilhetes as b on p.cpf = b.cpfPassageiro
    where dataEmissao < '2024-01-01';

# QUESTAO 10
select SUM(b.preco) as 'Lucro primeiro sem 2024'
	from bilhetes as b
    join trechos as t on t.codTrecho = b.codTrecho
    join empresas as e on t.codEmpresa = (select codEmpresa from empresas where nome = 'Expresso Central')
    where b.dataEmissao >= '2024-01-01' and b.dataEmissao <= '2024-06-30';
    
# QUESTAO 11
select p.* 
	from passageiros as p
    join trechos as t on b.codTrecho = t.codTrecho 
    join empresas as e on e.codEmpresa = bt.codEmpresa
    join bilhetes as b on p.cpf = b.cpfPassageiro
    where b.codTrecho ALL();

    
    	