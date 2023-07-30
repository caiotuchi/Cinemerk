drop table if exists funcionario cascade;
drop table if exists funcionario_telefone cascade;
drop table if exists sala_de_cinema cascade;
drop table if exists filme cascade;
drop table if exists sala_de_cinema_filme cascade;
drop table if exists gerente cascade;
drop table if exists dependente cascade;

create table funcionario(
	CPF char(11) not null,
	Nome varchar(100) not null,
	Data_de_nascimento date not null,
	Salário varchar(30) not null,
	Função varchar(30) not null,
	Endereço_Rua varchar(50) not null,
	Endereço_Numero varchar(30) not null,
	Endereço_Bairro varchar(30) not null,
	Endereço_Cidade varchar(30) not null,
	Gerente char(11),
	
	constraint funcionario_pk primary key(CPF)
);

create table funcionario_telefone(
	CPF char(11) not null,
	Telefone varchar(15) not null,
	
	constraint funcionario_telefone_pk primary key(CPF, Telefone),
	constraint CPF_fk foreign key(CPF) references funcionario(CPF)
	on delete cascade
);

create table sala_de_cinema(
	numero serial,
	capacidade int not null,
	projetor varchar(9) not null,
	fiscal char(11) not null,
	gerente char(11) not null,
	
	constraint sala_de_cinema_pk primary key(numero),
	constraint fiscal_fk foreign key(fiscal) references funcionario(CPF),
	constraint gerente_fk foreign key(gerente) references funcionario(CPF)
);

create table filme(
	"id" serial,
	nome varchar(100) not null,
	genero varchar(50) not null,
	classificacao int not null,
	
	constraint filme_pk primary key("id")
);

create table sala_de_cinema_filme(
	numero int not null,
	filme_id int not null,
	horario varchar(15) not null,
	
	constraint sala_de_cinema_filme_pk primary key(numero, filme_id, horario),
	constraint numero_fk foreign key(numero) references sala_de_cinema(numero)
	on delete cascade
	on update cascade,
	constraint filme_id_fk foreign key(filme_id) references filme("id")
	on delete cascade
	on update cascade
);

create table gerente(
	CPF char(11) not null,
	bonificacao varchar(30) not null,
	
	constraint gerente_pk primary key(CPF),
	constraint CPF_fk foreign key(CPF) references funcionario(CPF)
	on delete cascade
);

create table dependente(
	CPF_funcionario char(11) not null,
	CPF char(11) not null,
	Nome varchar(100) not null,
	
	constraint dependente_pk primary key(CPF)
);

alter table funcionario add constraint Gerente_fk
	foreign key(Gerente) references funcionario(CPF)
	on delete set null
	on update cascade;

alter table dependente add constraint CPF_funcionario_fk
	foreign key(CPF_funcionario) references funcionario(CPF)
	on delete cascade;