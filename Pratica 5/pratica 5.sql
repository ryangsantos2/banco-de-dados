create database pratica5;
use pratica5;

create table Cliente(
idCliente int primary key auto_increment,
nome varchar(45),
telFixo varchar(45),
telCelular varchar(45),
cep char(8),
numEnd int,
complemento varchar(45)
);

insert into cliente values
(default,'Ryan Goncalves','39922796', '11 996738517', '09187666', '146', 'casa 1'),
(default,'Julia Goncalves','34238316', '11 982094875', '02851000', '4567', null),
(default,'Vinicius Tostes','387618729', '11 984085765', '09189222', '3', '5 andar');



create table pet (
idPet int auto_increment,
fkCliente int,
	constraint pfComposta
    primary key(idPet, fkCliente),
nome varchar(45),
raca varchar(45),
dtNasc date,
tipo varchar(45),
	constraint cliente_pet
    foreign key (fkCliente)
    references cliente(idCliente)
	
); 
   
alter table pet auto_increment = 101;

insert into pet values

(default,'1','Nina', 'Shin tzu', '2017-08-09', 'cachorro'),
(default,'2', 'Luke', 'Shin tzu', '2013-04-04', 'cachorro'),
(default, '2', 'Mel', 'pug', '2015-10-15', 'gato'),
(default, '3', 'Chico', 'pug', '2018-04-10', 'cachorro'),
(default, '1', 'Bolt', 'pit bull', '2020-08-08', 'gato');

select * from pet where tipo = 'gato';
select nome, dtNasc from pet;
select * from pet order by nome;
select * from cliente order by cep desc;
select * from pet where nome like 'l%';
select * from cliente where nome like '% Goncalves';


update cliente set telFixo = '40028922' where idCliente = 1;
select * from cliente;


select *
	from cliente 
    join pet
    on cliente.idCliente=pet.fkCliente;
    
    select *
	from cliente 
    join pet
    on cliente.idCliente=pet.fkCliente
    where Cliente.nome like 'Ryan%';
    
    delete from pet where idPet = 101 and fkCliente = 1;
    select * from pet; 
    
drop table pet; 
drop table cliente;

												-- ATIVIDADE 2
  
CREATE TABLE pessoa (
  idPessoa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) ,
  dtNasc VARCHAR(45) ,
  profissao VARCHAR(45)
  );


insert into pessoa values
(default,'Ryan', '2005-10-19', 'Desenvolvedor backend'),
(default,'Julia', '2005-06-27', 'Profissional em estética capilar'),
(default,'Vinicius', '2004-09-19', 'Biologo'),
(default,'Rayssa', '2010-09-10', 'Medica veterinaria');


CREATE TABLE gasto (
  idGasto INT AUTO_INCREMENT,
  fkPessoa INT,
	CONSTRAINT pkPessoaGasto
    PRIMARY KEY (idGasto, fkPessoa),
	
  data DATE,
  valor VARCHAR(25),
  descricao VARCHAR(45),
	CONSTRAINT gasto_pessoa 
    FOREIGN KEY(fkPessoa)
    REFERENCES pessoa(idPessoa)
  );
  
  INSERT INTO gasto VALUES
  (default,2 ,'2024-04-05', '100,00', 'tesoura'),
  (default, 1,'2024-10-19', '2750,00', 'notebook'),
  (default, 2,'2024-12-22', '529,99', 'escova'),
  (default, 3,'2024-05-05', '100,00', 'jaleco profissional'),
  (default, 1,'2024-08-08','279,99', 'memoria ram'),
  (default, 3,'2024-09-29', '1999,99', 'centrifuga'),
  (default, 4,'2024-05-11', '49,99', 'kit luvas medicas'),
  (default, 4,'2024-06-20', '100,00', 'jaleco prossional');
 
 select * from pessoa;
 select * from gasto;
 
  select * from pessoa where profissao = 'biologo';
 select * from gasto where descricao = 'escova';
 
 select * from pessoa 
 join gasto
 on pessoa.idPessoa = gasto.fkPessoa;
 
 select pessoa.nome as NOME, gasto.descricao as GASTO
	from pessoa 
    join gasto
    on pessoa.idPessoa=gasto.fkPessoa
    where nome = 'Ryan';
    
    update pessoa set profissao = 'profissional em bando de dados' where idPessoa = 1;
    delete from gasto where idGasto = 1;
    
						-- ATIVIDADE 3

create database PraticaFuncionario;
use PraticaFuncionario;

CREATE TABLE setor (
  idSetor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) ,
  numAndar int
  );


insert into setor values
(default,'RH',3),
(default,'Consultoria', 4),
(default,'Sala de reuniões', 5 ),
(default,'Gerencia', 6 );


CREATE TABLE funcionario (
  idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
  fkSetor INT,
  nome VARCHAR(45),
  telCelular VARCHAR(11),
  salario varchar(20),
	constraint chkSalario
    check (salario>0),
	CONSTRAINT setor_funcionario 
    FOREIGN KEY(fkSetor)
    REFERENCES setor(idSetor)
  );

  INSERT INTO funcionario VALUES
  (default,4 ,'Ryan', '11996738517', '45000'),
  (default, 2,'Julia', '11945678901', '15000'),
  (default, 1,'Vinicius', '11923456789', '8000'),
  (default, 1,'Adriano', '11912345678', '8000'),
  (default, 2,'Giovanna','11908276666', '15000');
 
 create table acompanhante(
 idAcompanhante int auto_increment,
 fkFuncionario int,
	constraint pkAcompanhante_Funcionario
    primary key(idAcompanhante, fkFuncionario),
nome varchar(45),
tipo_relacao varchar(20),
dtNasc date,
	constraint acp_func
    foreign key (fkFuncionario)
    references funcionario(idFuncionario)
 );
 
 insert into acompanhante values
 (default,1, 'Renata', 'Mae', '1988-06-07'),
 (default,2, 'Wagner', 'Pai', '1988-06-07'),
 (default,3, 'Marcia', 'Mae', '1988-06-07'),
 (default,3, 'Isabelle', 'Esposa', '1988-06-07'),
 (default,2, 'Gaby', 'Irmã', '1988-06-07'),
 (default,4, 'Renata', 'Mae', '1988-06-07'),
 (default, 5, 'Gisele', 'Mae', '1988-06-07');
 
 -- Exibir todos os dados de cada tabela criada, separadamente.
 select * from acompanhante;
 select * from funcionario;
 select * from setor;
-- Exibir os dados dos setores e dos seus respectivos funcionários.
select setor.nome as SETOR, funcionario.nome as FUNCIONARIO
	from setor
    join funcionario
    on setor.idSetor = funcionario.fkSetor;
-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select setor.nome as SETOR, funcionario.nome as FUNCIONARIO
	from setor
    join funcionario
    on setor.idSetor = funcionario.fkSetor
    where setor.nome = 'RH';
-- Exibir os dados dos funcionários e de seus acompanhantes.
select funcionario.nome as FUNCIONARIO, acompanhante.nome as ACOMPANTANTE
	from funcionario
    join acompanhante
    on funcionario.idFuncionario = acompanhante.fkFuncionario;
-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select funcionario.nome as FUNCIONARIO, acompanhante.nome as ACOMPANTANTE
	from funcionario
    join acompanhante
    on funcionario.idFuncionario = acompanhante.fkFuncionario
    where funcionario.nome = 'Julia';
-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select *
	from setor
    join funcionario
    on setor.idSetor = funcionario.fkSetor
    join acompanhante
    on funcionario.idFuncionario = acompanhante.fkFuncionario
    ;
 
													-- ATIVIDADE 4
                                                    
                                                    

create table treinador(
idTreinador int primary key auto_increment,
nome varchar(50),
telCelular char(11),
email varchar (50),
fkExperiente int,
	constraint novato_experiente
    foreign key (fkExperiente)
    references treinador(idTreinador)
);

alter table treinador auto_increment = 10;

 -- Cada treinador treina mais de um nadador.
-- Cada nadador tem apenas um treinador.
-- Sobre cada nadador, o sistema guarda um identificador, que identifica de forma
-- única cada um deles. Esse identificador começa com o valor 100 e é inserido de
-- forma automática. Além desse identificador, o sistema guarda o nome, o estado de
-- origem e a data de nascimento do nadador.

create table nadador(
idNadador int primary key auto_increment,
fkTreinador int,
	constraint treinador_nadador
    foreign key (fkTreinador)
    references treinador(idTreinador),
nome varchar(50),
local_nasc varchar(50),
dtNasc date
); 
alter table nadador auto_increment = 100;




--  Inserir dados nas tabelas, de forma que exista mais de um nadador para algum
-- treinador, e mais de um treinador sendo orientado por algum treinador mais
-- experiente
insert into treinador values
(default, 'Ryan', '11996738517', 'ryangsantos@gmail.com', null),
(default, 'Julia', '11962635528', 'jucris@gmail.com', 10),
(default, 'Vinicius', '11988876253', 'vinitostes@gmail.com', 10);

insert into nadador values
(default, 11,'Joao', 'Sao Paulo', '2000-09-08'),
(default, 12,'Pedro','Espirito Santo' , '2000-12-01' ),
(default, 11, 'Ana', 'Sao paulo', '2001-03-10'),
(default, 10, 'Giovanna', 'Sao paulo', '1998-02-28'),
(default, 12, 'Adriano', 'Brasilia', '1998-05-23');

--  Exibir todos os dados de cada tabela criada, separadamente.
select * from treinador;
select * from nadador;

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select treinador.nome as Treinador, nadador.nome as Nadador
	from treinador
    join nadador
    on treinador.idTreinador=nadador.fkTreinador;
--  Exibir os dados de um determinado treinador (informar o nome do treinador na
-- consulta) e os dados de seus respectivos nadadores.
select treinador.nome as Treinador, nadador.nome as Nadador
	from treinador
    join nadador
    on treinador.idTreinador=nadador.fkTreinador
    where treinador.nome = 'Julia';
--  Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores.
select treinador.nome as Novato, orientador.nome as Orientador
	from treinador 
    join treinador as orientador
    on orientador.idTreinador=treinador.fkExperiente;
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o
-- nome do treinador na consulta).
select treinador.nome as Novato, orientador.nome as Orientador
	from treinador 
    join treinador as orientador
    on orientador.idTreinador=treinador.fkExperiente 
	where treinador.fkExperiente= 10;
--  Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados
-- dos respectivos treinadores orientadores.
select treinador.nome as Novato, orientador.nome as Orientador, nadador.nome
	from treinador 
    left join treinador as orientador
    on orientador.idTreinador=treinador.fkExperiente 
	join nadador
    on treinador.idTreinador = nadador.fkTreinador;
--  Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos
-- respectivos nadadores e os dados do seu treinador orientador
select treinador.nome as Novato, orientador.nome as Orientador, nadador.nome as Nadador
	from treinador 
   left join treinador as orientador
    on orientador.idTreinador=treinador.fkExperiente 
    join nadador
    on treinador.idTreinador = nadador.fkTreinador
    where treinador.nome = 'Julia'
    
								
