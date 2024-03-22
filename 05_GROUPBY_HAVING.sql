/*
    <그룹 함수>
        대량의 데이터들로 집계나 통계 같은 작업을 처리해야 하는 경우 사용되는 함수들이다.
        모든 그룹 함수는 NULL 값을 자동으로 제외하고 값이 있는 것들만 계산을 한다.
        따라서 AVG 함수를 사용할 때는 반드시 NVL() 함수와 함께 사용하는 것을 권장한다.
        
        1) SUM
            [문법]
                SUM(NUMBER)
                
            - 해당 칼럼 값들의 총 합계를 반환한다.
*/

SELECT AVG(BONUS)
FROM EMPLOYEE
;

/*
        2) AVG
            [문법]
                AVG(NUMBER)
            
            - 해당 컬럼 값들의 평균을 구해서 반환한다.
*/

/*
        3) MIN / MAX
            [문법]
                MIN/MAX(모든 타입 컬럼)
            
            - MIN : 해당 컬럼 값들 중에 가장 작은 값을 반환한다.
            - MAX : 해당 컬럼 값들 중에 가장 큰 값을 반환한다.
*/

/*
        4) COUNT
            [문법]
                COUNT(*|컬럼명|DISTINCT 컬럼명)
            
            - 컬럼 또는 행의 개수를 세서 반환하는 함수이다.
            - COUNT(*) : 조회 결과에 해당하는 모든 행의 개수를 반환한다.
            - COUNT(컬럼명) : 제시한 컬럼 값이 NULL이 아닌 행의 개수를 반환한다.
            - COUNT(DISTINCT 컬럼명) 해당 컬럼 값의 중복을 제거한 행의 개수를 반환한다. 
*/

SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE
;

/*
    <GROUP BY>
        그룹 기준을 제시할 수 있는 구문
        여러 개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용한다.
        
*/

-- 전체 급여 총합 조회
SELECT SUM(SALARY)
FROM EMPLOYEE
;

-- 각 부서별 급여 총합 조회
SELECT DEPT_CODE, 
    SUM(SALARY) AS 부서별급여총합
FROM EMPLOYEE
GROUP BY(DEPT_CODE)
ORDER BY DEPT_CODE
;

-- 전체 사원 수 조회
SELECT COUNT(EMP_ID)
FROM EMPLOYEE;

-- 각 부서별 사원 수 조회
SELECT DEPT_CODE
    , COUNT(EMP_ID)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- 각 부서별 보너스를 받는 사원수 
SELECT DEPT_CODE
     , COUNT (BONUS) AS 보너스를받는사원수
     FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- 각 직급별 급여 평균 조회

SELECT JOB_CODE
            , ROUND(AVG(SALARY)) AS 직급별급여평균
    FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE
;

-- 부서별 사원수, 보너스를 받는 사원수, 급여의합, 평균 급여, 최고 급여, 최저 급여 조회
SELECT DEPT_CODE
        , COUNT(EMP_ID) AS 부서별사원수
        , COUNT(BONUS) AS 부서별보너스사원수
        , SUM(SALARY) AS 부서별급여합
        , ROUND(AVG(SALARY)) AS 부서별평균급여
        , MAX(SALARY) AS 부서별최고급여
        , MIN(SALARY) AS 부서별최저급여

FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- 성별 별 사원수 조회
SELECT SUBSTR(EMP_NO, 8, 1) AS "성별 코드",
    COUNT(*) AS "사원수"
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1)
ORDER BY "성별 코드";

/*
    <HAVING>
        그룹에 대한 조건을 제시할 때 사용하는 구문(주로 그룹 함수의 결과를 가지고 비교 수행)
    
    * 실행 순서
        5: SELECT      조회하고자 하는 칼럼명 AS "별칭" | 계산식 | 함수식
        1: FROM        조회하고자 하는 테이블명
        2: WHERE       조건식
        3: GROUP BY    그룹 기준에 해당하는 칼럼명 | 계산식 | 함수식
        4: HAVING      그룹에 대한 조건식
        6: ORDER BY    정렬 기준에 해당하는 칼럼명 | 별칭 | 칼럼 순번
*/

--각 부서별 평균 급여 조회
SELECT
    DEPT_CODE
    , FLOOR(AVG(SALARY))||'원'
FROM EMPLOYEE
GROUP BY DEPT_CODE
;

-- 부서평 평균 급여가 300만원 이상인 경우만 조회
SELECT DEPT_CODE
    , ROUND(AVG(SALARY))
FROM EMPLOYEE

GROUP BY DEPT_CODE
HAVING ROUND(AVG(SALARY)) >3000000
ORDER BY DEPT_CODE
;

--직급별 총 급여의 합이 10000000 이상인 직급들만 조회
--부서별 보너스를 받는 사원이 없는 부서들만 조회


-- 보너스를 받지 않는 사원들을 대상으로
-- 부서별 평균 급여를 조회
-- (평귭급여가 300만원 이상인 부서는 제외)
-- (평균급여가 높은 순서대로 정렬)

SELECT
    DEPT_CODE
    , FLOOR(AVG(SALARY)) 평균급여
FROM EMPLOYEE
WHERE BONUS IS NULL
GROUP BY DEPT_CODE
HAVING AVG(SALARY) < 3000000
ORDER BY AVG(SALARY) DESC
;


/*
    <집계 함수>
        그룹별 산출한 결과 값의 중간 집계를 계산 해주는 함수
*/

-- 직급별 급여의 합계를 조회
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 마지막 행에 전체 총 급여의 합계까지 조회
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY JOB_CODE;

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(JOB_CODE)
ORDER BY JOB_CODE;

-- 부서 코드도 같고 직급 코드도 같은 사원들을 그룹 지어서 급여의 합계를 조회
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE, JOB_CODE;

-- ROLLUP(컬럼 1, 컬럼 2, ...) -> 컬럼 1을 가지고 중간집계를 내는 함수
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;

-- CUBE(컬럼 1, 컬럼 2, ...) -> 컬럼 1을 가지고 중간집계를 내고, 컬럼 2를 가지고 중간집계를 낸다. 즉, 전달되는 컬럼 모두 집계하는 함수
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;



/*
    <집합 연산자>
        여러 개의 쿼리문을 가지고 하나의 쿼리문으로 만드는 연산자이다.
        
        UNION       : 두 쿼리문을 수행한 결과값을 더한 후 중복되는 행은 제거한다. (합집합)
        UNION ALL   : UNION과 동일하게 두 쿼리문을 수행한 결과값을 더하고 중복은 허용한다. (합집합)
        INTERSECT   : 두 쿼리문을 수행한 결과값에 중복된 결과값만 추출한다. (교집합)
        MINUS       : 선행 쿼리의 결과값에서 후행 쿼리의 결과값을 뺀 나머지 결과값만 추출한다. (차집합)
*/

--부서코드 D5인 사원들 조회

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
;

--급여가 300만원 초과인 사원들 조회
SELECT *
FROM EMPLOYEE
WHERE SALARY > 3000000
;



