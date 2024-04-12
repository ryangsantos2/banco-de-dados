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
