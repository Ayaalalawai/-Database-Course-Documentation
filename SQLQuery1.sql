CREATE DATABASE CompanySystem;
USE CompanySystem;

CREATE TABLE Employee (
    SSN int primary key identity(1,1),
    FirstName nvarchar(20),
    LastName nvarchar(20),
    BirthDate date,
    Gender bit default 0,
    Supervise int,
    DepNumber int
);

ALTER TABLE Employee
ADD FOREIGN KEY (DepNumber) REFERENCES Department(DepNumber);

ALTER TABLE Employee
ADD FOREIGN KEY (Supervise) REFERENCES Employee(SSN);

CREATE TABLE Department (
    DepNumber int primary key identity(1,1),
    DepName nvarchar(20),
    SSN int,
    HireDate DATE,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

CREATE TABLE Location (
    DepNumber int,
    Location nvarchar(20),
    PRIMARY KEY (DepNumber, Location),
    FOREIGN KEY (DepNumber) REFERENCES Department(DepNumber)
);

CREATE TABLE Project (
    ProjectNumber int primary key identity(1,1),
    ProjectName nvarchar(20),
    City nvarchar(20),
    Location nvarchar(20),
    DepNumber int,
    FOREIGN KEY (DepNumber) REFERENCES Department(DepNumber)
);

CREATE TABLE Work (
    SSN int,
    ProjectNumber int,
    Hours int,
    PRIMARY KEY (SSN, ProjectNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (ProjectNumber) REFERENCES Project(ProjectNumber)
);

CREATE TABLE Dependent (
    SSN int,
    DependentName nvarchar(20) PRIMARY KEY,
    Gender int,
    BirthDate date,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);


DROP TABLE Dependent;
