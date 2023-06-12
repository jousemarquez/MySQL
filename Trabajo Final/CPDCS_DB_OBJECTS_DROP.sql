-- DROP EACH CPDCS_DB_OBJECT
-- by Ricardo Álamo & José Antonio Márquez (1º DAW/DAM Vedruna 2022/2023)

-- NOTE: This script drop each object (functions, procedures and triggers) in this data base previously created by CPDCS_DB OBJECTS.sql

-- Drop Trigger
DROP TRIGGER IF EXISTS UpdateWebStatistics;
DROP TABLE IF EXISTS CPDCS_WebStatistics;

-- Drop Procedure
DROP PROCEDURE IF EXISTS UpdateCPDElectricityUsage;

-- Drop Functions
DROP FUNCTION IF EXISTS GetFreeDiskSpacePercentage;
DROP FUNCTION IF EXISTS GetLoginPercentage;
DROP FUNCTION IF EXISTS GetDistanceFromCPDS;