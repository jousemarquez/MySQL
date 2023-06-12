-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS CPDCS_DB;

-- Crear la base de datos
CREATE DATABASE CPDCS_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos
USE CPDCS_DB;

-- Eliminar las tablas si existen
DROP TABLE IF EXISTS CPDCS_Server_X_App;
DROP TABLE IF EXISTS CPDCS_Balancers_X_App;
DROP TABLE IF EXISTS CPDCS_VirtualMachine_X_App;
DROP TABLE IF EXISTS CPDCS_Importance;
DROP TABLE IF EXISTS CPDCS_Disponibility;
DROP TABLE IF EXISTS CPDCS_LoginGroup;
DROP TABLE IF EXISTS CPDCS_Time_Authentication;
DROP TABLE IF EXISTS CPDCS_AuthenticationMechnism;
DROP TABLE IF EXISTS CPDCS_Time;
DROP TABLE IF EXISTS CPDCS_Login;
DROP TABLE IF EXISTS CPDCS_Servers;
DROP TABLE IF EXISTS CPDCS_Finished;
DROP TABLE IF EXISTS CPDCS_Balancers;
DROP TABLE IF EXISTS CPDCS_BalancingPolicy;
DROP TABLE IF EXISTS CPDCS_VirtualMachines;
DROP TABLE IF EXISTS CPDCS_SoftwareType;
DROP TABLE IF EXISTS CPDCS_State;
DROP TABLE IF EXISTS CPDCS_CPDs_Events;
DROP TABLE IF EXISTS CPDCS_EventType;
DROP TABLE IF EXISTS CPDCS_Periodicity;
DROP TABLE IF EXISTS CPDCS_CPDs_MensualUsage;
DROP TABLE IF EXISTS CPDCS_CPDs;
DROP TABLE IF EXISTS CPDCS_Apps;

-- Crear tabla CPDCS_Apps
CREATE TABLE CPDCS_Apps (
  idApp BIGINT PRIMARY KEY AUTO_INCREMENT,
  AppName VARCHAR(80),
  AppDescription VARCHAR(150),
  Developer VARCHAR(80),
  Version VARCHAR(30),
  VersionReleaseDate VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_CPDs
CREATE TABLE CPDCS_CPDs (
  idCPD BIGINT PRIMARY KEY AUTO_INCREMENT,
  Longitude FLOAT,
  Latitude FLOAT,
  PercentageUsed FLOAT,
  PercentageReserved FLOAT,
  PercentageFree FLOAT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_CPDs_MensualUsage
CREATE TABLE CPDCS_CPDs_MensualUsage (
  idCPDMensualUsage BIGINT PRIMARY KEY AUTO_INCREMENT,
  CPDs_X_idCPD BIGINT,
  MonthName VARCHAR(10),
  ResourcesUsage FLOAT,
  FOREIGN KEY (CPDs_X_idCPD) REFERENCES CPDCS_CPDs (idCPD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Periodicity
CREATE TABLE CPDCS_Periodicity (
  idPeriodicity BIGINT PRIMARY KEY AUTO_INCREMENT,
  PeriodicityName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_EventType
CREATE TABLE CPDCS_EventType (
  idEventType BIGINT PRIMARY KEY AUTO_INCREMENT,
  EventTypeName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_APPs_Events
CREATE TABLE CPDCS_CPDs_Events (
  idCPDEvents BIGINT PRIMARY KEY AUTO_INCREMENT,
  CPDs_X_idCPD BIGINT,
  EventDate VARCHAR(30),
  Perodicity_X_idPeriodicity BIGINT,
  EventType_X_idEventType BIGINT,
  KWhConsumption FLOAT,
  FOREIGN KEY (CPDs_X_idCPD) REFERENCES CPDCS_CPDs (idCPD),
  FOREIGN KEY (Perodicity_X_idPeriodicity) REFERENCES CPDCS_Periodicity (idPeriodicity),
  FOREIGN KEY (EventType_X_idEventType) REFERENCES CPDCS_EventType (idEventType)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_State
CREATE TABLE CPDCS_State (
  idState BIGINT PRIMARY KEY AUTO_INCREMENT,
  StateName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_SoftwareType
CREATE TABLE CPDCS_SoftwareType (
  idSoftwareType BIGINT PRIMARY KEY AUTO_INCREMENT,
  SoftwareTypeName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_VirtualMachines
CREATE TABLE CPDCS_VirtualMachines (
  idVirtualMachine BIGINT PRIMARY KEY AUTO_INCREMENT,
  VirtualMachineName VARCHAR(80),
  VirtualMachineDescription VARCHAR(120),
  CPUAmount INT,
  RAMAmount FLOAT,
  StorageAmount FLOAT,
  State_X_idState BIGINT,
  SoftwareType_X_idSoftwareType BIGINT,
  CPDs_x_idCPD BIGINT,
  FOREIGN KEY (State_X_idState) REFERENCES CPDCS_State (idState),
  FOREIGN KEY (SoftwareType_X_idSoftwareType) REFERENCES CPDCS_SoftwareType (idSoftwareType),
  FOREIGN KEY (CPDs_x_idCPD) REFERENCES CPDCS_CPDs (idCPD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_BalancingPolicy
CREATE TABLE CPDCS_BalancingPolicy (
  idBalancingPolicy BIGINT PRIMARY KEY AUTO_INCREMENT,
  BalancingPolicyName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Balancers
CREATE TABLE CPDCS_Balancers (
  idBalancer BIGINT PRIMARY KEY AUTO_INCREMENT,
  BalancersName VARCHAR(80),
  BalancersDescription VARCHAR(120),
  IPAdress VARCHAR(20),
  BalancingPolicy_X_idBalancingPolicy BIGINT,
  RequestsPerHours INT,
  RequestsPerMinutes INT,
  RequestsPerSecond INT,
  CPDs_x_idCPD BIGINT,
  FOREIGN KEY (BalancingPolicy_X_idBalancingPolicy) REFERENCES CPDCS_BalancingPolicy (idBalancingPolicy),
  FOREIGN KEY (CPDs_x_idCPD) REFERENCES CPDCS_CPDs (idCPD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Finished
CREATE TABLE CPDCS_Finished (
  idFinished BIGINT PRIMARY KEY AUTO_INCREMENT,
  Finished VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Servers
CREATE TABLE CPDCS_Servers (
  idServer BIGINT PRIMARY KEY AUTO_INCREMENT,
  InternalName VARCHAR(80),
  ExternalName VARCHAR(80),
  TotalSpaceAvailable FLOAT,
  TotalSpaceAssigned FLOAT,
  CPDs_X_idCPD BIGINT,
  FOREIGN KEY (CPDs_X_idCPD) REFERENCES CPDCS_CPDs (idCPD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Login
CREATE TABLE CPDCS_Login (
  idLogin BIGINT PRIMARY KEY AUTO_INCREMENT,
  Finished_X_idFinished BIGINT,
  LoginDate DATE,
  Servers_X_idServer BIGINT,
  FOREIGN KEY (Finished_X_idFinished) REFERENCES CPDCS_Finished (idFinished),
  FOREIGN KEY (Servers_X_idServer) REFERENCES CPDCS_Servers (idServer)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Time
CREATE TABLE CPDCS_Time (
  idTime BIGINT PRIMARY KEY AUTO_INCREMENT,
  DataTime VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_AuthenticationMechnism
CREATE TABLE CPDCS_AuthenticationMechanism (
  idAuthenticationMechanism BIGINT PRIMARY KEY AUTO_INCREMENT,
  AuthenticationMechanismName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Time_Authentication
CREATE TABLE CPDCS_Time_Authentication (
  idTime_Authentication BIGINT PRIMARY KEY,
  Time_X_idTime BIGINT,
  AuthenticationMechanism_X_idAuthenticationMechanism BIGINT,
  FOREIGN KEY (Time_X_idTime) REFERENCES CPDCS_Time(idTime),
  FOREIGN KEY (AuthenticationMechanism_X_idAuthenticationMechanism) REFERENCES CPDCS_AuthenticationMechanism(idAuthenticationMechanism)
);

-- Crear tabla CPDCS_LoginGroup
CREATE TABLE CPDCS_LoginGroup (
  idLoginGroup BIGINT PRIMARY KEY AUTO_INCREMENT,
  Time_Authentication_X_idTime_Authentication BIGINT,
  TotalLogin INT,
  FOREIGN KEY (Time_Authentication_X_idTime_Authentication) REFERENCES CPDCS_Time_Authentication (idTime_Authentication)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Disponibility
CREATE TABLE CPDCS_Disponibility (
  idDisponibility BIGINT PRIMARY KEY AUTO_INCREMENT,
  DisponibilityName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Importance
CREATE TABLE CPDCS_Importance (
  idImportance BIGINT PRIMARY KEY AUTO_INCREMENT,
  ImportanceName VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_VirtualMachine_X_App
CREATE TABLE CPDCS_VirtualMachine_X_App (
  idVirtualMachineApp BIGINT PRIMARY KEY AUTO_INCREMENT,
  App_X_idApp BIGINT,
  VirtualMachine_X_idVirtualMachine BIGINT,
  Importance_X_idImportance BIGINT,
  Disponibility_X_idDisponibility BIGINT,
  FOREIGN KEY (App_X_idApp) REFERENCES CPDCS_Apps (idApp),
  FOREIGN KEY (VirtualMachine_X_idVirtualMachine) REFERENCES CPDCS_VirtualMachines (idVirtualMachine),
  FOREIGN KEY (Importance_X_idImportance) REFERENCES CPDCS_Importance (idImportance),
  FOREIGN KEY (Disponibility_X_idDisponibility) REFERENCES CPDCS_Disponibility (idDisponibility)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Balancers_X_App
CREATE TABLE CPDCS_Balancers_X_App (
  idBalancerApp BIGINT PRIMARY KEY AUTO_INCREMENT,
  App_X_idApp BIGINT,
  Balancers_X_idBalancer BIGINT,
  Importance_X_idImportance BIGINT,
  Disponibility_X_idDisponibility BIGINT,
  FOREIGN KEY (App_X_idApp) REFERENCES CPDCS_Apps (idApp),
  FOREIGN KEY (Balancers_X_idBalancer) REFERENCES CPDCS_Balancers (idBalancer),
  FOREIGN KEY (Importance_X_idImportance) REFERENCES CPDCS_Importance (idImportance),
  FOREIGN KEY (Disponibility_X_idDisponibility) REFERENCES CPDCS_Disponibility (idDisponibility)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla CPDCS_Server_X_App
CREATE TABLE CPDCS_Server_X_App (
  idServerApp BIGINT PRIMARY KEY AUTO_INCREMENT,
  App_X_idApp BIGINT,
  Servers_X_idServer BIGINT,
  Importance_X_idImportance BIGINT,
  Disponibility_X_idDisponibility BIGINT,
  FOREIGN KEY (App_X_idApp) REFERENCES CPDCS_Apps (idApp),
  FOREIGN KEY (Servers_X_idServer) REFERENCES CPDCS_Servers (idServer),
  FOREIGN KEY (Importance_X_idImportance) REFERENCES CPDCS_Importance (idImportance),
  FOREIGN KEY (Disponibility_X_idDisponibility) REFERENCES CPDCS_Disponibility (idDisponibility)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
