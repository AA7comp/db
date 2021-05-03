SET SERVEROUTPUT ON;
DECLARE
TYPE game IS TABLE OF VARCHAR2(1000);
TYPE rates  IS TABLE OF VARCHAR2(1000);
games game;
rate rates;
total integer;
BEGIN
games := game('Garena Free Fire - The Cobra', 'Clash of Clans', 'PUBG MOBILE: Graffiti Prank', 'Subway Surfers', 'Clash Royale');
rate:= rates('80678661', '55170976', '35971961', '35305263', '30599283');
total := games.count;
FOR i IN 1 .. total LOOP
dbms_output.put_line('Games:'||games(i)||', Rating:' || ' ' ||  rate(i));
end loop;
END;
/


create or replace type TYP_REC_GG as object
(
  CATEGORY VARCHAR2(26 BYTE)
)
/
create or replace type TYP_TAB_REC_GG is table of TYP_REC_GG

CREATE OR REPLACE function ret_cur return TYP_TAB_REC_GG
Is
  tab TYP_TAB_REC_GG := TYP_TAB_REC_GG(NULL);
  Cursor C_GG is
  Select UNIQUE CATEGORY
  From   GG;
  i pls_integer := 0 ;
Begin
  For i in C_GG Loop
    tab.extend;
    tab(tab.count) := TYP_REC_GG(i.CATEGORY);
  End loop ;
  return tab ;
End;


SELECT * FROM TABLE(ret_cur)