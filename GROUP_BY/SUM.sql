/*
주문량이 많은 아이스크림들 조회하기
7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요.
*/

SELECT A.FLAVOR
FROM FIRST_HALF A 
JOIN(SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER FROM JULY GROUP BY FLAVOR) B
ON A.FLAVOR = B.FLAVOR
ORDER BY (A.TOTAL_ORDER + B.TOTAL_ORDER) DESC
LIMIT 3

/*
GROUP BY FLAVOR로 묶으면 
같은 FLAVOR인 SHIPMENT_ID와 TOTAL_ORDER끼리 묶인다
-> 여기서 SUM(TOTAL_ORDER)을 하면 내가 원하는 '같은 FLAVOR' 내의 총 주문량이 나오는 것!

그리고 B는 이미 FLAVOR가 하나씩 있는 상황
-> A와 1대1로 매치가 된다

DISTINCT
데이터의 중복을 제거할 때

GROUP BY 
데이터를 그루핑해서 집계 함수를 사용하고자 할 때
그룹화하는 과정에서 중복이 제거되는 기능도 할 수 있다
중복제거만을 위해서라면 DISTINCT를 사용해서 쿼리의 가독성을 높이자!
*/
