USE ProjetoFortes;

-- Inserindo dados na tabela de projetos
INSERT INTO Projects (ProjectID, ProjectName, Objective, Justification, ThematicArea, StartDate, EndDate, EstimatedValue, Status)
VALUES
(1, 'Educação para Todos', 'Promover acesso à educação', 'Alta taxa de analfabetismo', 'Educação', '2024-01-01', '2024-12-31', 50000, 'Em Andamento'),
(2, 'Saúde na Comunidade', 'Melhorar atendimento médico', 'Falta de infraestrutura', 'Saúde', '2024-02-01', '2024-11-30', 75000, 'Planejado');

-- Inserindo dados na tabela de doadores
INSERT INTO Donors (DonorID, DonorName, DonorType, CNPJ, RepresentativeCPF, RegularityStatus, State, ZipCode, City, Neighborhood, Address, Complement, Number)
VALUES
(1, 'ONG Amigos do Bem', 'Privada', '12345678000199', '98765432100', 'Regular', 'SP', '01001000', 'São Paulo', 'Centro', 'Rua Central', 'Sala 101', '100'),
(2, 'Prefeitura de Vila Velha', 'Pública', NULL, '12345678901', 'Regular', 'ES', '29100000', 'Vila Velha', 'Praia da Costa', 'Av. Principal', 'Prefeitura', '1');

-- Inserindo dados na tabela de doações
INSERT INTO Donations (DonationID, Amount, DonationDate, DonationType, ProjectID)
VALUES
(1, 20000, '2024-03-01', 'Financeira', 1),
(2, 30000, '2024-04-01', 'Financeira', 2);

-- Inserindo dados na tabela de relatórios
INSERT INTO Reports (ReportID, SubmissionDate, ReportType, ProjectID)
VALUES
(1, '2024-05-01', 'Progresso', 1),
(2, '2024-06-01', 'Final', 2);

-- Inserindo dados na tabela de editais
INSERT INTO Notices (NoticeID, NoticeName, StartDate, EndDate)
VALUES
(1, 'Edital 2024', '2024-01-15', '2024-03-31'),
(2, 'Edital Saúde', '2024-04-01', '2024-06-30');

-- Inserindo dados na tabela de comissão
INSERT INTO Commission (CommissionID, MemberName, Position, Contact)
VALUES
(1, 'Maria Silva', 'Coordenadora', 'maria.silva@email.com'),
(2, 'João Souza', 'Analista', 'joao.souza@email.com');

-- Inserindo dados na tabela de associação entre projetos e comissão
INSERT INTO ProjectCommission (ProjectID, CommissionID)
VALUES
(1, 1),
(2, 2);
