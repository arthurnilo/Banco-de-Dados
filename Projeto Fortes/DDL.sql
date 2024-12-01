CREATE DATABASE ProjetoFortes;

USE ProjetoFortes;

-- Tabela de projetos
CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    Objective VARCHAR(255) NOT NULL,
    Justification VARCHAR(255) NOT NULL,
    ThematicArea VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    EstimatedValue DECIMAL(15, 2) NOT NULL,
    Status VARCHAR(45) NOT NULL
);

-- Tabela de doadores
CREATE TABLE IF NOT EXISTS Donors (
    DonorID INT PRIMARY KEY,
    DonorName VARCHAR(100) NOT NULL,
    DonorType VARCHAR(45) NOT NULL,
    CNPJ VARCHAR(18),
    RepresentativeCPF VARCHAR(14) NOT NULL,
    RegularityStatus VARCHAR(45) NOT NULL,
    State VARCHAR(2) NOT NULL,
    ZipCode VARCHAR(11) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Neighborhood VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Complement VARCHAR(255),
    Number VARCHAR(10) NOT NULL
);

-- Tabela de doações
CREATE TABLE IF NOT EXISTS Donations (
    DonationID INT PRIMARY KEY,
    Amount DECIMAL(15, 2) NOT NULL,
    DonationDate DATE,
    DonationType VARCHAR(45) NOT NULL,
    ProjectID INT,
    CONSTRAINT FK_Donations_Project FOREIGN KEY(ProjectID) REFERENCES Projects(ProjectID)
);

-- Tabela de relatórios
CREATE TABLE IF NOT EXISTS Reports (
    ReportID INT PRIMARY KEY,
    SubmissionDate DATE,
    ReportType VARCHAR(45) NOT NULL,
    ProjectID INT,
    CONSTRAINT FK_Reports_Project FOREIGN KEY(ProjectID) REFERENCES Projects(ProjectID)
);

-- Tabela de editais
CREATE TABLE IF NOT EXISTS Notices (
    NoticeID INT PRIMARY KEY,
    NoticeName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE
);

-- Tabela de comissão
CREATE TABLE IF NOT EXISTS Commission (
    CommissionID INT PRIMARY KEY,
    MemberName VARCHAR(100),
    Position VARCHAR(45) NOT NULL,
    Contact VARCHAR(45) NOT NULL
);

-- Tabela de associação entre projetos e comissão
CREATE TABLE IF NOT EXISTS ProjectCommission (
    ProjectID INT,
    CommissionID INT,
    PRIMARY KEY(ProjectID, CommissionID),
    CONSTRAINT FK_PC_Project FOREIGN KEY(ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE,
    CONSTRAINT FK_PC_Commission FOREIGN KEY(CommissionID) REFERENCES Commission(CommissionID) ON DELETE CASCADE
);
