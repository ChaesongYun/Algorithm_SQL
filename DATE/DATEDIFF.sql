-- CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서 
-- 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서 대여 기록 별로 
-- 대여 금액(컬럼명: FEE)을 구하여 대여 기록 ID와 대여 금액 리스트를 출력하는 SQL문을 작성해주세요. 
-- 결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬해주세요.

SELECT HISTORY_ID, 
ROUND(DAILY_FEE * (DATEDIFF(END_DATE, START_DATE)+1) * 
(CASE 
    WHEN DATEDIFF(END_DATE, START_DATE)+1 < 7 THEN 1
    WHEN DATEDIFF(END_DATE, START_DATE)+1 < 30 THEN 0.95
    WHEN DATEDIFF(END_DATE, START_DATE)+1 < 90 THEN 0.92
    ELSE 0.85
END)) AS 'FEE'

FROM CAR_RENTAL_COMPANY_CAR AS C 
    JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
    ON C.CAR_ID = H.CAR_ID
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS P
    ON C.CAR_TYPE = P.CAR_TYPE

WHERE C.car_type = "트럭"
GROUP BY HISTORY_ID
ORDER BY FEE DESC , HISTORY_ID DESC


-- -------------------------------------------------------------------------------------------------------------------
  
SELECT H.HISTORY_ID, ROUND((DATEDIFF(END_DATE, START_DATE)+1)*C.DAILY_FEE*(100-IFNULL(P.DISCOUNT_RATE, 0))/100) AS FEE

FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
JOIN CAR_RENTAL_COMPANY_CAR AS C ON H.CAR_ID = C.CAR_ID
LEFT OUTER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS P
ON C.CAR_TYPE = P.CAR_TYPE AND P.DURATION_TYPE = (
    CASE WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 90 THEN '90일 이상'
    WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 30 THEN '30일 이상'
    WHEN DATEDIFF(END_DATE, START_DATE)+1 >= 7 THEN '7일 이상'
    END)

WHERE C.CAR_TYPE = '트럭'
GROUP BY H.HISTORY_ID
ORDER BY FEE DESC, H.HISTORY_ID DESC 
