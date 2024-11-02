DROP SCHEMA est_caso_3; #não usar se for a primeira vez compilando
CREATE SCHEMA est_caso_3;

USE est_caso_3;

CREATE TABLE IF NOT EXISTS FORNECEDORES(
    FORNEC_COD INT PRIMARY KEY,
    FORNEC_NOME VARCHAR(45) NOT NULL,
    FORNEC_RUA VARCHAR(45) NOT NULL,
    FORNEC_NUMRUA INT,
    FORNEC_BAIRRO VARCHAR(45) NOT NULL,
    FORNEC_CIDADE VARCHAR(45) NOT NULL,
    FORNEC_ESTADO VARCHAR(45) NOT NULL,
    FORNEC_PAIS VARCHAR(30) NOT NULL,
    FORNEC_CODPOSTAL VARCHAR(10) NOT NULL,
    FORNEC_TELEFONE VARCHAR(15) NOT NULL,
    FORNEC_CONTATO TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS FILIAIS(
    FILIAL_COD INT PRIMARY KEY,
    FILIAL_NOME VARCHAR(45) NOT NULL,
    FILIAL_RUA VARCHAR(100) NOT NULL,
    FILIAL_NUMRUA INT,
    FILIAL_BAIRRO VARCHAR(50) NOT NULL,
    FILIAL_CIDADE VARCHAR(50) NOT NULL,
    FILIAL_ESTADO VARCHAR(50) NOT NULL,
    FILIAL_PAIS VARCHAR(50) NOT NULL,
    FILIAL_CODPOSTAL VARCHAR(10) NOT NULL,
    FILIAL_CAPACIDADE TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS PRODUTOS(
    PROD_COD INT PRIMARY KEY,
    PROD_NOME VARCHAR(50) NOT NULL,
    PROD_DESCRICAO TEXT NOT NULL,
    PROD_ESPECTEC TEXT NOT NULL,
    PROD_QUANT DECIMAL(10,3) NOT NULL,
    PROD_PRECOUNIT DECIMAL(10,2) NOT NULL,
    PROD_UNIDMEDIDA VARCHAR(10) NOT NULL,
    PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);

CREATE TABLE IF NOT EXISTS CLIENTES(
    CLIENTE_COD INT PRIMARY KEY,
    CLIENTE_CNPJ VARCHAR(14) NOT NULL,
    CLIENTE_RAZAO_SOCIAL VARCHAR(100) NOT NULL,
    CLIENTE_RAMO_ATIVIDADE VARCHAR(100),
    CLIENTE_DATA_CADASTRO DATE NOT NULL,
    CLIENTE_TELEFONE VARCHAR(15),
    CLIENTE_CONTATO VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS EMPREGADOS(
    EMPREGADO_MATRICULA INT PRIMARY KEY,
    EMPREGADO_NOME VARCHAR(100) NOT NULL,
    EMPREGADO_TELEFONE VARCHAR(15),
    EMPREGADO_CARGO VARCHAR(50) NOT NULL,
    EMPREGADO_SALARIO DECIMAL(10,2) NOT NULL,
    EMPREGADO_DATA_ADMISSAO DATE NOT NULL,
    EMPREGADO_QUALIFICACOES TEXT,
    EMPREGADO_ENDERECO VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS EMPRESAS(
    EMPRESA_CNPJ VARCHAR(14) PRIMARY KEY,
    EMPRESA_RAZAO_SOCIAL VARCHAR(100) NOT NULL,
    EMPRESA_TELEFONE VARCHAR(15),
    EMPRESA_CONTATO VARCHAR(100),
    EMPRESA_ENDERECO VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS TIPO_ENDERECO(
    TIPO_ENDERECO_COD INT PRIMARY KEY,
    TIPO_ENDERECO_NOME VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS ENDERECOS(
    ENDERECO_NUMERO INT,
    ENDERECO_LOGRADOURO VARCHAR(100),
    ENDERECO_COMPLEMENTO VARCHAR(50),
    ENDERECO_CEP VARCHAR(10),
    ENDERECO_BAIRRO VARCHAR(50),
    ENDERECO_CIDADE VARCHAR(50),
    ENDERECO_ESTADO VARCHAR(50),
    ENDERECO_TIPO INT,
    CONSTRAINT FK_TIPO_ENDERECO FOREIGN KEY (ENDERECO_TIPO) REFERENCES TIPO_ENDERECO(TIPO_ENDERECO_COD)
);

CREATE TABLE IF NOT EXISTS ENCOMENDAS(
    ENCOMENDA_NUMERO INT PRIMARY KEY,
    ENCOMENDA_DATA DATE NOT NULL,
    ENCOMENDA_VALOR_TOTAL DECIMAL(10,2) NOT NULL,
    ENCOMENDA_VALOR_DESCONTO DECIMAL(10,2),
    ENCOMENDA_VALOR_LIQUIDO DECIMAL(10,2) NOT NULL,
    ENCOMENDA_ID_FORMA_PAGAMENTO INT,
    ENCOMENDA_QTD_PARCELAS INT,
    ENCOMENDA_CLIENTE INT,
    CONSTRAINT FK_CLIENTE FOREIGN KEY (ENCOMENDA_CLIENTE) REFERENCES CLIENTES(CLIENTE_COD)
);

CREATE TABLE IF NOT EXISTS TIPOS_COMPONENTE(
    TIPO_COMP_COD INT PRIMARY KEY,
    TIPO_COMP_NOME VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS COMPONENTES(
    COMPONENTE_COD INT PRIMARY KEY,
    COMPONENTE_NOME VARCHAR(50) NOT NULL,
    COMPONENTE_QUANT_ESTOQUE DECIMAL(10,3),
    COMPONENTE_PRECO_UNITARIO DECIMAL(10,2),
    COMPONENTE_UNID_MEDIDA VARCHAR(10),
    COMPONENTE_TIPO INT,
    CONSTRAINT FK_TIPO_COMPONENTE FOREIGN KEY (COMPONENTE_TIPO) REFERENCES TIPOS_COMPONENTE(TIPO_COMP_COD)
);

CREATE TABLE IF NOT EXISTS MAQUINAS(
    MAQUINA_COD INT PRIMARY KEY,
    MAQUINA_TEMPO_VIDA DECIMAL(10,2),
    MAQUINA_DATA_COMPRA DATE,
    MAQUINA_DATA_FIM_GARANTIA DATE
);

CREATE TABLE IF NOT EXISTS RECURSOS_ESPECIFICOS(
    RE_COD INT PRIMARY KEY,
    RE_QUANTIDADE_NECESSARIA DECIMAL(10,3),
    RE_UNIDADE VARCHAR(10),
    RE_TEMPO_USO DECIMAL(10,2),
    RE_HORAS_MAO_OBRA DECIMAL(10,2),
    RE_MAQUINA INT,
    CONSTRAINT FKER_MAQUINA FOREIGN KEY (RE_MAQUINA) REFERENCES MAQUINAS(MAQUINA_COD)
);

CREATE TABLE IF NOT EXISTS REGISTRO_MANUTENCAO(
    RM_DATA DATE NOT NULL,
    RM_DESCRICAO TEXT NOT NULL,
    RM_MAQUINA INT,
    CONSTRAINT FK_MAQUINA FOREIGN KEY (RM_MAQUINA) REFERENCES MAQUINAS(MAQUINA_COD)
);

CREATE TABLE IF NOT EXISTS REGISTRO_SUPRIMENTOS(
    RS_COD INT PRIMARY KEY,
    RS_QUANTIDADE DECIMAL(10,3),
    RS_DATA_NECESSIDADE DATE NOT NULL,
    RS_COMPONENTE INT,
    CONSTRAINT FK_COMPONENTE FOREIGN KEY (RS_COMPONENTE) REFERENCES COMPONENTES(COMPONENTE_COD)
);

CREATE TABLE IF NOT EXISTS PEDIDOS(
    PED_CODIGO INT PRIMARY KEY,
    PED_DATA DATE NOT NULL,
    PED_HORA TIME NOT NULL,
    PED_PREVISAO DATE NOT NULL,
    PED_STATUS ENUM('PENDENTE','CONCLUÍDO','EM ESPERA'),
    PED_FORNECEDOR INT NOT NULL,
    CONSTRAINT FK_FORNECEDOR FOREIGN KEY (PED_FORNECEDOR)
        REFERENCES FORNECEDORES(FORNEC_COD)
);

CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
    RECEB_DATA DATE NOT NULL,
    RECEB_HORA TIME NOT NULL,
    RECEB_QUANT_PROD DECIMAL(10,3),
    RECEB_CONDICAO TEXT NOT NULL,
    RECEB_PEDIDOS INT PRIMARY KEY,
    CONSTRAINT FK_PEDIDOS FOREIGN KEY(RECEB_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO)
);

CREATE TABLE IF NOT EXISTS PEDIDOS_PRODUTOS(
    PDPR_PEDIDOS INT,
    PDPR_PRODUTOS INT,
    PRIMARY KEY(PDPR_PEDIDOS, PDPR_PRODUTOS),
    PDPR_QUANT DECIMAL(10,3) NOT NULL,
    CONSTRAINT PDPR_FK_PEDIDOS FOREIGN KEY(PDPR_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO),
    CONSTRAINT PDPR_FK_PRODUTOS FOREIGN KEY(PDPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);

CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
    FLPR_FILIAL INT,
    FLPR_PRODUTOS INT,
    PRIMARY KEY(FLPR_FILIAL, FLPR_PRODUTOS),
    FLPR_QUANT DECIMAL(10,3) NOT NULL,
    CONSTRAINT FLPR_FK_FILIAIS FOREIGN KEY(FLPR_FILIAL) REFERENCES FILIAIS(FILIAL_COD),
    CONSTRAINT FLPR_FK_PRODUTOS FOREIGN KEY(FLPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);

CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
    FRPR_FORNECEDOR INT,
    FRPR_PRODUTOS INT,
    PRIMARY KEY(FRPR_FORNECEDOR, FRPR_PRODUTOS),
    CONSTRAINT FRPR_FK_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR)
        REFERENCES FORNECEDORES(FORNEC_COD),
    CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS) 
        REFERENCES PRODUTOS(PROD_COD)
);


# Criando a tabela PROMOCOES_TEMP
CREATE TABLE PROMOCOES_TEMP (
    PROMO_ID INT PRIMARY KEY,
    PROMO_NOME VARCHAR(100) NOT NULL,
    DESCONTO_PORCENTAGEM DECIMAL(5,2),
    DATA_INICIO DATE,
    DATA_FIM DATE
);

# Dropar a tabela PROMOCOES_TEMP
DROP TABLE IF EXISTS PROMOCOES_TEMP;

#Exemplo de ALTER TABLE para a tabela CLIENTES
ALTER TABLE CLIENTES
ADD CLIENTE_EMAIL VARCHAR(100);  #Adiciona uma nova coluna de email para o cliente
ALTER TABLE CLIENTES
DROP COLUMN CLIENTE_RAMO_ATIVIDADE;  #Remove a coluna de ramo de atividade
ALTER TABLE CLIENTES
MODIFY CLIENTE_CNPJ VARCHAR(18);  #Modifica o tipo de dado da coluna CNPJ
ALTER TABLE CLIENTES
CHANGE COLUMN CLIENTE_CONTATO CLIENTE_PESSOA_CONTATO VARCHAR(50);  #Renomeia a coluna para CLIENTE_PESSOA_CONTATO

ALTER TABLE EMPREGADOS
ADD EMPREGADO_DEPARTAMENTO VARCHAR(50); 
ALTER TABLE EMPREGADOS
DROP COLUMN EMPREGADO_TELEFONE;  
ALTER TABLE EMPREGADOS
MODIFY EMPREGADO_SALARIO DECIMAL(12,2);  
ALTER TABLE EMPREGADOS
CHANGE COLUMN EMPREGADO_ENDERECO EMPREGADO_END VARCHAR(100); 

ALTER TABLE FORNECEDORES
ADD FORNEC_SITE VARCHAR(100); 
ALTER TABLE FORNECEDORES
DROP COLUMN FORNEC_CONTATO; 
ALTER TABLE FORNECEDORES
MODIFY FORNEC_SITE VARCHAR(50);  
ALTER TABLE FORNECEDORES
CHANGE COLUMN FORNEC_SITE FORNEC_LINK_SITE TEXT;  

ALTER TABLE PRODUTOS
ADD PROD_DATA_LANCAMENTO DATE; 
ALTER TABLE PRODUTOS
CHANGE COLUMN PROD_DATA_LANCAMENTO PROD_LANCAMENTO DATE;
ALTER TABLE PRODUTOS
DROP COLUMN PROD_LANCAMENTO;
ALTER TABLE PRODUTOS
MODIFY PROD_PRECOUNIT DECIMAL(12,2);

ALTER TABLE ENCOMENDAS
ADD ENCOMENDA_DATA_ENTREGA DATE; 
ALTER TABLE ENCOMENDAS
DROP COLUMN ENCOMENDA_VALOR_DESCONTO;
ALTER TABLE ENCOMENDAS
MODIFY ENCOMENDA_VALOR_LIQUIDO DECIMAL(12,2);
ALTER TABLE ENCOMENDAS
CHANGE COLUMN ENCOMENDA_QTD_PARCELAS ENCOMENDA_NUM_PARCELAS INT;
