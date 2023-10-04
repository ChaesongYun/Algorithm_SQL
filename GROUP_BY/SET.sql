/*
보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
이때 결과는 시간대 순으로 정렬해야 합니다.
*/

SET @HOUR = -1;
SELECT (@HOUR := @HOUR+1) AS HOUR,
    (SELECT COUNT(HOUR(DATETIME))
    FROM ANIMAL_OUTS
    WHERE HOUR(DATETIME)=@HOUR) AS COUNT
FROM ANIMAL_OUTS
WHERE @HOUR < 23;

/*
변수를 선언할 때는 SET @변수명 = 대입하고 싶은 값;
대입할 때는 :=
*/
