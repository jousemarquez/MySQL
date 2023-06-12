-- ALL CPDCS_DB OBJECTS RUN SCRIPT
-- by Ricardo Álamo & José Antonio Márquez (1º DAW/DAM Vedruna 2022/2023)

-- NOTE: This script show each runneable and call for this DB object.

-- Function 1: Execute Function GetFreeDiskSpacePercentage()
SELECT GetFreeDiskSpacePercentage(1);
-- Function 2: Execute Function GetLoginPercentage()
SELECT GetLoginPercentage(3);
-- Function 3: Execute Function GetDistanceFromCPDS()
SELECT GetDistanceFromCPDs(1,2);
-- Procedure:
-- Excecute Event for UpdateCPDElectricityUsage
-- Service Event on data base setting should be launch with the following query:
SET GLOBAL event_scheduler=ON;

-- Drop the event if it was launched previously:
DROP EVENT IF EXISTS UpdateConsumptionEvent;

-- Event creation:
CREATE EVENT IF NOT EXISTS UpdateConsumptionEvent
ON SCHEDULE
    EVERY 1 DAY
    STARTS '2023-05-25 15:32:00'
DO
    CALL UpdateCPDElectricityUsage();