create database sprint;
use sprint;

create table projeto(
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);



create table aluno(
ra int primary key auto_increment, 
nome varchar (45),
telefone varchar (11),
fkRepresentante INT,
	constraint repre foreign key (fkRepresentante) references aluno(ra),
fkProjeto INT, 
	constraint proj foreign key (fkProjeto) references projeto(idProjeto)
);

insert into aluno(nome, telefone) values
('Ryan', 11996738517),
('Julia', 1198077754),
('Vinicius', 11983978376);

insert into projeto(nome, descricao) values
('artcare', 'cultural'),
('mensalao', 'cultural'),
('coldvent', 'ambiental');

select * from aluno;
select * from projeto;

update aluno set fkRepresentante=1 where ra=2;
update aluno set fkRepresentante=2 where ra=3;

update aluno set fkProjeto=1 where ra in(1, 2, 3);

select * from aluno where fkProjeto=1;

select aluno.nome as aluno, 
			representante.nome as representante 
				from aluno join aluno as representante on aluno.fkRepresentante=representante.ra;
                
select aluno.nome as aluno, 
			representante.nome as representante,
				projeto.nome as projeto
					from aluno join aluno as representante on aluno.fkRepresentante=representante.ra
						join projeto on aluno.fkProjeto=projeto.idProjeto;
                        
                        
													-- ATIVIDADE 2--
                                                    
create table
                

					
                    







