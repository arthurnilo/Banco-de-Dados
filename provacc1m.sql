create database ProvaCC1M;

use ProvaCC1M;

create table if not exists Clientes (
	Clientes_Numero int primary key,
	Clientes_Nome varchar(20) not null,
	Clientes_Rua varchar(45) not null,
	Clientes_Bairro varchar(45) not null,
	Clientes_Cidade varchar(45) not null,
	Clientes_Estado varchar(45) not null,
	Clientes_Pais varchar(30) not null,	
	Clientes_CodPostal varchar(10) not null,
	Clientes_Telefone varchar(15) not null,
	Clientes_Contato text not null
);

create table if not exists Carros (
	Carros_Registro int primary key,
    Carros_Marca varchar(20) not null,
    Carros_Modelo varchar(30) not null
);

 create table if not exists Acidentes (
	Acidentes_Data date not null,
    Acidentes_Hora time not null,
    Acidentes_Local text not null,
    Acidentes_Carro int primary key,
	primary key (Acidentes_Carro),
    constraint FK_Carros foreign key(Acidentes_Carro) references Carros(Carros_Registro)
 );

 create table if not exists Carros_Clientes (
	CaCl_Cliente int,
    CaCl_Carro int,
    primary key (CaCl_Cliente, CaCl_Carro),
	constraint CaCl_FK_Cliente foreign key(CaCl_Cliente) references Clientes(Clientes_Numero),
    constraint CaCl_FK_Carro foreign key(CaCl_Carro) references Carros(Carros_Registro)
 );

create table if not exists Apolices (
	Apolices_Numero int primary key,
    Apolices_Valor decimal(10,2) not null,
    constraint FK_Clientes foreign key(Apolices_Numero) references Clientes(Clientes_Numero),
    constraint FK_Carros foreign key(Apolices_Registro) references Carros(Carros_Registro)
);
