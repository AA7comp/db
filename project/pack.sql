create or replace package gg_pack is
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
end gg_pack;


--body
create or replace package body gg_pack is
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
end gg_pack;