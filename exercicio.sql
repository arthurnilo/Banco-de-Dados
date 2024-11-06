use exercicio1_dml;

-- 1
select * from participantes where empresa = "empresa A";

-- 2
select count(*) from participantes where timestampdiff(year, data_nasc, now()) > 20;

-- 3
select avg(timestampdiff(year, data_nasc, now())) as idade from participantes;

-- 4
select nome, timestampdiff(year, data_nasc, now()) as idade from participantes;

-- 5
select nome_evento from eventos where local_evento = "1";

-- 6
select nome_evento from eventos where data_evento = '2024-11-15';

-- 7
select count(*) from participantes;

-- 8
select nome, capacidade from locais;

-- 9
select avg(capacidade) as "media de capacidade" from locais;

-- 10
select nome_evento from eventos where entidade_evento = "ASSOCIAÇÃO DE TI";

-- 11
