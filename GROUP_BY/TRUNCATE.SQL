/* 가격대 별 상품 개수 구하기
PRODUCT 테이블에서 만원 단위의 가격대 별로 상품 개수를 출력하는 SQL 문을 작성해주세요. 
이때 컬럼명은 각각 컬럼명은 PRICE_GROUP, PRODUCTS로 지정해주시고 가격대 정보는 각 구간의 최소금액(10,000원 이상 ~ 20,000 미만인 구간인 경우 10,000)으로 표시해주세요. 
결과는 가격대를 기준으로 오름차순 정렬해주세요. */

SELECT TRUNCATE(PRICE, -4) AS PRICE_GROUP, COUNT(PRODUCT_ID) AS PRODUCTS 
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP

/* 버림(TRUNCATE)
숫자의 특정 자리수 이하를 버리는 버림
TRUNCATE(숫자, 버림할 자릿수)
버림할 자릿수를 반드시 입력해야 함! */

/* 반올림(ROUND)
ROUND(숫자, 반올림할 자리수) */
