--1
create or replace FUNCTION find_paid(name gg.title%TYPE)
RETURN VARCHAR
IS
    typs VARCHAR2(100);
BEGIN
    SELECT paid
    INTO typs
    FROM gg WHERE title = name;
    RETURN typs;
END;

SET SERVEROUTPUT ON;
DECLARE
names VARCHAR2(100);
BEGIN
names := find_paid('Durak Online');
dbms_output.put_line('' || ' ' ||  names);
END;

--2
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

--3
create or replace type TYPE_MAIN as object
(
  TITLE VARCHAR2(128 BYTE),
  CATEGORY VARCHAR2(26 BYTE),
  PRICE NUMBER(38,5)
)

create or replace type TYP is table of TYPE_MAIN


CREATE OR REPLACE FUNCTION f_last
RETURN TYP IS
 tab TYP := TYP();
   CURSOR C_GG is 
      SELECT  TITLE, CATEGORY, PRICE FROM GG; 
BEGIN 
    For i in C_GG Loop 
      EXIT WHEN C_GG%notfound; 
      tab.extend;
      tab(tab.count):= TYPE_MAIN(null, null, null);
        tab(tab.count).TITLE := i.TITLE;
         tab(tab.count).CATEGORY := i.CATEGORY;
          tab(tab.count).PRICE := i.PRICE;
   END LOOP; 
     return tab ;
END;


create or replace type tbl_main as object
(
RANK NUMBER(38,0),
TITLE VARCHAR2(128 BYTE),
TOTAL_RATINGS NUMBER(38,0),
FIVE_STAR_RATINGS NUMBER(38,0),
FOUR_STAR_RATINGS NUMBER(38,0),
THREE_STAR_RATINGS NUMBER(38,0),
TWO_STAR_RATINGS NUMBER(38,0),
ONE_STAR_RATINGS NUMBER(38,0)
);

reate or replace type tbl is table of tbl_main


--4
CREATE OR REPLACE FUNCTION func_rate
RETURN tbl 
IS
CURSOR c1 is
    SELECT RANK, TITLE, TOTAL_RATINGS, FIVE_STAR_RATINGS, FOUR_STAR_RATINGS, THREE_STAR_RATINGS, TWO_STAR_RATINGS, ONE_STAR_RATINGS
    FROM GG;
t_tbl tbl := tbl();
BEGIN
FOR i IN c1 LOOP
t_tbl.EXTEND();
EXIT WHEN c1%NOTFOUND;
t_tbl(t_tbl.count):= tbl_main(null,null,null,null,null,null,null,null);
t_tbl(t_tbl.count).RANK := i.RANK;
t_tbl(t_tbl.count).TITLE := i.TITLE;
t_tbl(t_tbl.count).TOTAL_RATINGS := i.TOTAL_RATINGS;
t_tbl(t_tbl.count).FIVE_STAR_RATINGS := i.FIVE_STAR_RATINGS;
t_tbl(t_tbl.count).FOUR_STAR_RATINGS := i.FOUR_STAR_RATINGS;
t_tbl(t_tbl.count).THREE_STAR_RATINGS := i.THREE_STAR_RATINGS;
t_tbl(t_tbl.count).TWO_STAR_RATINGS := i.TWO_STAR_RATINGS;
t_tbl(t_tbl.count).ONE_STAR_RATINGS := i.ONE_STAR_RATINGS;               
END LOOP; 
RETURN t_tbl;
END;


SELECT * FROM (func_rate())

--5
CREATE OR REPLACE FUNCTION get_direct_info(
      catg IN gg.category%TYPE)
   RETURN SYS_REFCURSOR
AS
   direct SYS_REFCURSOR;
BEGIN

   OPEN direct FOR 
   SELECT 
      title,
       growth_30D
   FROM 
      gg
   WHERE 
     category  = catg
   ORDER BY 
       title;
   RETURN direct;
END;


--cursor
DECLARE
   direct SYS_REFCURSOR;
   new_title gg.title%TYPE;
   new_grow gg.growth_30D%TYPE;
BEGIN
   direct := get_direct_info('GAME ADVENTURE'); 
   
   LOOP
      FETCH
         direct
      INTO
        new_title,
        new_grow;
      EXIT
   WHEN direct%notfound;
      dbms_output.put_line(new_title || ' ' || new_grow );
   END LOOP;
   
   CLOSE direct;
END;
/
