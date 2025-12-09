-- 05_enable_archivelog.sql
-- Run as SYSDBA connected to the CDB or appropriate container

-- Check current mode
-- SELECT log_mode FROM v$database;

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
-- Verify:
-- SELECT log_mode FROM v$database;
