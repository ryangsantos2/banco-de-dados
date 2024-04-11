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
	constraint cliente_pet
    foreign key (fkCliente)
    references cliente(idCliente)
	
); 
   
alter table pet auto_increment = 101;

select * from pet;





insert into pet values

(101,'1','Nina', 'Shin tzu', '2017-08-09', 'cachorro'),
(101,'2', 'Luke', 'Shin tzu', '2013-04-04', 'cachorro'),
(102, '2', 'Mel', 'pug', '2015-10-15', 'gato'),
(101, '3', 'Chico', 'pug', '2018-04-10', 'cachorro'),
(102, '1', 'Bolt', 'pit bull', '2020-08-08', 'gato');

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