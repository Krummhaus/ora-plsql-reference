-- 5.12.2024

DECLARE  
  var1 NUMBER(3);
  var2 NUMBER(3) := 56;
  var3 BOOLEAN := FALSE;
  var3_str VARCHAR2(5); -- To store the string equivalent
  var4 CONSTANT number(1) := 1;
BEGIN
  var1 := 41;
  var3_str := CASE
      WHEN var3 IS NULL THEN 'NULL'
      WHEN var3 THEN 'TRUE'
      ELSE 'FALSE'
    END;

  FOR i IN 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE(
                          i
                          || ' ' ||
                          var1
                          || ' ' ||
                          var2
                          || ' ' ||
                          var3_str 
  );
  END LOOP;
END;