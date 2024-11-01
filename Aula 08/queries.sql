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


# g. Get the code and name from the doctors who work on the same ambulatory as doctor Pedro (using just these information)
select m.codm, m.nome, a.nroa as 'Andar de atendimento'
from medicos as m
join ambulatorios as a
where (select m.nroa from medicos as m where m.nome = 'Pedro') = a.nroa;


# h. Get the name, CPF and age of the patients who have orthopedist's appointments scheduled before 2024-06-21
 SELECT p.nome, p.CPF, p.idade
FROM pacientes AS p
JOIN consultas AS c ON p.codp = c.codp
JOIN medicos AS m ON c.codm = m.codm
WHERE c.data < '2024-06-21' 
  AND m.especialidade = 'ortopedista';
 
 # i. Get the name and salary from the employees that live in the same city that Denise and have a higher salary
 select f.nome, f.salario
 from funcionarios as f
 where f.salario > (select salario from funcionarios where nome='Denise')
 and f.cidade = (select cidade from funcionarios where nome='Denise');
 
 # j. Get the data from all ambulatories and for those where the doctors attend, show their names as well
 select a.*, m.nome
 from ambulatorios as a
 join medicos as m on a.nroa = m.nroa
 and m.ativo = 1;
 
 # k. For each appointment schedules, list the doctor name, the patient name, the date and hour and the ambulatory to be used.
select p.nome as 'Nome do Paciente', m.nome as 'Nome do Médico', c.data, c.hora, a.nroa as 'Numero do Ambulatorio'
from pacientes as p 
left join consultas as c on c.codp = p.codp
left join medicos as m on c.codm = m.codm
left join ambulatorios as a on m.nroa = a.nroa;