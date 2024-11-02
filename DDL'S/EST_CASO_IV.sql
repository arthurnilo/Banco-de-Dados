# Banco de Dados Academia
drop database est_caso_4; #não usar se for a primeira vez compilando
create database est_caso_4;

use est_caso_4;

# Tabela de Alunos
create table if not exists Alunos (
    Aluno_ID int primary key,
    Aluno_Nome varchar(100) not null,
    Aluno_CPF varchar(11) unique not null,
    Aluno_DataNasc date not null,
    Aluno_Endereco varchar(255) not null,
    Aluno_Cidade varchar(50) not null,
    Aluno_Estado varchar(2) not null,
    Aluno_Telefone varchar(15) not null
);

alter table Alunos add email varchar(20);
alter table Alunos modify email text;
alter table Alunos change email endereco_email text;
alter table Alunos drop column endereco_email;

# Tabela de Instrutores
create table if not exists Instrutores (
    Instrutor_ID int primary key,
    Instrutor_Nome varchar(100) not null,
    Instrutor_CPF varchar(11) unique not null,
    Instrutor_DataNasc date not null,
    Instrutor_Endereco varchar(255) not null,
    Instrutor_Cidade varchar(50) not null,
    Instrutor_Estado varchar(2) not null,
    Instrutor_Telefone varchar(15) not null
);

alter table Instrutores add email varchar(20);
alter table Instrutores modify email text;
alter table Instrutores change email endereco_email text;
alter table Instrutores drop column endereco_email;

# Tabela de Modalidades
create table if not exists Modalidades (
    Modalidade_ID int primary key,
    Modalidade_Nome varchar(50) not null,
    Modalidade_Descricao text
);

alter table Modalidades add Modalidade_Esportes varchar(20);
alter table Modalidades modify Modalidade_Esportes text;
alter table Modalidades change Modalidade_Esportes Modalidade_Tipo text;
alter table Modalidades drop column Modalidade_Tipo;

# Tabela de Planos de Treinamento
create table if not exists PlanosTreinamento (
    Plano_ID int primary key,
    Aluno_ID int not null,
    Instrutor_ID int not null,
    Plano_DataCriacao date not null,
    Plano_Descricao text,
    foreign key (Aluno_ID) references Alunos(Aluno_ID),
    foreign key (Instrutor_ID) references Instrutores(Instrutor_ID)
);

alter table PlanosTreinamento add Plano_Preco varchar(20);
alter table PlanosTreinamento modify Plano_Preco decimal;
alter table PlanosTreinamento change Plano_Preco Plano_PrecoAtual decimal;
alter table PlanosTreinamento drop column Plano_PrecoAtual;

# Tabela de Aulas
create table if not exists Aulas (
    Aula_ID int primary key,
    Modalidade_ID int not null,
    Instrutor_ID int not null,
    Aula_Horario time not null,
    Aula_Data date not null,
    Aula_Capacidade int not null,
    foreign key (Modalidade_ID) references Modalidades(Modalidade_ID),
    foreign key (Instrutor_ID) references Instrutores(Instrutor_ID)
);

alter table Aulas add Aula_Plano varchar(20);
alter table Aulas modify Aula_Plano text;
alter table Aulas change Aula_Plano Aula_Planos text;
alter table Aulas drop column Aula_Planos;

# Tabela de Matrículas de Alunos em Modalidades
create table if not exists Matriculas (
    Matricula_ID int primary key,
    Aluno_ID int not null,
    Modalidade_ID int not null,
    Matricula_Data date not null,
    foreign key (Aluno_ID) references Alunos(Aluno_ID),
    foreign key (Modalidade_ID) references Modalidades(Modalidade_ID)
);

alter table Matriculas add Matricula_Hora text;
alter table Matriculas modify Matricula_Hora time;
alter table Matriculas change Matricula_Hora Matricula_Horario time;
alter table Matriculas drop column Matricula_Horario;

# Tabela de Participação dos Alunos nas Aulas
create table if not exists Aulas_Alunos (
    Aula_ID int not null,
    Aluno_ID int not null,
    primary key (Aula_ID, Aluno_ID),
    foreign key (Aula_ID) references Aulas(Aula_ID),
    foreign key (Aluno_ID) references Alunos(Aluno_ID)
);

alter table Aulas_Alunos add AUAL_Presença text;
alter table Aulas_Alunos modify AUAL_Presença boolean;
alter table Aulas_Alunos change AUAL_Presença AUAL_Presenca boolean;
alter table Aulas_Alunos drop column AUAL_Presenca;

# Tabela de Pagamentos
create table if not exists Pagamentos (
    Pagamento_ID int primary key,
    Aluno_ID int not null,
    Pagamento_Data date not null,
    Pagamento_Valor decimal(10,2) not null,
    Pagamento_Status enum('pago', 'pendente') not null,
    foreign key (Aluno_ID) references Alunos(Aluno_ID)
);

alter table Pagamentos add Pagamento_Vencido text;
alter table Pagamentos modify Pagamento_Vencido enum("sim", "não");
alter table Pagamentos change Pagamento_Vencido Pagamento_Check enum("sim", "não");
alter table Pagamentos drop column Pagamento_Check;

# Tabela de Associação de Instrutores a Modalidades
create table if not exists Instrutores_Modalidades (
    Instrutor_ID int not null,
    Modalidade_ID int not null,
    primary key (Instrutor_ID, Modalidade_ID),
    foreign key (Instrutor_ID) references Instrutores(Instrutor_ID),
    foreign key (Modalidade_ID) references Modalidades(Modalidade_ID)
);

alter table Instrutores_Modalidades add InMo_Validacao text;
alter table Instrutores_Modalidades modify InMo_Validacao enum("sim", "não");
alter table Instrutores_Modalidades change InMo_Validacao InMo_Check enum("sim", "não");
alter table Instrutores_Modalidades drop column InMo_Check;

create table if not exists Franquia (
	Franquia_ID int primary key,
    Franquia_Endereco varchar(255) not null,
    Franquia_Cidade varchar(50) not null,
    Franquia_Estado varchar(2) not null,
    Franquia_Telefone varchar(15) not null
);

drop table Franquia;
