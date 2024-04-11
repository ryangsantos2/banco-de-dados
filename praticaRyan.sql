create database pratica;
use pratica;

create table Dono(
idDono int primary key auto_increment,
nome varchar(45),
email varchar(80) unique,
numero varchar(15)
);

create table Pet(
idPet int primary key auto_increment,
nome varchar(45),
fkDono int,
	constraint dono_pet
		foreign key (fkDono)
			references Dono(idDono),
fkMae int,
	constraint mae_pet
		foreign key (fkMae)
			references Pet(idPet)

);

insert into Dono values 

(default, 'Ryan', 'ryan.santos@sptech.school', '11 996752431'),
(default, 'Julia', 'julia.cristianotti@sptech.school', '11 976380098'),
(default, 'Vinicius', 'vinicius.tostes@sptech.school', '11 900027763'),
(default, 'Adriano', 'adriano.almeida@sptech.school', '11 972655543');

alter table pet add column raca varchar(40);

insert into Pet(nome, raca) values
('Bela', 'pit bull'),
('Nina', 'yorkshire'),
('Mel', 'yorkshire'),
('Brian', 'pit bull');

update Pet set fkMae = 1 where idPet = 4;
update Pet set fkMae = 2 where idPet = 3;
update Pet set fkDono = 1 where idPet = 1;
update Pet set fkDono = 3 where idPet = 2;
update Pet set fkDono = 2 where idPet = 3;
update Pet set fkDono = 4 where idPet = 4;

select * from Dono;
select * from Pet;

select Pet.nome as Pet, Dono.nome as Dono
	from Pet
    join Dono
    on idDono=fkDono;
    
    select Mae.nome as nome_mae, Filho.nome as nome_filho
		from pet as Mae
        join pet as Filho
        on Filho.idPet=Mae.fkMae;
        
select Mae.nome as nome_mae, Filho.nome as nome_filho, Dono.nome as nome_dono
	from Pet as Mae
    join Pet as Filho
    on Filho.idPet = Mae.fkMae
    join Dono
    on Filho.fkDono=Dono.idDono;
        

-- Atividade 2

create table Empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(14) unique,
endereco varchar(100)
);

create table Funcionario(
idFuncionario int primary key auto_increment,
nome varchar(45),
fkEmpresa int,
	constraint func_empresa
		foreign key (fkEmpresa)
			references Empresa(idEmpresa),
fkSupervisor int,
	constraint sup_func
		foreign key (fkSupervisor)
			references Funcionario(idFuncionario)

);

insert into Empresa values 

(default, 'ArtCare', '12341000156', 'Rua dos Anjos'),
(default, 'CoffeeSense', '2345100067', 'Rua do amor'),
(default, 'CheckChicken', '3456100078', 'Avenida dos Palmares'),
(default, 'SoySoup', '4567100089', 'Avenida Rio Verde');

insert into Funcionario(nome) values
('Ricardo'),
('Mauro'),
('Alberto'),
('Elisa'),
('Lucas'),
('Julia');

update Funcionario set fkSupervisor = 6 where idFuncionario = 1;
update Funcionario set fkSupervisor = 6 where idFuncionario = 2;
update Funcionario set fkSupervisor = 4 where idFuncionario = 3;
update Funcionario set fkSupervisor = 4 where idFuncionario = 5;
update Funcionario set fkEmpresa = 3 where idFuncionario = 1;
update Funcionario set fkEmpresa = 3 where idFuncionario = 2;
update Funcionario set fkEmpresa = 1 where idFuncionario= 3;
update Funcionario set fkEmpresa = 4 where idFuncionario = 4;
update Funcionario set fkEmpresa = 1 where idFuncionario = 5;
update Funcionario set fkEmpresa = 3 where idFuncionario= 6;



select * from Funcionario;
select * from Empresa;

select Funcionario.nome as Funcionario, Empresa.nome as Empresa
	from Funcionario
    join Empresa
    on idEmpresa=fkempresa;
    
    select nome_supervisor.nome as Nome, nome_funcionario.nome as Supervisor
		from Funcionario as nome_supervisor
        join Funcionario as nome_funcionario
        on nome_supervisor.fkSupervisor=nome_funcionario.idFuncionario;
        
select sup.nome as Funcionario , func.nome as Supervisor, Empresa.nome 
	from Funcionario as func
    join Funcionario as sup
    on func.idFuncionario = sup.fkSupervisor
    join Empresa
    on sup.fkEmpresa=Empresa.idEmpresa;
    
    
    
															-- Atividade 3
                                                            
create table endereco(
idEndereco int primary key auto_increment,
nome varchar(100) unique,
numero varchar(9),
cep char(8)
);

create table pessoa(
idPessoa int primary key auto_increment,
nome varchar(50),
cpf char(11), 
fkSombra int,
	constraint sombra_pessoa
    foreign key (fkSombra)
    references pessoa(idPessoa),
fkEndereco int,
	constraint endereco_pessoa
    foreign key (fkEndereco)
    references endereco(idEndereco)
);
    
insert into endereco(nome, numero, cep) values
('rua da vida', '1099', '02678900'),
('avenida dos amores', '22', '02456333'),
('rua doce', '341', '08265333');

select * from endereco;

insert into pessoa(nome, cpf) values
('Ryan', '42345621818'),
('Julia', '42253677765'),
('Vinicius', '46600987263'),
('Adriano', '28433356801');

update pessoa set fkSombra = 1 where idPessoa= 1; 
update pessoa set fkSombra = 2 where idPessoa= 2; 
update pessoa set fkSombra = 3 where idPessoa= 3; 
update pessoa set fkSombra = 4 where idPessoa= 4; 

update pessoa set fkEndereco = 2 where idPessoa in (1, 4);
update pessoa set fkEndereco=1 where idPessoa = 3;
update pessoa set fkEndereco=3 where idPessoa = 2;

select * from pessoa;

select pessoa.nome as Pessoa, endereco.nome as Endereco
	from pessoa
    join endereco
    on endereco.idEndereco=pessoa.fkEndereco;
    
select person.nome as Pessoa, shadow.nome as Sombra
	from pessoa as person
    join pessoa as shadow
    on person.idPessoa=shadow.fkSombra;
    
    select person.nome as Pessoa, shadow.nome as Sombra, localidade.nome as Endereco
	from pessoa as person
    join pessoa as shadow
    on person.idPessoa=shadow.fkSombra
    join endereco as localidade
    on localidade.idEndereco=shadow.fkSombra;

drop database pratica;