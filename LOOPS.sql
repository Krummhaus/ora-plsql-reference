-- New script in MROSZ.
-- Date: Dec 6, 2024
-- Time: 9:23:36 AM
-- jiri.kalina.jr@gmail.com

/* 
# Loops

Frequently a series of program statements must execute iteratively.
PL/SQL allows for this by using Loops.

## All Loops have the following basic elements:

- A **LOOP** clause which defines the starting point of the loop.
- Any number of execution statements follow the loop.
- The **EXIT** or **EXIT WHEN** clause allows you to abort the loop.
- The **CONTINUE** or **CONTINUE WHEN** clause allows you to exit
  the current iteration of the loop.
- An **END LOOP** statement terminates the loop definition.
*/

-- Fixed iteration loop
DECLARE 

BEGIN 
  --FOR i IN 1..9 LOOP
  FOR i IN REVERSE 1..9 LOOP
    DBMS_OUTPUT.PUT_LINE(i ** 2);
  END LOOP; 

-- **WHEN OTHERS** is a catch-all exception handler in PL/SQL.
-- It is used in the EXCEPTION block to handle any error like:
-- Pythons:
--    except Exception as e:
--       print(f"An unexpected error occurred: {e}")
EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('An unexpected error occurred!');
  ROLLBACK;

END;

/* 
# Indefinite Loops

- Indefinite loops execute indefinitely until either an exception occurs
  or the **EXIT** statement is issued.
- The beginning and ending statements are **LOOP…END LOOP**.
*/

--SET SERVEROUTPUT ON;

DECLARE
  counter NUMBER := 0; -- Initialize the counter
BEGIN
  LOOP
    counter := counter + 1; -- Increment the counter
    DBMS_OUTPUT.PUT_LINE('Counter: ' || counter); -- Print the counter value
    
    EXIT WHEN counter = 6; 
  END LOOP;
END;
DECLARE
  counter NUMBER := 0; -- Initialize the counter
BEGIN
  LOOP
    counter := counter + 1; -- Increment the counter
    DBMS_OUTPUT.PUT_LINE('Counter: ' || counter); -- Print the counter value
    
    EXIT WHEN counter = 6; -- Exit the loop when counter equals 6
  END LOOP;
END;
/

/* 
# Conditional Loops

- Conditional loops execute indefinitely while a given
  condition is **TRUE**.
- Generally this loop is used when the loop logic changes
  the conditional expression.
*/

DECLARE
  counter NUMBER := 0; -- Initialize the counter
BEGIN
   WHILE counter < 4 LOOP
    counter := counter + 1; -- Increment the counter
      DBMS_OUTPUT.PUT_LINE('Counter: ' || counter); -- Print the counter value
  END LOOP;
END;
/

-- Nested Loop
DECLARE
BEGIN
  FOR i IN 1..3 LOOP
      DBMS_OUTPUT.PUT_LINE('LOOP_1: ' || i);
    FOR j IN 1..3 LOOP
      DBMS_OUTPUT.PUT_LINE('  LOOP_2: ' || j);
      FOR k IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('    LOOP_3: ' || k);
    END LOOP;
    END LOOP;
  END LOOP;
END;












