--SET SERVEROUTPUT ON;
/*
 Declaring data types
 DECLARE
  var1 NUMBER(3) NOT NULL := 999;
  var2 NUMBER(3) DEFAULT 999;
  var2 CONSTANT NUMBER(3) := 999;
 */

DECLARE 
  v_bal_id NUMBER := 10401101001;
  -- Declare cursor 'curStage' as SELECT
  CURSOR curStage IS
    SELECT *
    FROM M_STAGE
    WHERE BAL_ID = v_bal_id;
  -- Declare variable of type 'TABLE'
  TYPE containerForStage IS TABLE OF curStage%ROWTYPE;
  -- declare variable 'varTabStage' of TYPE 'containerForStage'.. like this "v_bal_id NUMBER;"
  varTabStage containerForStage;
BEGIN  
  <<this_is_label_for_GOTO_statement>>
  OPEN curStage;
  FETCH curStage BULK COLLECT INTO varTabStage LIMIT 9;
  CLOSE curStage;
  
  FOR i IN 1..varTabStage.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(varTabStage(i).BAL_ID || ' ' || varTabStage(i).TABLE_NAME);
  END LOOP;
END;
/

