-- 01_create_pdb.sql
-- Run as SYSDBA connected to the root container (CDB$ROOT)

-- Example: create a PDB from seed
CREATE PLUGGABLE DATABASE kamanzi_27523_milliam_gims_db
  ADMIN USER kamanzi_admin IDENTIFIED BY milliam
  FILE_NAME_CONVERT = ('/u01/app/oracle/oradata/ORCLCDB/pdbseed/',
                       '/u01/app/oracle/oradata/kamanzi_27523_milliam_gims_db/')
  -- specify FILE_NAME_CONVERT paths as per your server;
  -- adjust physical path for your environment
;

-- Open the PDB
ALTER PLUGGABLE DATABASE kamanzi_27523_milliam_gims_db OPEN;

-- Optional: Save state so it opens automatically on instance startup
ALTER PLUGGABLE DATABASE kamanzi_27523_milliam_gims_db SAVE STATE;
