
-- app
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (1,"Evernote","Libreta, planificador y organizador diario para tomar notas","Stepan Pachikov","6.13.14.7474","40456");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (2,"Instagram","Te acercamos a las personas y las cosas que te importan","Meta","283.0.0.0.104","40457");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (3,"LaLiga fantasy","Compite contra tus amigos en el juego de manager de fútbol oficial de LaLiga","Marca","4.7.6.0","40458");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (4,"Duolingo","Aprende a hablar, escribir y leer en inglés y en otros idiomas gratis!","Duolingo","2.0","40459");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (5,"SM Educamos Familias","SM Educamos pone al colegio en la palma de tu mano","SM","1.34.1","40460");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (6,"BurgerKing","Pide comida a domicilio. Ofertas y cuones exclusivos también en restaurantes","Burguer King","7.4.8","40461");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (7,"Netflix","Netflix es el servicio lider de suscripción para ver series y películas","Netflix","8.66.1","40462");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (8,"Intellij","Entorno de desarrollo integrado para el desarrollo e programas informáticos","JetBrains","2023.1.1","40463");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (9,"Visual Studio Code","Editor de código fuente","Microsoft","1.78.2","40464");
INSERT INTO CPDCS_Apps (idApp,AppName,AppDescription,Developer,Version,VersionReleaseDate) VALUES (10,"VirtualBox","Software de virtualización para arquitecturas x86/amd64","Oracle","6.1.26","40465");

-- cdps
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (1,-59731700,373828300,30,20,50);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (2,-59731700,373828300,55,15,30);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (3,-59731700,373828300,22,48,30);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (4,-59731700,373828300,70,5,15);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (5,-59731700,373828300,30,20,50);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (6,-59731700,373828300,55,15,30);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (7,-59731700,373828300,22,48,30);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (8,-59731700,373828300,70,5,15);
INSERT INTO CPDCS_CPDs (idCPD,Longitude,Latitude,PercentageUsed,PercentageReserved,PercentageFree) VALUES (9,-59731700,373828300,42,18,40);

-- cdpsMensualUsage
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (1,1,"Enero",50);
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (2,1,"Febrero",75);
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (3,2,"Enero",20);
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (4,3,"Enero",30);
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (5,3,"Febrero",42);
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (6,4,"Enero",51);
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (7,4,"Febrero",86);
INSERT INTO CPDCS_CPDs_MensualUsage (idCPDMensualUsage,CPDs_X_idCPD,MonthName,ResourcesUsage) VALUES (8,4,"Marzo",72);

-- periodicity
INSERT INTO CPDCS_Periodicity (idPeriodicity,PeriodicityName) VALUES (1,"Diario");
INSERT INTO CPDCS_Periodicity (idPeriodicity,PeriodicityName) VALUES (2,"2 días");
INSERT INTO CPDCS_Periodicity (idPeriodicity,PeriodicityName) VALUES (3,"3 días");
INSERT INTO CPDCS_Periodicity (idPeriodicity,PeriodicityName) VALUES (4,"4 días");
INSERT INTO CPDCS_Periodicity (idPeriodicity,PeriodicityName) VALUES (5,"Semanal");
INSERT INTO CPDCS_Periodicity (idPeriodicity,PeriodicityName) VALUES (6,"Mensual");

-- eventType
INSERT INTO CPDCS_EventType (idEventType,EventTypeName) VALUES (1,"Consumo electrico en KW/h");

-- events ERROR
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (1,1,"44936",1,1,100);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (2,1,"44936",4,1,200);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (3,1,"44936",5,1,250);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (4,2,"44936",5,1,150);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (5,2,"44936",2,1,225);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (6,2,"44936",4,1,245);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (7,3,"44936",5,1,265);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (8,3,"44936",5,1,285);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (9,4,"44936",5,1,305);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (10,4,"44936",5,1,325);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (11,5,"44936",1,1,345);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (12,6,"44936",2,1,365);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (13,6,"44936",3,1,385);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (14,6,"44936",4,1,405);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (15,7,"44936",5,1,425);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (16,7,"44936",5,1,445);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (17,8,"44936",5,1,465);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (18,9,"44936",5,1,485);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (19,9,"44936",5,1,505);
INSERT INTO CPDCS_CPDs_Events (idCPDEvents,CPDs_X_idCPD,EventDate,Perodicity_X_idPeriodicity,EventType_X_idEventType,KWhConsumption) VALUES (20,9,"44936",5,1,525);


-- state

INSERT INTO CPDCS_State (idState,StateName) VALUES (1,"Encendido");
INSERT INTO CPDCS_State (idState,StateName) VALUES (2,"Apagado");
INSERT INTO CPDCS_State (idState,StateName) VALUES (3,"Suspension");
INSERT INTO CPDCS_State (idState,StateName) VALUES (4,"Mantenimiento");

-- software
INSERT INTO CPDCS_SoftwareType (idSoftwareType,SoftwareTypeName) VALUES (1,"Base de Datos");
INSERT INTO CPDCS_SoftwareType (idSoftwareType,SoftwareTypeName) VALUES (2,"MicroServicios");
INSERT INTO CPDCS_SoftwareType (idSoftwareType,SoftwareTypeName) VALUES (3,"Servidor de aplicaciones");

-- vm
INSERT INTO CPDCS_VirtualMachines (idVirtualMachine,VirtualMachineName,VirtualMachineDescription,CPUAmount,RAMAmount,StorageAmount,State_X_idState,SoftwareType_X_idSoftwareType,CPDs_x_idCPD) VALUES (1,"VM1","xxxxxxxxxx",1,1,1,1,1,1);
INSERT INTO CPDCS_VirtualMachines (idVirtualMachine,VirtualMachineName,VirtualMachineDescription,CPUAmount,RAMAmount,StorageAmount,State_X_idState,SoftwareType_X_idSoftwareType,CPDs_x_idCPD) VALUES (2,"VM2","xxxxxxxxxx",1,1,1,1,1,1);
INSERT INTO CPDCS_VirtualMachines (idVirtualMachine,VirtualMachineName,VirtualMachineDescription,CPUAmount,RAMAmount,StorageAmount,State_X_idState,SoftwareType_X_idSoftwareType,CPDs_x_idCPD) VALUES (3,"VM3","xxxxxxxxxx",1,1,1,1,2,2);
INSERT INTO CPDCS_VirtualMachines (idVirtualMachine,VirtualMachineName,VirtualMachineDescription,CPUAmount,RAMAmount,StorageAmount,State_X_idState,SoftwareType_X_idSoftwareType,CPDs_x_idCPD) VALUES (4,"VM4","xxxxxxxxxx",1,1,1,1,3,3);
INSERT INTO CPDCS_VirtualMachines (idVirtualMachine,VirtualMachineName,VirtualMachineDescription,CPUAmount,RAMAmount,StorageAmount,State_X_idState,SoftwareType_X_idSoftwareType,CPDs_x_idCPD) VALUES (5,"VM5","xxxxxxxxxx",1,1,1,1,1,5);
INSERT INTO CPDCS_VirtualMachines (idVirtualMachine,VirtualMachineName,VirtualMachineDescription,CPUAmount,RAMAmount,StorageAmount,State_X_idState,SoftwareType_X_idSoftwareType,CPDs_x_idCPD) VALUES (6,"VM6","xxxxxxxxxx",1,1,1,1,2,4);

-- balancingPolicy
INSERT INTO CPDCS_BalancingPolicy (idBalancingPolicy,BalancingPolicyName) VALUES (1,"Round");
INSERT INTO CPDCS_BalancingPolicy (idBalancingPolicy,BalancingPolicyName) VALUES (2,"Robin");
INSERT INTO CPDCS_BalancingPolicy (idBalancingPolicy,BalancingPolicyName) VALUES (3,"FILO");

-- balancers
INSERT INTO CPDCS_Balancers (idBalancer,BalancersName,BalancersDescription,IPAdress,BalancingPolicy_X_idBalancingPolicy,RequestsPerHours,RequestsPerMinutes,RequestsPerSecond,CPDs_x_idCPD) VALUES (1,"b1","x","000.000.0.00",1,1,1,1,1);
INSERT INTO CPDCS_Balancers (idBalancer,BalancersName,BalancersDescription,IPAdress,BalancingPolicy_X_idBalancingPolicy,RequestsPerHours,RequestsPerMinutes,RequestsPerSecond,CPDs_x_idCPD) VALUES (2,"b2","x","000.000.0.00",2,1,1,1,2);
INSERT INTO CPDCS_Balancers (idBalancer,BalancersName,BalancersDescription,IPAdress,BalancingPolicy_X_idBalancingPolicy,RequestsPerHours,RequestsPerMinutes,RequestsPerSecond,CPDs_x_idCPD) VALUES (3,"b3","x","000.000.0.00",3,1,1,1,3);

-- finished
INSERT INTO CPDCS_Finished (idFinished,Finished) VALUES (1,"ok");
INSERT INTO CPDCS_Finished (idFinished,Finished) VALUES (2,"not ok");

-- servers 
INSERT INTO CPDCS_Servers (idServer,InternalName,ExternalName,TotalSpaceAvailable,TotalSpaceAssigned,CPDs_X_idCPD) VALUES (1,"x1","y1",20,80,1);
INSERT INTO CPDCS_Servers (idServer,InternalName,ExternalName,TotalSpaceAvailable,TotalSpaceAssigned,CPDs_X_idCPD) VALUES (2,"x2","y2",20,80,2);
INSERT INTO CPDCS_Servers (idServer,InternalName,ExternalName,TotalSpaceAvailable,TotalSpaceAssigned,CPDs_X_idCPD) VALUES (3,"x3","y3",20,80,3);

-- login
INSERT INTO CPDCS_Login (idLogin,Finished_X_idFinished,LoginDate,Servers_X_idServer) VALUES (1,1,"2023-05-21",1);
INSERT INTO CPDCS_Login (idLogin,Finished_X_idFinished,LoginDate,Servers_X_idServer) VALUES (2,1,"2023-05-20",2);
INSERT INTO CPDCS_Login (idLogin,Finished_X_idFinished,LoginDate,Servers_X_idServer) VALUES (3,2,"2023-05-22",3);

-- time
INSERT INTO CPDCS_Time (idTime,DataTime) VALUES (1,1);
INSERT INTO CPDCS_Time (idTime,DataTime) VALUES (2,2);
INSERT INTO CPDCS_Time (idTime,DataTime) VALUES (3,3);

-- Authentificationmechanism
INSERT INTO CPDCS_AuthenticationMechanism (idAuthenticationMechanism,AuthenticationMechanismName) VALUES (1,1);
INSERT INTO CPDCS_AuthenticationMechanism (idAuthenticationMechanism,AuthenticationMechanismName) VALUES (2,2);
INSERT INTO CPDCS_AuthenticationMechanism (idAuthenticationMechanism,AuthenticationMechanismName) VALUES (3,3);

-- Authentification_time
INSERT INTO CPDCS_Time_Authentication (idTime_Authentication,Time_X_idTime,AuthenticationMechanism_X_idAuthenticationMechanism) VALUES (1,1,1);
INSERT INTO CPDCS_Time_Authentication (idTime_Authentication,Time_X_idTime,AuthenticationMechanism_X_idAuthenticationMechanism) VALUES (2,2,2);
INSERT INTO CPDCS_Time_Authentication (idTime_Authentication,Time_X_idTime,AuthenticationMechanism_X_idAuthenticationMechanism) VALUES (3,3,3);

-- LoginGroup
INSERT INTO CPDCS_LoginGroup (idLoginGroup,Time_Authentication_X_idTime_Authentication,TotalLogin) VALUES (1,1,58);
INSERT INTO CPDCS_LoginGroup (idLoginGroup,Time_Authentication_X_idTime_Authentication,TotalLogin) VALUES (2,2,2);
INSERT INTO CPDCS_LoginGroup (idLoginGroup,Time_Authentication_X_idTime_Authentication,TotalLogin) VALUES (3,3,98);
INSERT INTO CPDCS_LoginGroup (idLoginGroup,Time_Authentication_X_idTime_Authentication,TotalLogin) VALUES (4,3,31);
INSERT INTO CPDCS_LoginGroup (idLoginGroup,Time_Authentication_X_idTime_Authentication,TotalLogin) VALUES (5,3,69);

-- disponibility
INSERT INTO CPDCS_Disponibility (idDisponibility,DisponibilityName) VALUES (1,"High Availability");
INSERT INTO CPDCS_Disponibility (idDisponibility,DisponibilityName) VALUES (2,"Low Availability");

-- Importance
INSERT INTO CPDCS_Importance (idImportance,ImportanceName) VALUES (1,"Primario");
INSERT INTO CPDCS_Importance (idImportance,ImportanceName) VALUES (2,"Secundario");

-- virtualMachine_app
INSERT INTO CPDCS_VirtualMachine_X_App (idVirtualMachineApp,App_X_idApp,VirtualMachine_X_idVirtualMachine,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (1,1,1,1,1);
INSERT INTO CPDCS_VirtualMachine_X_App (idVirtualMachineApp,App_X_idApp,VirtualMachine_X_idVirtualMachine,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (2,1,3,1,1);
INSERT INTO CPDCS_VirtualMachine_X_App (idVirtualMachineApp,App_X_idApp,VirtualMachine_X_idVirtualMachine,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (3,2,2,1,1);

-- Balancers_X_App
INSERT INTO CPDCS_Balancers_X_App (idBalancerApp,App_X_idApp,Balancers_X_idBalancer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (1,1,1,1,1);
INSERT INTO CPDCS_Balancers_X_App (idBalancerApp,App_X_idApp,Balancers_X_idBalancer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (2,1,3,1,1);
INSERT INTO CPDCS_Balancers_X_App (idBalancerApp,App_X_idApp,Balancers_X_idBalancer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (3,2,2,2,1);

-- Server_X_App
INSERT INTO CPDCS_Server_X_App (idServerApp,App_X_idApp,Servers_X_idServer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (1,1,2,1,1);
INSERT INTO CPDCS_Server_X_App (idServerApp,App_X_idApp,Servers_X_idServer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (2,1,1,1,1);
INSERT INTO CPDCS_Server_X_App (idServerApp,App_X_idApp,Servers_X_idServer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (3,2,2,1,1);
INSERT INTO CPDCS_Server_X_App (idServerApp,App_X_idApp,Servers_X_idServer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (4,3,3,1,1);
INSERT INTO CPDCS_Server_X_App (idServerApp,App_X_idApp,Servers_X_idServer,Importance_X_idImportance,Disponibility_X_idDisponibility) VALUES (5,3,3,1,1);