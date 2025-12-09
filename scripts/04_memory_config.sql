-- 04_memory_config.sql
-- These settings may require server restart and depend on ARC/installation rights.
-- Run as SYSDBA on the CDB or use ALTER SYSTEM if allowed.

-- Example (adjust sizes to available RAM)
ALTER SYSTEM SET sga_target = 800M SCOPE = SPFILE;
ALTER SYSTEM SET pga_aggregate_target = 300M SCOPE = SPFILE;

-- If you prefer dynamic:
-- ALTER SYSTEM SET sga_target = 600M SCOPE = BOTH;
-- ALTER SYSTEM SET pga_aggregate_target = 200M SCOPE = BOTH;
