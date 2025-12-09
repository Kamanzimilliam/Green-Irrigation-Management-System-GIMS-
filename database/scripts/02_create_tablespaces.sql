-- 02_create_tablespaces.sql
-- Connect to your PDB first:
-- CONNECT / AS SYSDBA
-- ALTER SESSION SET CONTAINER = kamanzi_27523_milliam_gims_db;

CREATE TABLESPACE gims_data_ts
  DATAFILE '/u01/app/oracle/oradata/kamanzi_27523_milliam_gims_db/gims_data01.dbf'
  SIZE 500M AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED
  EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE TABLESPACE gims_index_ts
  DATAFILE '/u01/app/oracle/oradata/kamanzi_27523_milliam_gims_db/gims_index01.dbf'
  SIZE 200M AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED
  EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE TEMPORARY TABLESPACE gims_temp_ts
  TEMPFILE '/u01/app/oracle/oradata/kamanzi_27523_milliam_gims_db/gims_temp01.dbf'
  SIZE 200M AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED;

-- Optional undo tablespace (if you manage UNDO manually)
-- CREATE UNDO TABLESPACE gims_undo_ts DATAFILE '/u01/.../gims_undo01.dbf' SIZE 200M AUTOEXTEND ON NEXT 50M;
