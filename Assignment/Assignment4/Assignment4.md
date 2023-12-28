SET SERVEROUTPUT ON
SET VERIFY OFF
-- link to the images


CREATE OR REPLACE PROCEDURE findSal(
    p_doc_id IN NUMBER
)
IS
    v_salary NUMBER;
    v_bonus NUMBER;
    v_doc_name VARCHAR2(50);
BEGIN
    SELECT SALPERMON, ANNUAL_BONUS, doc_name
    INTO v_salary, v_bonus, v_doc_name
    FROM doctor
    WHERE doc_id = p_doc_id;

    DBMS_OUTPUT.PUT_LINE('The salary for Dr.' || v_doc_name || ' (' || p_doc_id || ') is: ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('The bonus is: ' || v_bonus);
END;
/





SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE updateNextAppointment AS
  v_first_name PATIENT.PT_FNAME%TYPE;
  v_last_name PATIENT.PT_LNAME%TYPE;
  v_new PATIENT.PTDOB%TYPE;
  v_next_appointment_date PATIENT.NEXTAPPTDATE%TYPE;
BEGIN
  v_first_name := '&First';
  v_last_name := '&Last';
  v_next_appointment_date := '01-JUL-05';
  v_new := '&date';
  
  UPDATE PATIENT
  SET NEXTAPPTDATE = v_next_appointment_date
  WHERE PT_FNAME = v_first_name
    AND PT_LNAME = v_last_name;
    
  DBMS_OUTPUT.PUT_LINE('The data has been updated: ' || v_new);
  DBMS_OUTPUT.PUT_LINE('The original next appointment date was ' || v_next_appointment_date);
  
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Patient not found.');
    
END;
/
