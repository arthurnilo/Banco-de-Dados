#meu primeiro banquinho
create database ecI_cc1m;

use ecI_cc1m;

#criar tabela
create table if not exists Fornecedores(
#nomeatributo - tipo - restrição
Fornec_Cod int primary key,
Fornec_Nome varchar(45) not null,
Fornec_Rua varchar(45) not null,
Fornec_NumRua int,
Fornec_Bairro varchar(45) not null,
Fornec_Cidade varchar(45) not null,
Fornec_Estado varchar(45) not null,
Fornec_Pais varchar(30) not null,
Fornec_CodPostal varchar(10) not null,
Fornec_Telefone varchar(15) not null,
Fornec_Contato text not null
);

create table if not exists Produtos(
Prod_Cod int primary key,
Prod_Nome varchar(50) not null,
Prod_Descricao text not null,
Prod_Espectec text not null,
Prod_Quant decimal(10,3) not null,
Prod_Precounit decimal(10,2) not null,
Prod_UnidadeMedida varchar(10) not null,
Prod_Estoq_Min decimal(10,3)
);

create table if not exists Filiais(
Filiais_Cod int,
Filiais_Nome varchar(30) not null,
Filiais_Rua varchar(100) not null,
Filiais_NumRua int,
Filiais_Bairro varchar(50) not null,
Filiais_Cidade varchar(50) not null,
Filiais_Estado varchar(50) not null,
Filiais_Pais varchar(50) not null,
Filiais_CodPostal varchar(10) not null,
Filiais_Capacidade text not null
);

create table if not exists Pedidos(
Ped_Cod int,
Ped_Data date not null,
Ped_Hora time not null,
Ped_Previsao date not null,
Ped_Status enum('pendente', 'concluído', 'em espera') not null,
constraint FK_Fornecedor foreign key (Ped_Fornec) references Fornecedores(Fornec_Cod)
);

create table if not exists Recebimentos (
Receb_Data date not null,
Receb_Hora time not null,
Receb_Quant_Prod decimal(10,3) not null,
Receb_Condicao enum('pago', 'pendente'),
Receb_Pedidos int primary key,
constraint FK_Pedidos foreign key(Ped_Cod) references Pedidos(Ped_Cod)
);

create table if not exists Pedidos_Produtos (
PDPedidos int,
PDProdutos int,
primary key(Pedidos, Produtos),
PDPR_Quant decimal(10,3) not null,
constraint PDPR_FK_Pedidos foreign key(PDPR_Pedidos) references Pedidos(Ped_Cod),
constraint PDPR_FK_Produtos foreign key(PDPR_Produtos) references Produtos(Prod_Cod)
);

create table if not exists Filiais_Produtos (
FLPR_Filial int,
FRPR_Produtos int,
primary key(FLPR_Filial, FLPR_Produtos),
FLPR_Quant decimal(10,3) not null,
constraint FLPR_FK_Filiais foreign key(FLPR_Filial) references Filiais(Filial_Cod),
constraint FLPR_FK_Produtos foreign key(FLPR_Produtos) references Produtos(Prod_Cod)
);

create table if not exists Fornecedores_Produtos (
FRPR_Fornec int,
PRPR_Prod int,
primary key(FRPR_Fornec, FRPR_Prod),
constraint FRPR_FK_Fornecedores foreign key(FRPR_Fornec) references Fornecedores(Fornec_Cod),
constraint PRPR_FK_Produtos foreign key(PRPR_Prod) references Produtos(Prod_Cod)
);
