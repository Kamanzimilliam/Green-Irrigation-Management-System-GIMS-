-- Make sure audit log table exists
DESC audit_log;

-- Optional: clear previous test logs
DELETE FROM audit_log;
COMMIT;

-- Optional: clear today's holiday (for testing)
DELETE FROM holidays WHERE holiday_date = TRUNC(SYSDATE);
COMMIT;
-- Insert today as holiday (ignore if exists)
BEGIN
    INSERT INTO holidays(holiday_date, description)
    SELECT TRUNC(SYSDATE), 'Test Holiday'
    FROM dual
    WHERE NOT EXISTS (
        SELECT 1 FROM holidays WHERE holiday_date = TRUNC(SYSDATE)
    );
END;
/
COMMIT;
BEGIN
    INSERT INTO IRRIGATION_SESSIONS(field_id, pump_id, start_time, end_time, water_used_l, energy_used_kwh)
    VALUES (1, 1, SYSTIMESTAMP, SYSTIMESTAMP + NUMTODSINTERVAL(1,'HOUR'), 1000, 5);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Weekday Insert: ' || SQLERRM);
END;
/
SELECT * FROM audit_log
WHERE action_type = 'INSERT'
ORDER BY action_date DESC;
CREATE OR REPLACE FUNCTION check_restriction RETURN BOOLEAN IS
BEGIN
    RETURN TRUE;  -- Temporarily allow all inserts
END;
/

INSERT INTO IRRIGATION_SESSIONS(field_id, pump_id, start_time, end_time, water_used_l, energy_used_kwh)
VALUES (1, 1, SYSTIMESTAMP, SYSTIMESTAMP + NUMTODSINTERVAL(1,'HOUR'), 1000, 5);
COMMIT;

-- Check that the session was inserted
SELECT * FROM IRRIGATION_SESSIONS
ORDER BY start_time DESC;

-- Check audit log
SELECT * FROM audit_log
ORDER BY action_date DESC;
INSERT INTO holidays(holiday_date, description)
VALUES (TRUNC(SYSDATE+1), 'Tomorrow Holiday');
COMMIT;

-- Simulate a restricted insert on holiday
BEGIN
    INSERT INTO IRRIGATION_SESSIONS(field_id, pump_id, start_time, end_time, water_used_l, energy_used_kwh)
    VALUES (2, 1, SYSTIMESTAMP+1, SYSTIMESTAMP+NUMTODSINTERVAL(1,'HOUR')+1, 1100, 6);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Holiday Insert: ' || SQLERRM);
END;
/

-- Check audit log for this attempt
SELECT * FROM audit_log
ORDER BY action_date DESC;
SELECT * 
FROM audit_log
ORDER BY action_date DESC;