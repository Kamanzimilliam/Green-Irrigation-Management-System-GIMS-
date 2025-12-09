-- 03_create_admin_user.sql
-- Connect to the PDB: ALTER SESSION SET CONTAINER = kamanzi_27523_milliam_gims_db;

CREATE USER kamanzi_admin IDENTIFIED BY milliam
  DEFAULT TABLESPACE gims_data_ts
  TEMPORARY TABLESPACE gims_temp_ts
  QUOTA UNLIMITED ON gims_data_ts;

-- Grants (fine-tune as per institution policy)
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE PROCEDURE,
      CREATE TRIGGER, CREATE TYPE, CREATE MATERIALIZED VIEW, UNLIMITED TABLESPACE TO kamanzi_admin;

-- If you want an admin role for managing schema objects:
GRANT CONNECT, RESOURCE TO kamanzi_admin;

-- Optional: grant DBA (not recommended unless sandbox)
-- GRANT DBA TO kamanzi_admin;
