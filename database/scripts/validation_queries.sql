-- validation_queries.sql
-- 1) Verify PDB open
SELECT name, open_mode FROM v$pdbs WHERE name = 'KAMANZI_27523_MILLIAM_GIMS_DB';

-- 2) List tablespaces
SELECT tablespace_name, status, contents FROM dba_tablespaces;

-- 3) Verify admin user
SELECT username, account_status, default_tablespace, temporary_tablespace FROM dba_users WHERE username='KAMANZI_ADMIN';

-- 4) Check quotas on tablespaces
SELECT * FROM dba_ts_quotas WHERE username='KAMANZI_ADMIN';

-- 5) Check memory settings (if accessible)
SHOW PARAMETER sga_target;
SHOW PARAMETER pga_aggregate_target;
