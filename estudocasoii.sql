create database ESTUDOCASOII;
use ESTUDOCASOII;
drop database ESTUDOCASOII;


create table if not exists participantes(
part_num_inscricao int,
part_cpf varchar(20),
primary key(part_num_inscricao, part_cpf),
part_nome varchar(100) not null,
part_data_nasc date not null,
part_empresa varchar (100)
);


create table if not exists eventos (
evnt_id int primary key,
evnt_nome varchar(100) not null,
evnt_data date not null,
evnt_entidade varchar(100) not null,
evnt_local int,
foreign key (local_evento) references locais(local_id)
);


create table if not exists locais(
local_id int primary key,
local_nome varchar (100) not null,
local_log varchar(100) not null,
local_numlog int,
local_bairro varchar(100) not null,
local_uf char(2) not null,
local_cep varchar(20) not null,
local_capacidade int not null
);


create table if not exists atividades(
ativ_id int primary key,
ativ_nome varchar(100) not null,
ativ_data date not null,
ativ_hora time not null,
ativ_evento int not null,
foreign key (ativ_evento) references eventos(evnt_id)
);

create table if not exists participante_evento (
pe_inscricao int,
pe_cpf varchar(14),
pe_evento int,
primary key(pe_inscricao, pe_cpf, pe_evento),
foreign key(pe_inscricao, pe_cpf) references participantes(part_num_inscricao)
);

create table if not exists participante_atividade (
pa_inscricao int,
pa_cpf varchar(14),
pa_atividade int,
primary key(pa_inscricao, pa_cpf, pa_atividade),
foreign key(pa_inscricao, pa_cpf) references participantes(part_num_inscricao),
foreign key(pa_atividade) references atividades(ativ_id)
);
