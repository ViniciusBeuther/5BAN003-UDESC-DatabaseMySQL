## PDF 7
use clinica;

# 1) a. Search name and CPF from the doctors, which also are registered as patient of the clinic
SELECT m.nome, m.cpf, m.codm, p.codp FROM medicos as m
JOIN pacientes as p on p.codp = m.codm;

# b. Search the employees/doctors names that lives in the same city, also it must show the city's name
SELECT f.nome as 'Nome funcionário', m.nome as 'Nome médico', m.cidade as 'Cidade'
from funcionarios as f
join medicos as m
where m.cidade = f.cidade;

# c. Search the code and patient name who have an appointment scheduled after 2:00 PM
SELECT p.codp, p.nome
from pacientes as p
join consultas as c
where c.codp = p.codp and c.hora > '14:00:00';

# d. Search the number and the floor of the ambulatories used by active orthopedist
select * from medicos;
select a.nroa, a.andar, a.capacidade as 'Capacidade da sala', m.nome as 'Nome do Médico Responsável'
from ambulatorios as a
join medicos as m
where m.nroa = a.nroa and m.especialidade = 'ortopedia' and m.ativo = 1;

# e. Get the name and CPF of the patient that have appointments scheduled between june 13 2024 - june 16 2024
select * from consultas;
select p.nome, p.CPF, c.data as 'Data da consulta', c.hora as 'Horário agendado' 
from pacientes as p
join consultas as c
where c.codp = p.codp and c.data >= '2024-07-13' and c.data <= '2024-07-16';


# f. Search the name and age from the doctor which have appointments with the patient "Ana"
SELECT c.codp, m.nome, m.idade
FROM consultas AS c
JOIN medicos AS m ON c.codm = m.codm
WHERE c.codp = (SELECT p.codp FROM pacientes AS p WHERE p.nome = 'Ana');