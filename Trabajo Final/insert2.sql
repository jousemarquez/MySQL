-- Insertar registros en CPDCS_Apps
INSERT INTO CPDCS_Apps (AppName, AppDescription, Developer, Version, VersionReleaseDate) VALUES
('App1', 'Descripción de la App 1', 'Desarrollador 1', '1.0', '2022-01-01'),
('App2', 'Descripción de la App 2', 'Desarrollador 2', '2.0', '2022-02-01'),
('App3', 'Descripción de la App 3', 'Desarrollador 3', '3.0', '2022-03-01');

-- Insertar registros en CPDCS_CPDs
INSERT INTO CPDCS_CPDs (Longitude, Latitude, PercentageUsed, PercentageReserved, PercentageFree) VALUES
(10.1234, 20.5678, 50.0, 30.0, 20.0),
(30.9876, 40.5432, 60.0, 20.0, 20.0),
(50.2468, 60.1357, 70.0, 10.0, 20.0);

-- Insertar registros en CPDCS_CPDs_MensualUsage
INSERT INTO CPDCS_CPDs_MensualUsage (CPDs_X_idCPD, MonthName, ResourcesUsage) VALUES
(1, 'Enero', 1000.0),
(1, 'Febrero', 1500.0),
(1, 'Marzo', 2000.0),
(2, 'Enero', 800.0),
(2, 'Febrero', 1200.0),
(2, 'Marzo', 1600.0),
(3, 'Enero', 600.0),
(3, 'Febrero', 900.0),
(3, 'Marzo', 1200.0);

-- Insertar registros en CPDCS_Periodicity
INSERT INTO CPDCS_Periodicity (PeriodicityName) VALUES
('Diario'),
('Semanal'),
('Mensual');

-- Insertar registros en CPDCS_EventType
INSERT INTO CPDCS_EventType (EventTypeName) VALUES
('Evento1'),
('Evento2'),
('Evento3');

-- Insertar registros en CPDCS_CPDs_Events
INSERT INTO CPDCS_CPDs_Events (CPDs_X_idCPD, EventDate, Perodicity_X_idPeriodicity, EventType_X_idEventType, KWhConsumption) VALUES
(1, '2022-01-01', 1, 1, 100.0),
(1, '2022-02-01', 2, 2, 150.0),
(1, '2022-03-01', 3, 3, 200.0),
(2, '2022-01-01', 1, 1, 80.0),
(2, '2022-02-01', 2, 2, 120.0),
(2, '2022-03-01', 3, 3, 160.0),
(3, '2022-01-01', 1, 1, 60.0),
(3, '2022-02-01', 2, 2, 90.0),
(3, '2022-03-01', 3, 3, 120.0);

-- Insertar registros en

 CPDCS_State
INSERT INTO CPDCS_State (StateName) VALUES
('Activo'),
('Inactivo'),
('Pausado');

-- Insertar registros en CPDCS_SoftwareType
INSERT INTO CPDCS_SoftwareType (SoftwareTypeName) VALUES
('Software1'),
('Software2'),
('Software3');

-- Insertar registros en CPDCS_VirtualMachines
INSERT INTO CPDCS_VirtualMachines (VirtualMachineName, VirtualMachineDescription, CPUAmount, RAMAmount, StorageAmount, State_X_idState, SoftwareType_X_idSoftwareType, CPDs_x_idCPD) VALUES
('VM1', 'Descripción de VM1', 4, 8.0, 500.0, 1, 1, 1),
('VM2', 'Descripción de VM2', 2, 4.0, 250.0, 2, 2, 2),
('VM3', 'Descripción de VM3', 8, 16.0, 1000.0, 3, 3, 3);

-- Insertar registros en CPDCS_BalancingPolicy
INSERT INTO CPDCS_BalancingPolicy (BalancingPolicyName) VALUES
('Política1'),
('Política2'),
('Política3');

-- Insertar registros en CPDCS_Balancers
INSERT INTO CPDCS_Balancers (BalancersName, BalancersDescription, IPAdress, BalancingPolicy_X_idBalancingPolicy, RequestsPerHours, RequestsPerMinutes, RequestsPerSecond, CPDs_x_idCPD) VALUES
('Balancer1', 'Descripción de Balancer1', '192.168.1.1', 1, 1000, 60, 1, 1),
('Balancer2', 'Descripción de Balancer2', '192.168.1.2', 2, 2000, 120, 2, 2),
('Balancer3', 'Descripción de Balancer3', '192.168.1.3', 3, 3000, 180, 3, 3);

-- Insertar registros en CPDCS_Finished
INSERT INTO CPDCS_Finished (Finished) VALUES
('Sí'),
('No');

-- Insertar registros en CPDCS_Servers
INSERT INTO CPDCS_Servers (InternalName, ExternalName, TotalSpaceAvailable, TotalSpaceAssigned, CPDs_X_idCPD) VALUES
('Servidor1', 'Server1', 1000.0, 500.0, 1),
('Servidor2', 'Server2', 2000.0, 1000.0, 2),
('Servidor3', 'Server3', 3000.0, 1500.0, 3);

-- Insertar registros en CPDCS_Login
INSERT INTO CPDCS_Login (Finished_X_idFinished, LoginDate, Servers_X_idServer) VALUES
(1, '2022-01-01', 1),
(1, '2022-02-01', 2),
(2, '2022-03-01', 3);

-- Insertar registros en CPDCS_Time
INSERT INTO CPDCS_Time (DataTime) VALUES
('Tiempo1'),
('Tiempo2'),
('Tiempo3');

-- Insertar registros en CPDCS_AuthenticationMechanism
INSERT INTO CPDCS_AuthenticationMechanism (AuthenticationMechanismName) VALUES
('Mecanismo1'),
('Mecanismo2'),
('Mecanismo3');

-- Insertar registros en CPDCS_Time_Authentication


INSERT INTO CPDCS_Time_Authentication (idTime_Authentication, Time_X_idTime, AuthenticationMechanism_X_idAuthenticationMechanism) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Insertar registros en CPDCS_LoginGroup
INSERT INTO CPDCS_LoginGroup (Time_Authentication_X_idTime_Authentication, TotalLogin) VALUES
(1, 10),
(2, 20),
(3, 30);

-- Insertar registros en CPDCS_Disponibility
INSERT INTO CPDCS_Disponibility (DisponibilityName) VALUES
('Disponibilidad1'),
('Disponibilidad2'),
('Disponibilidad3');

-- Insertar registros en CPDCS_Importance
INSERT INTO CPDCS_Importance (ImportanceName) VALUES
('Importancia1'),
('Importancia2'),
('Importancia3');

-- Insertar registros en CPDCS_VirtualMachine_X_App
INSERT INTO CPDCS_VirtualMachine_X_App (App_X_idApp, VirtualMachine_X_idVirtualMachine, Importance_X_idImportance, Disponibility_X_idDisponibility) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- Insertar registros en CPDCS_Balancers_X_App
INSERT INTO CPDCS_Balancers_X_App (App_X_idApp, Balancers_X_idBalancer, Importance_X_idImportance, Disponibility_X_idDisponibility) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- Insertar registros en CPDCS_Server_X_App
INSERT INTO CPDCS_Server_X_App (App_X_idApp, Servers_X_idServer, Importance_X_idImportance, Disponibility_X_idDisponibility) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);