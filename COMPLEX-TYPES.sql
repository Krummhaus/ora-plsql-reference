-- 5.12.2024
-- covers %TYPE, %ROWTYPE, %TABLE, %RECORD

-- %TYPE
DECLARE  
 x_bal_id M_STAGE.bal_id%TYPE;
 -- with another schenma
 --x_bal_id <SCHEMA>.M_STAGE.bal_id%TYPE;
 
 -- asign type as above 'x_bal_id' TYPE
 x_run_id x_bal_id%TYPE;

BEGIN
  -- Initialize variable with asignment ':='
  --x_bal_id := 12411101001;
  -- Or SELECT INTO
  SELECT bal_id
  INTO x_bal_id
  FROM M_STAGE
  WHERE ROWNUM = 1; -- Ensures only the first row is fetched
  
  x_run_id := 9;
  
  -- print
  DBMS_OUTPUT.PUT_LINE(x_bal_id || ' ' || x_run_id);
END;
/

--SELECT * FROM M_STAGE WHERE ROWNUM = 1;
-- %ROWTYPE
-- ------------------------------------
DECLARE
  stageRec M_STAGE%ROWTYPE;
BEGIN
  SELECT *
  INTO stageRec
  FROM M_STAGE
  WHERE ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(stageRec.bal_id
                       || ' ' ||
                       stageRec.run_id 
                       || ' ' ||
                       stageRec.iter_id 
                       || ' ' ||
                       stageRec.fme_stage 
                       || ' ' ||
                       stageRec.table_name 
                       || ' ' ||
                       stageRec.time_stamp 
  ); 
END;
/

-- ------------------------------------
-- %TABLE
DECLARE 
TYPE mStageArray 
  IS TABLE OF M_STAGE%ROWTYPE;
  mStageData mStageArray;   -- Variable to hold the table of records
BEGIN 
  SELECT *
  BULK COLLECT INTO mStageData
  FROM M_STAGE
  WHERE rownum < 9;

  -- Table header
  DBMS_OUTPUT.PUT_LINE('BAL_ID    '|| ' ' || 'TABLE_NAME');
  DBMS_OUTPUT.PUT_LINE('--------------------------------');

  FOR i IN 1..mStageData.COUNT LOOP
   DBMS_OUTPUT.PUT_LINE(mStageData(i).bal_id || ' ' || mStageData(i).table_name);
  END LOOP;
END;

-- ------------------------------------
-- %RECORD
DECLARE 
  -- Define a record type to hold individual rows
  TYPE mStageArray IS RECORD (
              bonus NUMBER(6),
              bal_id M_STAGE.bal_id%TYPE,
              table_name M_STAGE.table_name%TYPE
            );
  
  -- Define a collection type to hold multiple records
  TYPE mStageArrayTable IS TABLE OF mStageArray;
  
  -- Variable to hold the collection of records
  mStageData mStageArrayTable;   
BEGIN 
  -- Collect the data into the collection
  SELECT 0, bal_id, table_name  -- Setting bonus to 0 as an example, since it's not part of the SELECT query
  BULK COLLECT INTO mStageData
  FROM M_STAGE
  WHERE rownum < 9;

  -- Table header
  DBMS_OUTPUT.PUT_LINE('BONUS   BAL_ID   TABLE_NAME');
  DBMS_OUTPUT.PUT_LINE('--------------------------------');

  -- Loop through the collection and print the results
  FOR i IN 1..mStageData.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(
                          mStageData(i).bonus
                          || ' ' ||
                          mStageData(i).bal_id
                          || ' ' ||
                          mStageData(i).table_name);
  END LOOP;
END;
/

-- ------------------------------------
