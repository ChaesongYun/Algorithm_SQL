/*
MEMBER_PROFILE와 REST_REVIEW 테이블에서 
리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요. 
회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 
결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.
*/


SELECT B.MEMBER_NAME, A.REVIEW_TEXT, DATE_FORMAT(A.REVIEW_DATE, '%Y-%m-%d')
FROM REST_REVIEW A
JOIN(
    SELECT R.MEMBER_ID, M.MEMBER_NAME, RANK() OVER(ORDER BY CNT DESC) AS RANKING
    FROM(
        SELECT *, COUNT(MEMBER_ID) AS CNT
        FROM REST_REVIEW
        GROUP BY MEMBER_ID) AS R
    JOIN MEMBER_PROFILE M ON R.MEMBER_ID = M.MEMBER_ID) B
ON A.MEMBER_ID = B.MEMBER_ID
WHERE B.RANKING = 1
ORDER BY A.REVIEW_DATE


/*
RANK() OVER(ORDER BY ...)
순위함수는 OVER절과 사용해야 하고 OVER절 내부의 ORDER BY절에 순위 칼럼을 지정하면 된다
*/
