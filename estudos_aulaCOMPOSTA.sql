create database aula10 ;
use aula10;

create table funcionario (
idFunc int primary key auto_increment,  -- identificador
nome varchar(50), -- simples
cep char(9), -- cep+numero+complemento=composto(de endereço)
numEnd int,
telCelular varchar(45),
telFixo varchar(45)

);

insert into funcionario values
(default, 'picapau', '02851000',146, '11 982763564', '873647589' ),
(default, 'papai', '09283777', 998, '11 0984080009', '234563565');

create table dependente(
idDep int ,
fkFunc int,
	constraint pkDep_func 
    primary key(idDep,fkFunc),
nome varchar (50),
	CONSTRAINT func_dep
    FOREIGN KEY (fkFunc)
    REFERENCES funcionario(idFunc)
);


insert into dependente values
('1','2','mamae'),
('1','1','leoncio'),
('2','1','zeca');

select funcionario.nome, dependente.nome from
	funcionario join dependente
    on funcionario.idFunc=dependente.fkFunc ;
    
