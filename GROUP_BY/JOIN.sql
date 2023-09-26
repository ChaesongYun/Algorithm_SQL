/* 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기
CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서
자동차 종류가 '세단' 또는 'SUV' 인 자동차 중
2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고
30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서
자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성해주세요. 
결과는 대여 금액을 기준으로 내림차순 정렬하고, 
대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 
자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬해주세요. */

SELECT C.CAR_ID, C.CAR_TYPE, ROUND(C.DAILY_FEE * 30 * (100-D.DISCOUNT_RATE)/100) AS FEE
FROM CAR_RENTAL_COMPANY_CAR AS C 
JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS R ON C.CAR_ID = R.CAR_ID
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS D ON C.CAR_TYPE = D.CAR_TYPE
WHERE C.CAR_ID NOT IN(
    SELECT CAR_ID 
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE < '2022-11-30' AND END_DATE > '2022-11-01'
) AND D.DURATION_TYPE = '30일 이상'
GROUP BY C.CAR_ID
HAVING C.CAR_TYPE IN ('세단', 'SUV') AND (FEE >= 500000 AND FEE < 2000000)
ORDER BY FEE DESC, CAR_TYPE, CAR_ID DESC

/* GROUP BY ~ HAVING */
/* 
[SELECT * FROM A LEFT JOIN B ON A.key = B.key]
LEFT JOIN은 A, B 테이블 중 A값의 전체와 A의 key값과 B의 key값이 같은 결과를 리턴
A의 key값과 B의 key값이 같은 값이 연결되고(같이 출력)
key가 일치하지 않는다면 A값만 출력

[SELECT * FROM A LEFT JOIN B ON A.key = B.key WHERE B.key IS NULL]
LEFT JOIN 결과에서 B테이블과 연결이 없는 것들만 출력

[INNER JOIN]
key값이 서로 중복되는 것만 출력

[FULL OUTER JOIN]
[SELECT A.ID, A.NAME, A.AGE, B.SCHOOL, B.EXPLANATION 
 FROM A
 LEFT JOIN B ON A.ID = B.ID
 UNION
 SELECT A.ID, A.NAME, A.AGE, B.SCHOOL, B.EXPLANATION 
 FROM A
 RIGHT JOIN B ON A.ID = B.ID]
이렇게 LEFT JOIN, RIGHT JOIN 이용한다음 UNION으로 합치면 됨
*/
