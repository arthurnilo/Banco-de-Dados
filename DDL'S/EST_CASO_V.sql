# Criação do schema
CREATE SCHEMA EST_CASO_V;

# Seleção do schema para uso
USE EST_CASO_V;

# Tabela de Clientes
CREATE TABLE IF NOT EXISTS CLIENTES (
    CLIENTES_ID INT PRIMARY KEY,
    CLIENTES_NOME VARCHAR(100) NOT NULL,
    CLIENTES_CPF VARCHAR(11) UNIQUE NOT NULL,
    CLIENTES_DATA_NASCIMENTO DATE,
    CLIENTES_ENDERECO VARCHAR(100),
    CLIENTES_TELEFONE VARCHAR(15),
    CLIENTES_STATUS_PROGRAMA_FIDELIDADE BOOLEAN DEFAULT FALSE
);

alter table CLIENTES add email varchar(20);
alter table CLIENTES modify email text;
alter table CLIENTES change email endereco_email text;
alter table CLIENTES drop column endereco_email;

# Tabela de Fornecedores
CREATE TABLE IF NOT EXISTS FORNECEDORES (
    FORNECEDORES_ID INT PRIMARY KEY,
    FORNECEDORES_NOME VARCHAR(100) NOT NULL,
    FORNECEDORES_CNPJ VARCHAR(14) UNIQUE NOT NULL,
    FORNECEDORES_CONTATO VARCHAR(100),
    FORNECEDORES_TELEFONE VARCHAR(15),
    FORNECEDORES_ENDERECO VARCHAR(100)
);

alter table FORNECEDORES add email varchar(20);
alter table FORNECEDORES modify email text;
alter table FORNECEDORES change email endereco_email text;
alter table FORNECEDORES drop column endereco_email;


# Tabela de Produtos
CREATE TABLE IF NOT EXISTS PRODUTOS (
    PRODUTOS_ID INT PRIMARY KEY,
    PRODUTOS_NOME VARCHAR(100) NOT NULL,
    PRODUTOS_CATEGORIA VARCHAR(50),
    PRODUTOS_PRECO DECIMAL(10, 2) NOT NULL,
    PRODUTOS_ESTOQUE INT NOT NULL,
    FORNECEDORES_ID INT NOT NULL,
    CONSTRAINT FK_FORNECEDORES_PRODUTOS FOREIGN KEY (FORNECEDORES_ID) REFERENCES FORNECEDORES(FORNECEDORES_ID)
);

alter table PRODUTOS add PRODUTOS_PESO int;
alter table PRODUTOS modify PRODUTOS_PESO decimal;
alter table PRODUTOS change PRODUTOS_PESO PRODUTOS_PESAGEM decimal;
alter table PRODUTOS drop column PRODUTOS_PESAGEM;

# Tabela de Vendas
CREATE TABLE IF NOT EXISTS VENDAS (
    VENDAS_ID INT PRIMARY KEY,
    CLIENTES_ID INT NOT NULL,
    VENDAS_DATA DATE NOT NULL,
    VENDAS_FORMA_PAGAMENTO ENUM('DINHEIRO', 'CARTÃO', 'PIX', 'OUTRO') NOT NULL,
    VENDAS_VALOR_TOTAL DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_CLIENTES_VENDAS FOREIGN KEY (CLIENTES_ID) REFERENCES CLIENTES(CLIENTES_ID)
);

alter table VENDAS add VENDAS_PARCELA decimal;
alter table VENDAS modify VENDAS_PARCELA int;
alter table VENDAS change VENDAS_PARCELA VENDAS_PARCELAMENTO int;
alter table VENDAS drop column VENDAS_PARCELAMENTO;

# Tabela de Produtos Vendidos (associativa entre Vendas e Produtos)
CREATE TABLE IF NOT EXISTS PRODUTOS_VENDIDOS (
    VENDAS_ID INT,
    PRODUTOS_ID INT,
    PRODUTOS_VENDIDOS_QUANTIDADE INT NOT NULL,
    PRODUTOS_VENDIDOS_PRECO_UNITARIO DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (VENDAS_ID, PRODUTOS_ID),
    CONSTRAINT FK_VENDAS FOREIGN KEY (VENDAS_ID) REFERENCES VENDAS(VENDAS_ID),
    CONSTRAINT FK_PRODUTOS FOREIGN KEY (PRODUTOS_ID) REFERENCES PRODUTOS(PRODUTOS_ID)
);

alter table PRODUTOS_VENDIDOS add PRODUTOS_LUCRO int;
alter table PRODUTOS_VENDIDOS modify PRODUTOS_LUCRO decimal;
alter table PRODUTOS_VENDIDOS change PRODUTOS_LUCRO PRODUTOS_LUCRO_TOTAL decimal;
alter table PRODUTOS_VENDIDOS drop column PRODUTOS_LUCRO_TOTAL;

# Tabela de Pagamentos
CREATE TABLE IF NOT EXISTS PAGAMENTOS (
    PAGAMENTOS_ID INT PRIMARY KEY,
    VENDAS_ID INT NOT NULL,
    PAGAMENTOS_DATA DATE NOT NULL,
    PAGAMENTOS_VALOR DECIMAL(10, 2) NOT NULL,
    PAGAMENTOS_STATUS ENUM('PAGO', 'PENDENTE') NOT NULL,
    CONSTRAINT FK_PAGAMENTOS_VENDAS FOREIGN KEY (VENDAS_ID) REFERENCES VENDAS(VENDAS_ID)
);

alter table PAGAMENTOS add Pagamento_Vencido text;
alter table PAGAMENTOS modify Pagamento_Vencido enum("sim", "não");
alter table PAGAMENTOS change Pagamento_Vencido Pagamento_Check enum("sim", "não");
alter table PAGAMENTOS drop column Pagamento_Check;

create table if not exists Franquia (
	Franquia_ID int primary key,
    Franquia_Endereco varchar(255) not null,
    Franquia_Cidade varchar(50) not null,
    Franquia_Estado varchar(2) not null,
    Franquia_Telefone varchar(15) not null
);

drop table Franquia;
