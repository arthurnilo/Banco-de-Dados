USE EST_CASOV;

-- Tabela clientes
INSERT INTO clientes (clientes_cpf, clientes_nome, clientes_datanasc, clientes_rua, clientes_numrua, clientes_bairro, clientes_cidade, clientes_uf, clientes_pais, clientes_cep, clientes_status)
VALUES (12345678901, 'João Silva', '1985-01-15', 'Rua A', 123, 'Bairro X', 'Cidade Y', 'SP', 'Brasil', '12345-678', 'Concluído');
INSERT INTO clientes (clientes_cpf, clientes_nome, clientes_datanasc, clientes_rua, clientes_numrua, clientes_bairro, clientes_cidade, clientes_uf, clientes_pais, clientes_cep, clientes_status)
VALUES (23456789012, 'Maria Oliveira', '1990-04-20', 'Rua B', 456, 'Bairro Y', 'Cidade Z', 'RJ', 'Brasil', '23456-789', 'Pendente');
INSERT INTO clientes (clientes_cpf, clientes_nome, clientes_datanasc, clientes_rua, clientes_numrua, clientes_bairro, clientes_cidade, clientes_uf, clientes_pais, clientes_cep, clientes_status)
VALUES (34567890123, 'Pedro Santos', '1982-09-10', 'Rua C', 789, 'Bairro Z', 'Cidade W', 'MG', 'Brasil', '34567-890', 'Em espera');
INSERT INTO clientes (clientes_cpf, clientes_nome, clientes_datanasc, clientes_rua, clientes_numrua, clientes_bairro, clientes_cidade, clientes_uf, clientes_pais, clientes_cep, clientes_status)
VALUES (45678901234, 'Ana Costa', '1995-06-12', 'Rua D', 101, 'Bairro W', 'Cidade X', 'ES', 'Brasil', '45678-901', 'Pendente');
INSERT INTO clientes (clientes_cpf, clientes_nome, clientes_datanasc, clientes_rua, clientes_numrua, clientes_bairro, clientes_cidade, clientes_uf, clientes_pais, clientes_cep, clientes_status)
VALUES (56789012345, 'Carlos Almeida', '1988-12-25', 'Rua E', 202, 'Bairro V', 'Cidade Y', 'PR', 'Brasil', '56789-012', 'Concluído');

UPDATE clientes SET clientes_status = 'Concluído' WHERE clientes_cpf = 23456789012;
UPDATE clientes SET clientes_status = 'Em espera' WHERE clientes_cpf = 34567890123;

DELETE FROM clientes WHERE clientes_cpf = 45678901234;

-- Tabela produtos
INSERT INTO produtos (produtos_cod, produtos_categoria, produtos_preco, produtos_quantidade) 
VALUES (1, 'Eletrônicos', 1000.00, 20);
INSERT INTO produtos (produtos_cod, produtos_categoria, produtos_preco, produtos_quantidade) 
VALUES (2, 'Roupas', 150.00, 50);
INSERT INTO produtos (produtos_cod, produtos_categoria, produtos_preco, produtos_quantidade) 
VALUES (3, 'Alimentos', 5.50, 200);
INSERT INTO produtos (produtos_cod, produtos_categoria, produtos_preco, produtos_quantidade) 
VALUES (4, 'Livros', 30.00, 10);
INSERT INTO produtos (produtos_cod, produtos_categoria, produtos_preco, produtos_quantidade) 
VALUES (5, 'Ferramentas', 50.00, 100);

UPDATE produtos SET produtos_preco = 1100.00 WHERE produtos_cod = 1;
UPDATE produtos SET produtos_quantidade = 30 WHERE produtos_cod = 2;

DELETE FROM produtos WHERE produtos_cod = 5;

-- Tabela fornecedores
INSERT INTO fornecedores (fornecedores_cnpj, fornecedores_contato, fornecedores_nome)
VALUES (12345678000100, 'João Silva', 'Fornecedor A');
INSERT INTO fornecedores (fornecedores_cnpj, fornecedores_contato, fornecedores_nome)
VALUES (23456789000100, 'Maria Oliveira', 'Fornecedor B');
INSERT INTO fornecedores (fornecedores_cnpj, fornecedores_contato, fornecedores_nome)
VALUES (34567890000100, 'Pedro Santos', 'Fornecedor C');
INSERT INTO fornecedores (fornecedores_cnpj, fornecedores_contato, fornecedores_nome)
VALUES (45678901000100, 'Ana Costa', 'Fornecedor D');
INSERT INTO fornecedores (fornecedores_cnpj, fornecedores_contato, fornecedores_nome)
VALUES (56789012000100, 'Carlos Almeida', 'Fornecedor E');

UPDATE fornecedores SET fornecedores_contato = 'Carlos Souza' WHERE fornecedores_cnpj = 23456789000100;
UPDATE fornecedores SET fornecedores_nome = 'Fornecedor F' WHERE fornecedores_cnpj = 34567890000100;

DELETE FROM fornecedores WHERE fornecedores_cnpj = 56789012000100;

-- Tabela vendas
INSERT INTO vendas (vendas_cod, vendas_clientes) VALUES (1, 12345678901);
INSERT INTO vendas (vendas_cod, vendas_clientes) VALUES (2, 23456789012);
INSERT INTO vendas (vendas_cod, vendas_clientes) VALUES (3, 34567890123);
INSERT INTO vendas (vendas_cod, vendas_clientes) VALUES (4, 45678901234);
INSERT INTO vendas (vendas_cod, vendas_clientes) VALUES (5, 56789012345);

UPDATE vendas SET vendas_clientes = 23456789012 WHERE vendas_cod = 1;
UPDATE vendas SET vendas_clientes = 34567890123 WHERE vendas_cod = 2;

DELETE FROM vendas WHERE vendas_cod = 4;

-- Tabela pagamentos
INSERT INTO pagamentos (pagamentos_cod, pagamentos_data, pagamentos_valor, pagamentos_status, pagamentos_forma, pagamentos_vendas)
VALUES (1, '2024-05-01', 150.00, 'Pendente', 'Cartão', 1);
INSERT INTO pagamentos (pagamentos_cod, pagamentos_data, pagamentos_valor, pagamentos_status, pagamentos_forma, pagamentos_vendas)
VALUES (2, '2024-05-02', 200.00, 'Concluído', 'Boleto', 2);
INSERT INTO pagamentos (pagamentos_cod, pagamentos_data, pagamentos_valor, pagamentos_status, pagamentos_forma, pagamentos_vendas)
VALUES (3, '2024-05-03', 250.00, 'Em espera', 'Pix', 3);
INSERT INTO pagamentos (pagamentos_cod, pagamentos_data, pagamentos_valor, pagamentos_status, pagamentos_forma, pagamentos_vendas)
VALUES (4, '2024-05-04', 100.00, 'Pendente', 'Dinheiro', 4);
INSERT INTO pagamentos (pagamentos_cod, pagamentos_data, pagamentos_valor, pagamentos_status, pagamentos_forma, pagamentos_vendas)
VALUES (5, '2024-05-05', 120.00, 'Concluído', 'Cartão', 5);

UPDATE pagamentos SET pagamentos_status = 'Concluído' WHERE pagamentos_cod = 1;
UPDATE pagamentos SET pagamentos_forma = 'Transferência' WHERE pagamentos_cod = 2;

DELETE FROM pagamentos WHERE pagamentos_cod = 5;

-- Tabela fornecedores_produtos
INSERT INTO fornecedores_produtos (fp_fornecedores, fp_produtos) VALUES (12345678000100, 1);
INSERT INTO fornecedores_produtos (fp_fornecedores, fp_produtos) VALUES (23456789000100, 2);
INSERT INTO fornecedores_produtos (fp_fornecedores, fp_produtos) VALUES (34567890000100, 3);
INSERT INTO fornecedores_produtos (fp_fornecedores, fp_produtos) VALUES (45678901000100, 4);
INSERT INTO fornecedores_produtos (fp_fornecedores, fp_produtos) VALUES (56789012000100, 5);

UPDATE fornecedores_produtos SET fp_fornecedores = 23456789000100 WHERE fp_produtos = 1;
UPDATE fornecedores_produtos SET fp_produtos = 4 WHERE fp_fornecedores = 34567890000100;

DELETE FROM fornecedores_produtos WHERE fp_fornecedores = 56789012000100 AND fp_produtos = 5;

-- Tabela produtos_vendas
INSERT INTO produtos_vendas (pv_quantidade, pv_valorvenda, pv_produtos, pv_vendas)
VALUES (10, 100.00, 1, 1);
INSERT INTO produtos_vendas (pv_quantidade, pv_valorvenda, pv_produtos, pv_vendas)
VALUES (20, 150.00, 2, 2);
INSERT INTO produtos_vendas (pv_quantidade, pv_valorvenda, pv_produtos, pv_vendas)
VALUES (30, 200.00, 3, 3);
INSERT INTO produtos_vendas (pv_quantidade, pv_valorvenda, pv_produtos, pv_vendas)
VALUES (40, 250.00, 4, 4);
INSERT INTO produtos_vendas (pv_quantidade, pv_valorvenda, pv_produtos, pv_vendas)
VALUES (50, 300.00, 5, 5);

UPDATE produtos_vendas SET pv_valorvenda = 120.00 WHERE pv_produtos = 1;
UPDATE produtos_vendas SET pv_quantidade = 35 WHERE pv_produtos = 3;

DELETE FROM produtos_vendas WHERE pv_produtos = 5;
