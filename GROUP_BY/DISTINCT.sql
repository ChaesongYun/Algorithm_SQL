/*
동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.
USER_INFO 테이블과 ONLINE_SALE 테이블에서 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성해주세요. 
결과는 년, 월, 성별을 기준으로 오름차순 정렬해주세요. 
이때, 성별 정보가 없는 경우 결과에서 제외해주세요.
*/

SELECT YEAR(SALES_DATE) AS YEAR, MONTH(SALES_DATE) AS MONTH, GENDER, COUNT(DISTINCT A.USER_ID) AS USERS
FROM ONLINE_SALE A
JOIN USER_INFO B ON A.USER_ID = B.USER_ID
WHERE GENDER IS NOT NULL
GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE), GENDER
ORDER BY YEAR(SALES_DATE), MONTH(SALES_DATE), GENDER

/*
GROUP BY로 묶은 건 년, 월, 성별!! -> 한 명의 고객이 여러번 집계될 수도 있음
고객ID는 중복제거가 되지 않았기 때문에
DISTINCT A.USER_ID를 해줘야 한다!
*/

-- 소수점 처리방법
SELECT order_date
      ,count(distinct CASE WHEN category = "Furniture" THEN order_id END) as "furniture"
      ,count(distinct CASE WHEN category = "Furniture" THEN order_id END)/(count(distinct order_id)+0.00) as furniture_pct
FROM records
GROUP BY order_date
HAVING COUNT(distinct order_id) >= 10
ORDER BY furniture_pct desc, order_date
