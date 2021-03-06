create or replace type TYP_REC_GG as object(CATEGORY VARCHAR2(26 BYTE))

create or replace type TYP_TAB_REC_GG is table of TYP_REC_GG

create or replace package gg_pack is
PROCEDURE DERRIVED_TABLE;

PROCEDURE gg_insert( --1
RANK IN GG.RANK%TYPE, 
    TITLE IN GG.TITLE%TYPE, 
    TOTAL_RATINGS IN GG.TOTAL_RATINGS%TYPE, 
    INSTALLS IN GG.INSTALLS%TYPE, 
    AVERAGE_RATING IN GG.AVERAGE_RATING%TYPE, 
    GROWTH_30D IN GG.GROWTH_30D%TYPE, 
    GROWTH_60D IN GG.GROWTH_60D%TYPE, 
    PRICE IN GG.PRICE%TYPE, 
    CATEGORY IN GG.CATEGORY%TYPE, 
    FIVE_STAR_RATINGS IN GG.FIVE_STAR_RATINGS%TYPE,
    FOUR_STAR_RATINGS IN GG.FOUR_STAR_RATINGS%TYPE,
    THREE_STAR_RATINGS IN GG.THREE_STAR_RATINGS%TYPE,
    TWO_STAR_RATINGS IN GG.TWO_STAR_RATINGS%TYPE,
    ONE_STAR_RATINGS IN GG.ONE_STAR_RATINGS%TYPE,
    PAID IN GG.PAID%TYPE,
    IMAGES IN GG.IMAGES%TYPE);
    
PROCEDURE gg_delete(gg_rank IN GG.RANK%TYPE); --2

PROCEDURE country_update( --3
gg_RANK IN GG.RANK%TYPE,
gg_TITLE IN GG.TITLE%TYPE, 
gg_TOTAL_RATINGS IN GG.TOTAL_RATINGS%TYPE, 
gg_INSTALLS IN GG.INSTALLS%TYPE, 
gg_AVERAGE_RATING IN GG.AVERAGE_RATING%TYPE, 
gg_GROWTH_30D IN GG.GROWTH_30D%TYPE, 
gg_GROWTH_60D IN GG.GROWTH_60D%TYPE, 
gg_PRICE IN GG.PRICE%TYPE, 
gg_CATEGORY IN GG.CATEGORY%TYPE, 
gg_FIVE_STAR_RATINGS IN GG.FIVE_STAR_RATINGS%TYPE,
gg_FOUR_STAR_RATINGS IN GG.FOUR_STAR_RATINGS%TYPE,
gg_THREE_STAR_RATINGS IN GG.THREE_STAR_RATINGS%TYPE,
gg_TWO_STAR_RATINGS IN GG.TWO_STAR_RATINGS%TYPE,
gg_ONE_STAR_RATINGS IN GG.ONE_STAR_RATINGS%TYPE,
gg_PAID IN GG.PAID%TYPE,
gg_IMAGES IN GG.IMAGES%TYPE);

PROCEDURE top_3; --4
PROCEDURE bottom_3; --5

end gg_pack;
/


--body
create or replace package body gg_pack is
PROCEDURE DERRIVED_TABLE IS
stroke VARCHAR2(20000);
BEGIN
stroke:='CREATE TABLE GG_LOG(
RANK NUMBER(38,0),
TITLE VARCHAR2(128 BYTE),
TOTAL_RATINGS  NUMBER(38,0),
INSTALLS VARCHAR2(128 BYTE),
AVERAGE_RATING NUMBER(38,0),
GROWTH_30D NUMBER(26,5),
GROWTH_60D NUMBER(26,5),
PRICE NUMBER(26,5),
CATEGORY VARCHAR2(26), 
FIVE_STAR_RATINGS NUMBER(26,5),
FOUR_STAR_RATINGS NUMBER(26,5),
THREE_STAR_RATINGS NUMBER(26,5),
TWO_STAR_RATINGS NUMBER(38,5),
ONE_STAR_RATINGS NUMBER(38,5),
PAID VARCHAR2(26 BYTE),
IMAGES VARCHAR2(150),
ACTION VARCHAR2(26 BYTE),
AUTHOR VARCHAR2(26 BYTE)
)';
EXECUTE IMMEDIATE stroke;
END;

PROCEDURE gg_insert( --1
RANK IN GG.RANK%TYPE, 
    TITLE IN GG.TITLE%TYPE, 
    TOTAL_RATINGS IN GG.TOTAL_RATINGS%TYPE, 
    INSTALLS IN GG.INSTALLS%TYPE, 
    AVERAGE_RATING IN GG.AVERAGE_RATING%TYPE, 
    GROWTH_30D IN GG.GROWTH_30D%TYPE, 
    GROWTH_60D IN GG.GROWTH_60D%TYPE, 
    PRICE IN GG.PRICE%TYPE, 
    CATEGORY IN GG.CATEGORY%TYPE, 
    FIVE_STAR_RATINGS IN GG.FIVE_STAR_RATINGS%TYPE,
    FOUR_STAR_RATINGS IN GG.FOUR_STAR_RATINGS%TYPE,
    THREE_STAR_RATINGS IN GG.THREE_STAR_RATINGS%TYPE,
    TWO_STAR_RATINGS IN GG.TWO_STAR_RATINGS%TYPE,
    ONE_STAR_RATINGS IN GG.ONE_STAR_RATINGS%TYPE,
    PAID IN GG.PAID%TYPE,
    IMAGES IN GG.IMAGES%TYPE)
IS 
BEGIN  
    INSERT INTO GG(                    
    RANK,
    TITLE, 
    TOTAL_RATINGS, 
    INSTALLS, 
    AVERAGE_RATING, 
    GROWTH_30D, 
    GROWTH_60D, 
    PRICE, 
    CATEGORY, 
    FIVE_STAR_RATINGS,
    FOUR_STAR_RATINGS,
    THREE_STAR_RATINGS,
    TWO_STAR_RATINGS,
    ONE_STAR_RATINGS,
    PAID,
    IMAGES)
VALUES (                    
    RANK,
    TITLE, 
    TOTAL_RATINGS, 
    INSTALLS, 
    AVERAGE_RATING, 
    GROWTH_30D, 
    GROWTH_60D, 
    PRICE, 
    CATEGORY, 
    FIVE_STAR_RATINGS,
    FOUR_STAR_RATINGS,
    THREE_STAR_RATINGS,
    TWO_STAR_RATINGS,
    ONE_STAR_RATINGS,
    PAID,
    IMAGES);
END;

PROCEDURE gg_delete(gg_rank IN GG.RANK%TYPE) --2
IS
BEGIN
  DELETE gg where rank = gg_rank;
END;

PROCEDURE country_update( --3
gg_RANK IN GG.RANK%TYPE,
gg_TITLE IN GG.TITLE%TYPE, 
gg_TOTAL_RATINGS IN GG.TOTAL_RATINGS%TYPE, 
gg_INSTALLS IN GG.INSTALLS%TYPE, 
gg_AVERAGE_RATING IN GG.AVERAGE_RATING%TYPE, 
gg_GROWTH_30D IN GG.GROWTH_30D%TYPE, 
gg_GROWTH_60D IN GG.GROWTH_60D%TYPE, 
gg_PRICE IN GG.PRICE%TYPE, 
gg_CATEGORY IN GG.CATEGORY%TYPE, 
gg_FIVE_STAR_RATINGS IN GG.FIVE_STAR_RATINGS%TYPE,
gg_FOUR_STAR_RATINGS IN GG.FOUR_STAR_RATINGS%TYPE,
gg_THREE_STAR_RATINGS IN GG.THREE_STAR_RATINGS%TYPE,
gg_TWO_STAR_RATINGS IN GG.TWO_STAR_RATINGS%TYPE,
gg_ONE_STAR_RATINGS IN GG.ONE_STAR_RATINGS%TYPE,
gg_PAID IN GG.PAID%TYPE,
gg_IMAGES IN GG.IMAGES%TYPE)
IS
BEGIN
  UPDATE gg SET                 
TITLE = gg_title, 
TOTAL_RATINGS = gg_TOTAL_RATINGS, 
INSTALLS = gg_INSTALLS, 
AVERAGE_RATING = gg_AVERAGE_RATING, 
GROWTH_30D = gg_GROWTH_30D, 
GROWTH_60D = gg_GROWTH_60D, 
PRICE = gg_PRICE, 
CATEGORY = gg_CATEGORY, 
FIVE_STAR_RATINGS = gg_FIVE_STAR_RATINGS,
FOUR_STAR_RATINGS = gg_FOUR_STAR_RATINGS,
THREE_STAR_RATINGS = gg_THREE_STAR_RATINGS,
TWO_STAR_RATINGS = gg_TWO_STAR_RATINGS,
ONE_STAR_RATINGS = gg_ONE_STAR_RATINGS,
PAID = gg_PAID,
IMAGES = gg_IMAGES
  where rank = gg_rank;
END;

PROCEDURE top_3 
AS
    s DBMS_STAT_FUNCS.SummaryType;
    c1 NUMBER(38);
BEGIN
    DBMS_STAT_FUNCS.SUMMARY('hr', 'GG', 'FIVE_STAR_RATINGS',3, s);
    c1 := s.top_5_values(1);
    DBMS_OUTPUT.put_line('Top 3: ' || s.top_5_values(1) || '-' 
                         || s.top_5_values(2) || '-' || s.top_5_values(3));
END;

PROCEDURE bottom_3 
AS
    s DBMS_STAT_FUNCS.SummaryType;
BEGIN
    DBMS_STAT_FUNCS.SUMMARY('hr', 'GG', 'ONE_STAR_RATINGS',3, s);
    DBMS_OUTPUT.put_line('Bottom 3: ' || s.bottom_5_values(1) || '-' 
                         || s.bottom_5_values(2) || '-' || s.bottom_5_values(3));
END;
end gg_pack;



create or replace package gg_func is
FUNCTION find_paid(name gg.title%TYPE)
RETURN VARCHAR;
function ret_cur return TYP_TAB_REC_GG;
FUNCTION func_rate RETURN tbl;
end gg_func;

--body
create or replace package body gg_func is
FUNCTION find_paid(name gg.title%TYPE)
RETURN VARCHAR
IS
    typs VARCHAR2(100);
BEGIN
    SELECT paid
    INTO typs
    FROM gg WHERE title = name;
    RETURN typs;
END;

function ret_cur return TYP_TAB_REC_GG
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

FUNCTION func_rate
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

end gg_func;



--auto_increment in rank

create sequence rank start with 1 increment by 1 nomaxvalue; 

UPDATE gg SET rank = rank.nextval;

ALTER TABLE gg ADD CONSTRAINT gg PRIMARY KEY(rank);

--auto id when we add new row
CREATE TRIGGER auto_incr
BEFORE INSERT ON gg
FOR EACH ROW
BEGIN
:new.rank := rank.nextval;
END;