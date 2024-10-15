# Slides atividades 02
# inserir dados
USE clinica;
INSERT INTO Funcionarios(codf, nome, idade, cidade, salario, cpf) 
	VALUES(
		6, "Carlos", 44, "Joinville", 1200, "30120120231"
	);
    
# insert data in "Ambulatorio" table
INSERT INTO Ambulatorios(nroa, andar, capacidade) 
	VALUES(
        5,2,55
    );
    
# insert patients in "Pacientes" table
INSERT INTO Pacientes(codp, nome, idade, cidade, cpf)
	VALUES(
		4, "Carlos", 28, "Joinville", "11000110000"
    );
    
# insert doctors in "Medicos" table
INSERT INTO Medicos(codm, nome, idade, especialidade, cidade, cpf, nroa) 
	VALUES(
		5, "Marcia", 33, "neurologia", "Biguacu", "11000111000", 3
    );
    
# insert consults in "Consultas" table
INSERT INTO Consultas(codm, codp, data, hora, doenca)
	VALUES(
		4,4,"2024-06-22", "19:30:00","dengue"
    );
    
ALTER TABLE Consultas
	DROP constraint consultPeriod;

ALTER TABLE
    
# Create missing column
ALTER TABLE Consultas 
	ADD COLUMN codp
	INT NOT NULL; 
    
# Add a FK to it
ALTER TABLE Consultas 
	ADD FOREIGN KEY Consultas(codp) REFERENCES Pacientes(codp);
    
# update the record "codp" column "Cidade" to "Ilhota"
SELECT * FROM PACIENTES WHERE codp=2;
UPDATE PACIENTES 
	SET cidade = "Ilhota"
    WHERE codp=2;

# Update "Consultas"
UPDATE CONSULTAS
	SET data="2024-07-04"
    # SET hora="12:00:00"
    WHERE codp=4 AND codm=1;
    
# Increase +1 in the age of patient code 1
UPDATE PACIENTES 
	SET idade=idade+1
    WHERE codp=1;
    
#Slide 2 (letter D) Add 01:30:00 to the original hour
UPDATE CONSULTAS 
	SET hora=hora+"01:30:00"
    WHERE codm=3 AND codp=4;
    
# Delete codf=6 from "FUNCIONARIOS"
DELETE FROM FUNCIONARIOS WHERE codf=6;

SET SQL_SAFE_UPDATES = 0;

# Remove all appointments after 19:00:00
DELETE FROM CONSULTAS
		WHERE hora > '19:00:00';

# command to be safe
SET SQL_SAFE_UPDATES = 1;
        
# Deactivate doctors who live in Biguacu or Joinville
UPDATE MEDICOS
	SET ativo=0
    WHERE cidade='Biguacu' OR cidade='Joinville';
    
UPDATE MEDICOS
	SET nome='Maria Dantas'
    where nome='Maria';
    
select * from medicos;