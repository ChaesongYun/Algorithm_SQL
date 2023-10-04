/*
CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 
총 대여 횟수가 5회 이상인 자동차들에 대해서 해당 기간 동안의 
월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력하는 SQL문을 작성해주세요. 
결과는 월을 기준으로 오름차순 정렬하고, 월이 같다면 자동차 ID를 기준으로 내림차순 정렬해주세요. 
특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외해주세요.
*/

SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
    AND CAR_ID IN (SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY                                         
    WHERE DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10' 
    GROUP BY CAR_ID                                                                 
    HAVING COUNT(CAR_ID) >= 5)
GROUP BY MONTH, CAR_ID
HAVING RECORDS >= 1
ORDER BY MONTH(START_DATE), CAR_ID DESC

/*
CAR_ID를 그룹지었을 때 5개 이상인 ID를 테이블로 만들어서 거기에 해당하는 ID만 출력해라
GROUP BY MONTH, CAR_ID 하면 어짜피 중복 제거되니 COUNT(*) 하면 해당 월, 해당 아이디에 맞는 개수가 구해짐
*/
