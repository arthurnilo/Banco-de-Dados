USE EST_CASOI;

-- Comandos de INSERT por tabela

-- Tabela FORNECEDORES
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_PAIS, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_CONTATO)
VALUES 
(1, 'Agropecuária Silva', 'Estrada do Campo', 700, 'Zona Rural', 'Cascavel', 'PR', 'Brasil', '85812-000', '(45) 3245-6578', 'joao.silva@agrosilva.com.br'),
(2, 'Distribuidora ABC', 'Avenida das Indústrias', 1234, 'Indústrias', 'Belo Horizonte', 'MG', 'Brasil', '31000-000', '(31) 3246-7890', 'contato@abcdistrib.com.br'),
(3, 'Mercado Central', 'Rua Central', 45, 'Centro', 'Curitiba', 'PR', 'Brasil', '80010-000', '(41) 3232-9090', 'lucas@mercadocentral.com.br'),
(4, 'Tecno Maquinas', 'Avenida das Nações', 203, 'Distrito Industrial', 'Campinas', 'SP', 'Brasil', '13050-000', '(19) 3242-9088', 'tecnomaquinas@equipamentos.com.br'),
(5, 'Soluções Agrícolas', 'Rua do Agro', 66, 'Agronomia', 'Pelotas', 'RS', 'Brasil', '96020-000', '(53) 3261-2245', 'vendas@solucoesagri.com.br');

-- Tabela FILIAIS
INSERT INTO FILIAIS (FILIAL_COD, FILIAL_NOME, FILIAL_RUA, FILIAL_NUMRUA, FILIAL_BAIRRO, FILIAL_CIDADE, FILIAL_ESTADO, FILIAL_CODPOSTAL, FILIAL_CAPACIDADE)
VALUES 
(1, 'Centro de Distribuição SP', 'Avenida Brasil', 789, 'Vila Olímpia', 'São Paulo', 'SP', '04570-000', '6000 produtos'),
(2, 'Centro de Distribuição RJ', 'Avenida das Américas', 1010, 'Barra da Tijuca', 'Rio de Janeiro', 'RJ', '22640-000', '5000 produtos'),
(3, 'Centro de Distribuição MG', 'Rua São Paulo', 1567, 'Centro', 'Belo Horizonte', 'MG', '30170-132', '4000 produtos'),
(4, 'Centro de Distribuição RS', 'Avenida Bento Gonçalves', 5500, 'Partenon', 'Porto Alegre', 'RS', '90650-001', '3500 produtos'),
(5, 'Centro de Distribuição PR', 'Rodovia BR-116', 3120, 'Boqueirão', 'Curitiba', 'PR', '81650-000', '4500 produtos');

-- Tabela PRODUTOS
INSERT INTO PRODUTOS (PROD_COD, PROD_NOME, PROD_DESCRICAO, PROD_ESPECTEC, PROD_QUANT, PROD_PRECOUNIT, PROD_UNIDMEDIDA, PROD_ESTOQ_MIN)
VALUES 
(1, 'Sementes de Milho', 'Milho híbrido de alta produtividade', 'Vem com tratamento contra pragas', 2000.0, 320.50, 'saco', 200.0),
(2, 'Adubo NPK 20-10-10', 'Adubo para uso em diversas culturas', 'Ideal para solos pobres em nutrientes', 500.0, 70.20, 'kg', 100.0),
(3, 'Trator Compacto', 'Trator para uso em pequenas propriedades', 'Trator com motor de 80 HP', 20.0, 75000.0, 'unidade', 2.0),
(4, 'Pesticida Orgânico', 'Produto natural para controle de pragas', 'Composto orgânico não agressivo ao meio ambiente', 1500.0, 120.00, 'litro', 100.0),
(5, 'Sementes de Soja', 'Sementes de soja para plantio', 'Variedade resistente a doenças', 1800.0, 280.75, 'saco', 150.0);

-- Comandos de UPDATE por tabela

-- Tabela FORNECEDORES
UPDATE FORNECEDORES SET FORNEC_NOME = 'Fornecedor ABC Ltda' WHERE FORNEC_COD = 1;
UPDATE FORNECEDORES SET FORNEC_CIDADE = 'Santos' WHERE FORNEC_COD = 2;

-- Tabela FILIAIS
UPDATE FILIAIS SET FILIAL_NOME = 'Filial SP Zona Sul' WHERE FILIAL_COD = 1;
UPDATE FILIAIS SET FILIAL_CAPACIDADE = '6000 produtos' WHERE FILIAL_COD = 2;

-- Tabela PRODUTOS
UPDATE PRODUTOS SET PROD_PRECOUNIT = 12.00 WHERE PROD_COD = 1;
UPDATE PRODUTOS SET PROD_QUANT = 450.0 WHERE PROD_COD = 2;

-- Tabela PEDIDOS
UPDATE PEDIDOS SET PED_STATUS = 'CONCLUÍDO' WHERE PED_CODIGO = 1;
UPDATE PEDIDOS SET PED_STATUS = 'EM ESPERA' WHERE PED_CODIGO = 3;

-- Tabela RECEBIMENTOS
UPDATE RECEBIMENTOS SET RECEB_CONDICAO = 'Excelente' WHERE RECEB_PEDIDOS = 1;
UPDATE RECEBIMENTOS SET RECEB_QUANT_PROD = 800.0 WHERE RECEB_PEDIDOS = 2;

-- Tabela PEDIDOS_PRODUTOS
UPDATE PEDIDOS_PRODUTOS SET PDPR_QUANT = 12.0 WHERE PDPR_PEDIDOS = 1 AND PDPR_PRODUTOS = 1;
UPDATE PEDIDOS_PRODUTOS SET PDPR_QUANT = 18.0 WHERE PDPR_PEDIDOS = 2 AND PDPR_PRODUTOS = 2;

-- Tabela FILIAIS_PRODUTOS
UPDATE FILIAIS_PRODUTOS SET FLPR_QUANT = 60.0 WHERE FLPR_FILIAL = 1 AND FLPR_PRODUTOS = 1;
UPDATE FILIAIS_PRODUTOS SET FLPR_QUANT = 35.0 WHERE FLPR_FILIAL = 2 AND FLPR_PRODUTOS = 2;

-- Tabela FORNECEDORES_PRODUTOS
UPDATE FORNECEDORES_PRODUTOS SET FRPR_FORNECEDOR = 1 WHERE FRPR_PRODUTOS = 2;
UPDATE FORNECEDORES_PRODUTOS SET FRPR_FORNECEDOR = 2 WHERE FRPR_PRODUTOS = 3;

-- 3. Comandos de DELETE por tabela

-- Tabela FORNECEDORES
DELETE FROM FORNECEDORES WHERE FORNEC_COD = 5;

-- Tabela FILIAIS
DELETE FROM FILIAIS WHERE FILIAL_COD = 5;

-- Tabela PRODUTOS
DELETE FROM PRODUTOS WHERE PROD_COD = 5;

-- Tabela PEDIDOS
DELETE FROM PEDIDOS WHERE PED_CODIGO = 5;

-- Tabela RECEBIMENTOS
DELETE FROM RECEBIMENTOS WHERE RECEB_PEDIDOS = 5;

-- Tabela PEDIDOS_PRODUTOS
DELETE FROM PEDIDOS_PRODUTOS WHERE PDPR_PEDIDOS = 5 AND PDPR_PRODUTOS = 5;

-- Tabela FILIAIS_PRODUTOS
DELETE FROM FILIAIS_PRODUTOS WHERE FLPR_FILIAL = 5 AND FLPR_PRODUTOS = 5;

-- Tabela FORNECEDORES_PRODUTOS
DELETE FROM FORNECEDORES_PRODUTOS WHERE FRPR_FORNECEDOR = 5 AND FRPR_PRODUTOS = 5;
