create database exercicio 11;
use exercicio 11;

create table funcionario(
idFunc int primary key,
nomeFunc varchar(30), 
salario decimal(8,2), 
sexo varchar(30), 
fkSupervisor int, 
dataNasc date, 
fkDepto int
);

create table departamento(
    idDepto int primary key, 
    nomeDepto varchar(45), 
    fkGerente varchar (45), 
    dataInicioGer date
 );

 create table projeto(
idProj int primary key, 
nomeProj varchar(45), 
localProj varchar(45), 
fkDepto int
);

create tabe FuncProj(
fkFunc int, 
fkProj int, 
horas decimal(3,1),
    primary key(fkFunc, fkProj)
    foreign key (fkFunc)
        references funcionario(idFunc),
    foreign key (fkProj)
        references projeto(idProj)
);

insert into departamento values
(105,'Pesquisa',2,'2008-05-22'),
(104,'Administração',7,'2015-01-01'),
(101,'Matriz',8,'2008-06-19');

insert into funcionario values
(1,'João Silva', 3500,00, 'm',2,'1985-01-09' 105),
(2,'Fernando Wong', 4500,00, 'm',8,'1975-12-08' 105),
(3,'Alice Souza', 2500,00, 'f',7,'1988-01-19' 104),
(4,'Janice Morais', 4300,00, 'f',8,'1970-06-20' 104),
(5,'Ronaldo Lima', 3800,00, 'm',1,'1982-09-15' 105),
(6,'Joice Leite', 2500,00, 'f',1,'1992-07-31' 105),
(7,'Antonio Pereira',2500,00, 'm',4,'1989-03-29' 105),
(8,'Julio Brito', 5500,00, 'm',null,'1957-11-10' 101)


alter table departamento 
add foreign key (fkGerente) 
references funcionario(idFunc);

alter table funcionario
add foreign key (fkSupervisor) 
references funcionario(idFunc);

alter table funcionario
add foreign key (fkDepto) 
references departamento(idDept);

alter table projeto
add foreign key (fkDepto) 
references departamento(idDept);

