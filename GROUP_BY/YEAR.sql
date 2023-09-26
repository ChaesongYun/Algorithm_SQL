/*
상품을 구매한 회원 비율 구하기
USER_INFO 테이블과 ONLINE_SALE 테이블에서 2021년에 가입한 전체 회원들 중
상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을 
년, 월 별로 출력하는 SQL문을 작성해주세요. 
상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고, 
전체 결과는 년을 기준으로 오름차순 정렬해주시고 년이 같다면 월을 기준으로 오름차순 정렬해주세요.
*/

SELECT YEAR, MONTH, COUNT(*) AS PUCHASED_USERS,
ROUND((COUNT(*))/(SELECT COUNT(*) FROM USER_INFO WHERE YEAR(JOINED)=2021), 1) AS PURCHASED_RATIO
FROM (
    SELECT DISTINCT YEAR(S.SALES_DATE) AS YEAR, MONTH(S.SALES_DATE) AS MONTH, U.USER_ID 
    FROM ONLINE_SALE S
    JOIN USER_INFO U ON S.USER_ID = U.USER_ID AND YEAR(JOINED) = 2021
) A
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH

/* 
YEAR : 연도 추출
MONTH : 월 추출
DAY : 일 추출 (DAYOFMONTH와 같은 함수)
HOUR : 시 추출
MINUTE : 분 추출
SECOND : 초 추출
*/

/*
테이블에 카테고리라는 컬럼이 있을 때 
이 카테고리 값이 테이블에 몇 종류가 있는지 알고싶음
그러려면 카테고리를 조회할 때 값이 중복되면 안되기 때문에 DISTINCT를 사용함
*/
