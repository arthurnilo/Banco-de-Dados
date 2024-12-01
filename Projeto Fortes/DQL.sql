-- Seleciona todos os dados da tabela de projetos
SELECT * FROM Projects;

-- Seleciona todos os dados da tabela de doadores
SELECT * FROM Donors;

-- Seleciona informações de doações juntamente com o nome do projeto associado
SELECT Donations.DonationID, Donations.Amount, Donations.DonationDate, Donations.DonationType, Projects.ProjectName
FROM Donations
JOIN Projects ON Donations.ProjectID = Projects.ProjectID;

-- Seleciona informações de relatórios juntamente com o nome do projeto associado
SELECT Reports.ReportID, Reports.SubmissionDate, Reports.ReportType, Projects.ProjectName
FROM Reports
JOIN Projects ON Reports.ProjectID = Projects.ProjectID;

-- Seleciona todos os dados da tabela de editais
SELECT * FROM Notices;

-- Seleciona todos os dados da tabela de comissão
SELECT * FROM Commission;

-- Seleciona o nome dos projetos e os membros da comissão associados a esses projetos
SELECT Projects.ProjectName, Commission.MemberName, Commission.Position
FROM ProjectCommission
JOIN Projects ON ProjectCommission.ProjectID = Projects.ProjectID
JOIN Commission ON ProjectCommission.CommissionID = Commission.CommissionID;

-- Seleciona todos os projetos que estão em andamento
SELECT * FROM Projects
WHERE Status = 'Em Andamento';

-- Seleciona todos os doadores do tipo 'Privada'
SELECT * FROM Donors
WHERE DonorType = 'Privada';

-- Seleciona o nome dos projetos e o número de doações associadas a cada projeto
SELECT Projects.ProjectName, COUNT(Donations.DonationID) AS NumberOfDonations
FROM Donations
JOIN Projects ON Donations.ProjectID = Projects.ProjectID
GROUP BY Projects.ProjectName;
