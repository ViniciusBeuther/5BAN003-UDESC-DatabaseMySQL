# Questions for class 07
USE clinica;
# 1. a) query to search doctors who are younger than 40 yo and aren't orthopedist
SELECT nome, CPF FROM medicos
	WHERE idade < 40 or especialidade != 'ortopedia';

# b) Search all data about the scheduled in the afternoon (between 12-18) after 06/18/2024
SELECT * from consultas
	WHERE 12 > hora < 18 and data > '2024-06-18';

# c) search the name and age of the patients who don't live in Florianopolis
SELECT nome, idade FROM pacientes
	where cidade != 'Florianopolis';

# d) Search the date and hour from appointments scheduled before than 2024-06-13 and after than 2024-06-19
SELECT data, hora from consultas
	WHERE  data < '2024-06-13' or data > '2024-06-19';

# e) Search the name and age (in months) from patients 
SELECT nome, (idade * 12) as 'Meses de Vida' from pacientes;

# f) Search the smaller and bigger employees' salary that work in Florianopolis
select max(salario) as 'Maior Salario', min(salario) as 'Menor Salario' from funcionarios;

# g) What is the last appointment scheduled for 2024-06-14?
select max(hora) as 'Ultimo Horario' from consultas;

# h) What's the age's average from the doctors and what's the total of ambulatories conducted by them
select avg(idade) as 'Idade Media' from medicos
	union
select count(*) as 'Total de Ambulatorios' from ambulatorios;

# i) Search the code, name and liquid salary from the employees that receives more than $1200. For those who earns more than $1200, there is a discount of 12% from the base salary
select codf as 'Codigo Funcionario', nome, (salario * 0.88) as 'Salario Liquido' from funcionarios
	where salario > 1200
    union
select codf as 'Codigo Funcionario', nome, (salario) as 'Salario Liquido' from funcionarios
	where salario < 1200;
    
# j) Search the all employee's name that ends with 'a'
select nome as 'Nomes que terminam com A' from funcionarios
	where nome like '%a';
    
# k) Search the name and age from the employees that have the number 6 in ther ID number
select nome, idade from funcionarios
	where CPF like '%6%';

# l) In which cities the doctors and employees lives? Show the name and city (in this order)
select nome, cidade from funcionarios 
	union
select nome, cidade from medicos
	order by cidade, nome;
