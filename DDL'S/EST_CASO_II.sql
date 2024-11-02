DROP DATABASE FlyHighAirlines; #não usar se for a primeira vez compilando
CREATE DATABASE FlyHighAirlines;
USE FlyHighAirlines;

#Tabela de Aeroportos
CREATE TABLE IF NOT EXISTS aeroportos (
    aer_id INT PRIMARY KEY AUTO_INCREMENT,
    aer_codigo VARCHAR(5) UNIQUE NOT NULL,
    aer_nome VARCHAR(100) NOT NULL,
    aer_cidade VARCHAR(50),
    aer_pais VARCHAR(50)
);

#Tabela de Aeronaves
CREATE TABLE IF NOT EXISTS aeronaves (
    aer_id INT PRIMARY KEY AUTO_INCREMENT,
    aer_modelo VARCHAR(50) NOT NULL,
    aer_capacidade INT NOT NULL
);

#Tabela de Funcionários
CREATE TABLE IF NOT EXISTS funcionarios (
    func_id INT PRIMARY KEY AUTO_INCREMENT,
    func_nome VARCHAR(100) NOT NULL,
    func_cargo ENUM('Piloto', 'Comissário de Bordo', 'Equipe de Solo') NOT NULL
);

#Tabela de Passageiros
CREATE TABLE IF NOT EXISTS passageiros (
    pas_id INT PRIMARY KEY AUTO_INCREMENT,
    pas_nome VARCHAR(100) NOT NULL,
    pas_cpf VARCHAR(11) UNIQUE NOT NULL,
    pas_telefone VARCHAR(15),
    pas_endereco VARCHAR(255)
);

#Tabela de Voos
CREATE TABLE IF NOT EXISTS voos (
    voo_id INT PRIMARY KEY AUTO_INCREMENT,
    voo_codigo VARCHAR(10) UNIQUE NOT NULL,
    voo_origem VARCHAR(50) NOT NULL,
    voo_destino VARCHAR(50) NOT NULL,
    voo_partida DATETIME NOT NULL,
    voo_chegada DATETIME NOT NULL,
    voo_aeronave_id INT,
    FOREIGN KEY (voo_aeronave_id) REFERENCES aeronaves(aer_id)
);

#Tabela de Reservas
CREATE TABLE IF NOT EXISTS reservas (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_pas_id INT NOT NULL,
    res_voo_id INT NOT NULL,
    res_data DATE NOT NULL,
    FOREIGN KEY (res_pas_id) REFERENCES passageiros(pas_id),
    FOREIGN KEY (res_voo_id) REFERENCES voos(voo_id),
    UNIQUE (res_pas_id, res_voo_id)
);

#Tabela de Operações de Voo
CREATE TABLE IF NOT EXISTS operacoes_voo (
    opv_id INT PRIMARY KEY AUTO_INCREMENT,
    opv_voo_id INT NOT NULL,
    opv_func_id INT NOT NULL,
    FOREIGN KEY (opv_voo_id) REFERENCES voos(voo_id),
    FOREIGN KEY (opv_func_id) REFERENCES funcionarios(func_id)
);

#Tabela de Relação Aeroportos e Voos
CREATE TABLE IF NOT EXISTS voos_aeroportos (
    vopa_voo_id INT,
    vopa_aer_id INT,
    vopa_tipo ENUM('Partida', 'Chegada') NOT NULL,
    PRIMARY KEY (vopa_voo_id, vopa_aer_id, vopa_tipo),
    FOREIGN KEY (vopa_voo_id) REFERENCES voos(voo_id),
    FOREIGN KEY (vopa_aer_id) REFERENCES aeroportos(aer_id)
);
