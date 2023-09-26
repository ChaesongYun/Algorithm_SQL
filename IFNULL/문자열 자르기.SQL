/* 경기도에 위치한 식품창고 목록 출력하기
FOOD_WAREHOUSE 테이블에서 경기도에 위치한 창고의 ID, 이름, 주소, 냉동시설 여부를 조회하는 SQL문을 작성해주세요. 
이때 냉동시설 여부가 NULL인 경우, 'N'으로 출력시켜 주시고 결과는 창고 ID를 기준으로 오름차순 정렬해주세요. */

SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, 'N') AS FREEZER_YN
FROM FOOD_WAREHOUSE
WHERE LEFT(ADDRESS,3) = '경기도'
ORDER BY WAREHOUSE_ID

/* 
SELECT IFNULL(Column명, "null일 경우 대체 값") FROM 테이블명
SELECT IF(NAME IS NULL, "NO name", NAME) as NAME FROM 테이블명
*/

/*
CASE
  WHEN 조건식1 THEN 식1
  WHEN 조건식2 THEN 식2
  ...
  ELSE 조건에 맞는 경우가 없을 경우 실행할 식
END

SELECT 
  CASE
    WHEN NAME IS NULL THEN "No name"
    ELSE NAME
  END as NAME
FROM 테이블명
*/

/*
LEFT(문자, 가져올 개수)
MID(문자, 시작 위치, 가져올 개수)
RIGHT(문자, 가져올 개수)
*/
