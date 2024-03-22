/*
    <JOIN>
        �� ���� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ����ϴ� �����̴�.
        
        1. � ����(EQUAL JOIN) / ���� ����(INNER JOIN)
            �����Ű�� Į���� ���� ��ġ�ϴ� ��鸸 ���εǼ� ��ȸ�Ѵ�.(��ġ�ϴ� ���� ���� ���� ��ȸ X)
            
            1) ����Ŭ ���� ����
                [����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1, ���̺�2
                    WHERE ���̺�1.Į���� = ���̺�2.Į����;
                
                - FROM ���� ��ȸ�ϰ��� �ϴ� ���̺���� �޸�(,)�� �����Ͽ� �����Ѵ�.
                - WHERE ���� ��Ī ��ų Į���� ���� ������ �����Ѵ�.
            
            2) ANSI ǥ�� ����
                [����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1
                    [INNER] JOIN ���̺�2 ON (���̺�1.Į���� = ���̺�2.Į����);
                
                - FROM ���� ������ �Ǵ� ���̺��� ����Ѵ�.
                - JOIN ���� ���� ��ȸ�ϰ��� �ϴ� ���̺��� ��� �� ��Ī ��ų Į���� ���� ������ ����Ѵ�.
                - ���ῡ ����Ϸ��� Į������ ���� ��� ON ���� ��ſ� USING(Į����) ������ ����Ѵ�.
*/

SELECT
    JOB_CODE   
    , JOB_NAME
FROM JOB
;

--�����, �����ڵ�, ���޸� ��ȸ

SELECT EMP_NAME, JOB_NAME , E.JOB_CODE
FROM EMPLOYEE E
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE
;

-- �μ��� �޿��հ���ȸ
-- (�μ���, �޿��հ� ���)

SELECT 
    D.DEPT_TITLE
    , SUM(E.SALARY)
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
WHERE E.DEPT_CODE != 'D5'
GROUP BY E.DEPT_CODE
;

--EMPLOYEE ���̺�, JOB ���̺��� �̿��Ͽ�
--�����, �����ڵ�, ���޸� ��ȸ

SELECT EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J
ON E.JOB_CODE = J.JOB_CODE
;


--EMPLOYEE ���̺�, DEPARTMENT ���̺��� �̿��Ͽ�
--�����, �μ��ڵ�, �μ��� ��ȸ

SELECT EMP_NAME, D.DEPT_ID, D.DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
;

--DEPARTMENT ���̺�, LOCATION ���̺��� �̿��Ͽ�
--�μ��ڵ�, �μ���, �����ڵ�, ������, �����ڵ� ��ȸ

SELECT DEPT_ID, DEPT_TITLE, D.LOCATION_ID, LOCAL_NAME, NATIONAL_CODE
FROM department D
JOIN LOCATION N
ON D.LOCATION_ID = N.LOCAL_CODE
;


--LOCATION ���̺�, NATIONAL ���̺��� �̿��Ͽ� 
--�����ڵ�, ������, �����ڵ�, ������ ��ȸ

SELECT L.LOCAL_CODE, L.LOCAL_NAME, N.NATIONAL_CODE, N.NATIONAL_NAME
FROM LOCATION L
JOIN NATIONAL N
ON L.NATIONAL_CODE = N.NATIONAL_CODE
;

--DEPARTMENT ���̺�, LOCATION ���̺�, NATIONAL ���̺��� �̿��Ͽ�
--�μ��ڵ�, �μ���, ������, ������ ��ȸ

SELECT DEPT_ID, DEPT_TITLE, L.NATIONAL_CODE, N.NATIONAL_NAME
FROM DEPARTMENT D
JOIN LOCATION L
ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL N
ON L.NATIONAL_CODE = N.NATIONAL_CODE
;

--DEPARTMENT ���̺�, EMPLOYEE ���̺��� �̿��Ͽ� �����, �μ��� ��ȸ

SELECT
    EMP_NAME
    , DEPT_TITLE

FROM DEPARTMENT D
RIGHT OUTER JOIN EMPLOYEE E
ON D.DEPT_ID = E.DEPT_CODE
;

/*
    3. �ܺ� ���� (OUTTER JOIN)
        ���̺� ���� JOIN �� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ�� �����ϴ�.
        ��, �ݵ�� �����̵Ǵ� ���̺�(�÷�)�� �����ؾ� �Ѵ�. (LEFT/RIGHT/(+))
*/


/*
    4. ī�׽þȰ�(CARTESIAN PRODUCT) / ���� ����(CROSS JOIN)
        ���εǴ� ��� ���̺��� �� ����� ���μ��� ��� ���ε� �����Ͱ� �˻��ȴ�.
        ���̺��� ����� ��� ������ ����� ������ ��� -> ����ȭ�� ����
*/

/*
    5. �� ����(NON EQUAL JOIN)
        ���� ���ǿ� ��ȣ(=)�� ������� �ʴ� ���ι��� �� �����̶�� �Ѵ�.
        ������ Į�� ���� ��ġ�ϴ� ��찡 �ƴ�, ���� ������ ���ԵǴ� ����� �����ϴ� ����̴�.
        ( = �̿ܿ� �� ������ >, <, >=, <=, BETWEEN AND, IN, NOT IN ���� ����Ѵ�.)
        ANSI �������δ� JOIN ON �������θ� ����� �����ϴ�. (USING ��� �Ұ�)
*/
SELECT E.EMP_NAME, E.SALARY , S.*
FROM EMPLOYEE E
JOIN SAL_GRADE S ON E.SALARY >= S.MIN_SAl AND E.SALARY <S.MAX_SAL
;

/*
    6. ��ü ����(SELF JOIN)
        ���� ���̺��� �ٽ� �ѹ� �����ϴ� ��쿡 ����Ѵ�.
*/

--������ȣ, �����̸�, �����ȣ
/*
SELECT 
    E1.EMP_ID  
    , E1.EMP_NAME
    , E1.MANAGER_ID
    , E2.EMP_NAME
FROM EMPLOYEE E1, EMPLOYEE E2
WHERE E1.MANAGER_ID = E2.EMP_ID
;
*/

SELECT 
    E1.EMP_ID
    , E1.EMP_NAME
    , E1.MANAGER_ID
    , E2.EMP_NAME
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.MANAGER_ID = E2.EMP_ID
;

---------------- �ǽ� ���� ----------------

-- 1. DEPARTMENT ���̺�� LOCATION ���̺��� �����Ͽ� �μ� �ڵ�, �μ���, ���� �ڵ�, �������� ��ȸ

SELECT
    DEPT_ID
    , DEPT_TITLE
    , LOCAL_CODE
    , LOCAL_NAME
FROM DEPARTMENT D
JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;


-- 2. EMPLOYEE ���̺�� DEPARTMENT ���̺��� �����ؼ� ���ʽ��� �޴�
-- ������� ���, �����, ���ʽ�, �μ����� ��ȸ

SELECT 
    EMP_ID
    , EMP_NAME
    , BONUS
    , DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
WHERE BONUS IS NOT NULL
;



-- 3. EMPLOYEE ���̺�� DEPARTMENT ���̺��� �����ؼ� 
-- �λ�����ΰ� �ƴ� ������� �����, �μ���, �޿��� ��ȸ

SELECT  
    EMP_NAME
    , DEPT_TITLE
    , SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
WHERE E.DEPT_CODE != 'D1'
;

-- 4. EMPLOYEE ���̺�, DEPARTMENT ���̺�, LOCATION ���̺���
-- �����ؼ� ���, �����, �μ���, ������ ��ȸ

SELECT
    EMP_ID
    , EMP_NAME
    , DEPT_TITLE
    , LOCATION_ID
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
;

-- 5. ���, �����, �μ���, ������, ������ ��ȸ

SELECT
    EMP_ID
    , EMP_NAME
    , DEPT_TITLE
    , LOCAL_NAME
    , NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
;

-- 6. ���, �����, �μ���, ������, ������, �޿� ��� ��ȸ 

SELECT
    EMP_ID
    , EMP_NAME
    , DEPT_TITLE
    , LOCAL_NAME
    , NATIONAL_NAME
    , SAL_LEVEL
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
JOIN SAL_GRADE S ON E.SALARY >= S.MIN_SAl AND E.SALARY <S.MAX_SAL
;


-- 1. ������ �븮�̸鼭 ASIA �������� �ٹ��ϴ� ��������
-- ���, �����, ���޸�, �μ���, �ٹ�����, �޿��� ��ȸ�ϼ���.
SELECT 
    EMP_ID
    , EMP_NAME
    , JOB_NAME
    , DEPT_TITLE
    , LOCAL_NAME
    , SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
WHERE LOCAL_NAME LIKE 'ASIA%' AND JOB_NAME = '�븮'
;

-- 2. 70���� �̸鼭 �����̰�, ���� �� ���� �������� �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�ϼ���.
SELECT 
    EMP_NAME
    , EMP_NO
    , DEPT_TITLE
    , JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
WHERE SUBSTR(EMP_NO,1,1) = 7 AND SUBSTR(EMP_NO, 8,1) = 2 AND SUBSTR(EMP_NAME,1,1) = '��'
;


-- 3. ���ʽ��� �޴� �������� �����, ���ʽ�, ����, �μ���, �ٹ������� ��ȸ�ϼ���.

SELECT 
    EMP_NAME
    , BONUS
    , SALARY
    , DEPT_TITLE
    , LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
WHERE BONUS IS NOT NULL
;


-- 4. �ѱ��� �Ϻ����� �ٹ��ϴ� �������� �����, �μ���, �ٹ�����, �ٹ� ������ ��ȸ�ϼ���.

SELECT 
    EMP_NAME
    , DEPT_TITLE
    , LOCAL_NAME
    , NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE

WHERE NATIONAL_NAME = '�ѱ�' or NATIONAL_NAME = '�Ϻ�'
;

-- 5. �� �μ��� ��� �޿��� ��ȸ�Ͽ� �μ���, ��� �޿�(���� ó��)�� ��ȸ�ϼ���.

SELECT 
    DEPT_TITLE
    , ROUND(AVG(SALARY))
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.DEPT_ID = E.DEPT_CODE
GROUP BY DEPT_TITLE
;



-- 6. �� �μ��� �� �޿��� ���� 1000���� �̻��� �μ���, �޿��� ���� ��ȸ�Ͻÿ�.

SELECT 
    DEPT_TITLE
    , SUM(SALARY)
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.DEPT_ID = E.DEPT_CODE
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) > 10000000
;

-- 7. ���, �����, ���޸�, �޿� ���, ������ ��ȸ
--    �̶� ���п� �ش��ϴ� ���� �Ʒ��� ���� ��ȸ �ǵ��� �Ͻÿ�.
--    �޿� ����� S1, S2�� ��� '���'
--    �޿� ����� S3, S4�� ��� '�߱�'
--    �޿� ����� S5, S6�� ��� '�ʱ�'

---�̰�

SELECT
    EMP_ID
    , EMP_NAME
    , JOB_NAME
    , S.SAL_LEVEL
    , CASE
    WHEN SAL_LEVEL = 'S1' THEN '���'
    WHEN SAL_LEVEL = 'S2' THEN '���'
    WHEN SAL_LEVEL = 'S3' THEN '�߱�'
    WHEN SAL_LEVEL = 'S4' THEN '�߱�'
    WHEN SAL_LEVEL = 'S5' THEN '�ʱ�'
    WHEN SAL_LEVEL = 'S6' THEN '�ʱ�'
   -- ELSE '����'
    END AS ����
      
FROM EMPLOYEE E
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
JOIN SAL_GRADE S ON E.SALARY >= S.MIN_SAl AND E.SALARY <S.MAX_SAL
;




-- 8. ���ʽ��� ���� �ʴ� ������ �� ���� �ڵ尡 J4 �Ǵ� J7�� �������� �����, ���޸�, �޿��� ��ȸ�Ͻÿ�.


SELECT
    EMP_NAME
    , JOB_NAME
    , SALARY
FROM EMPLOYEE E
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
WHERE (E.JOB_CODE = 'J4' OR E.JOB_CODE = 'J7') AND E.BONUS IS NULL
;

-- 9. �μ��� �ִ� �������� �����, ���޸�, �μ���, �ٹ� ������ ��ȸ�Ͻÿ�.

SELECT
    EMP_ID
    , JOB_NAME
    , DEPT_TITLE
    , LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
WHERE DEPT_CODE IS NOT NULL
;


-- 10. �ؿܿ������� �ٹ��ϴ� �������� �����, ���޸�, �μ� �ڵ�, �μ����� ��ȸ�Ͻÿ�

SELECT
    EMP_NAME
    , JOB_NAME
    , DEPT_CODE
    , DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON D.DEPT_ID = E.DEPT_CODE
JOIN LOCATION L ON L.LOCAL_CODE = D.LOCATION_ID
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D7'
;

-- 11. �̸��� '��'�ڰ� ����ִ� �������� ���, �����, ���޸��� ��ȸ�Ͻÿ�.

SELECT
    EMP_ID
    , EMP_NAME
    , JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON J.JOB_CODE = E.JOB_CODE
WHERE EMP_NAME LIKE '%��%'
;











