/*
    <�׷� �Լ�>
        �뷮�� �����͵�� ���質 ��� ���� �۾��� ó���ؾ� �ϴ� ��� ���Ǵ� �Լ����̴�.
        ��� �׷� �Լ��� NULL ���� �ڵ����� �����ϰ� ���� �ִ� �͵鸸 ����� �Ѵ�.
        ���� AVG �Լ��� ����� ���� �ݵ�� NVL() �Լ��� �Բ� ����ϴ� ���� �����Ѵ�.
        
        1) SUM
            [����]
                SUM(NUMBER)
                
            - �ش� Į�� ������ �� �հ踦 ��ȯ�Ѵ�.
*/

SELECT AVG(BONUS)
FROM EMPLOYEE
;

/*
        2) AVG
            [����]
                AVG(NUMBER)
            
            - �ش� �÷� ������ ����� ���ؼ� ��ȯ�Ѵ�.
*/

/*
        3) MIN / MAX
            [����]
                MIN/MAX(��� Ÿ�� �÷�)
            
            - MIN : �ش� �÷� ���� �߿� ���� ���� ���� ��ȯ�Ѵ�.
            - MAX : �ش� �÷� ���� �߿� ���� ū ���� ��ȯ�Ѵ�.
*/

/*
        4) COUNT
            [����]
                COUNT(*|�÷���|DISTINCT �÷���)
            
            - �÷� �Ǵ� ���� ������ ���� ��ȯ�ϴ� �Լ��̴�.
            - COUNT(*) : ��ȸ ����� �ش��ϴ� ��� ���� ������ ��ȯ�Ѵ�.
            - COUNT(�÷���) : ������ �÷� ���� NULL�� �ƴ� ���� ������ ��ȯ�Ѵ�.
            - COUNT(DISTINCT �÷���) �ش� �÷� ���� �ߺ��� ������ ���� ������ ��ȯ�Ѵ�. 
*/

SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE
;

/*
    <GROUP BY>
        �׷� ������ ������ �� �ִ� ����
        ���� ���� ������ �ϳ��� �׷����� ��� ó���� �������� ����Ѵ�.
        
*/

-- ��ü �޿� ���� ��ȸ
SELECT SUM(SALARY)
FROM EMPLOYEE
;

-- �� �μ��� �޿� ���� ��ȸ
SELECT DEPT_CODE, 
    SUM(SALARY) AS �μ����޿�����
FROM EMPLOYEE
GROUP BY(DEPT_CODE)
ORDER BY DEPT_CODE
;

-- ��ü ��� �� ��ȸ
SELECT COUNT(EMP_ID)
FROM EMPLOYEE;

-- �� �μ��� ��� �� ��ȸ
SELECT DEPT_CODE
    , COUNT(EMP_ID)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- �� �μ��� ���ʽ��� �޴� ����� 
SELECT DEPT_CODE
     , COUNT (BONUS) AS ���ʽ����޴»����
     FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- �� ���޺� �޿� ��� ��ȸ

SELECT JOB_CODE
            , ROUND(AVG(SALARY)) AS ���޺��޿����
    FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE
;

-- �μ��� �����, ���ʽ��� �޴� �����, �޿�����, ��� �޿�, �ְ� �޿�, ���� �޿� ��ȸ
SELECT DEPT_CODE
        , COUNT(EMP_ID) AS �μ��������
        , COUNT(BONUS) AS �μ������ʽ������
        , SUM(SALARY) AS �μ����޿���
        , ROUND(AVG(SALARY)) AS �μ�����ձ޿�
        , MAX(SALARY) AS �μ����ְ�޿�
        , MIN(SALARY) AS �μ��������޿�

FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- ���� �� ����� ��ȸ
SELECT SUBSTR(EMP_NO, 8, 1) AS "���� �ڵ�",
    COUNT(*) AS "�����"
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1)
ORDER BY "���� �ڵ�";

/*
    <HAVING>
        �׷쿡 ���� ������ ������ �� ����ϴ� ����(�ַ� �׷� �Լ��� ����� ������ �� ����)
    
    * ���� ����
        5: SELECT      ��ȸ�ϰ��� �ϴ� Į���� AS "��Ī" | ���� | �Լ���
        1: FROM        ��ȸ�ϰ��� �ϴ� ���̺��
        2: WHERE       ���ǽ�
        3: GROUP BY    �׷� ���ؿ� �ش��ϴ� Į���� | ���� | �Լ���
        4: HAVING      �׷쿡 ���� ���ǽ�
        6: ORDER BY    ���� ���ؿ� �ش��ϴ� Į���� | ��Ī | Į�� ����
*/

--�� �μ��� ��� �޿� ��ȸ
SELECT
    DEPT_CODE
    , FLOOR(AVG(SALARY))||'��'
FROM EMPLOYEE
GROUP BY DEPT_CODE
;

-- �μ��� ��� �޿��� 300���� �̻��� ��츸 ��ȸ
SELECT DEPT_CODE
    , ROUND(AVG(SALARY))
FROM EMPLOYEE

GROUP BY DEPT_CODE
HAVING ROUND(AVG(SALARY)) >3000000
ORDER BY DEPT_CODE
;

--���޺� �� �޿��� ���� 10000000 �̻��� ���޵鸸 ��ȸ
--�μ��� ���ʽ��� �޴� ����� ���� �μ��鸸 ��ȸ


-- ���ʽ��� ���� �ʴ� ������� �������
-- �μ��� ��� �޿��� ��ȸ
-- (����޿��� 300���� �̻��� �μ��� ����)
-- (��ձ޿��� ���� ������� ����)

SELECT
    DEPT_CODE
    , FLOOR(AVG(SALARY)) ��ձ޿�
FROM EMPLOYEE
WHERE BONUS IS NULL
GROUP BY DEPT_CODE
HAVING AVG(SALARY) < 3000000
ORDER BY AVG(SALARY) DESC
;


/*
    <���� �Լ�>
        �׷캰 ������ ��� ���� �߰� ���踦 ��� ���ִ� �Լ�
*/

-- ���޺� �޿��� �հ踦 ��ȸ
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- ������ �࿡ ��ü �� �޿��� �հ���� ��ȸ
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY JOB_CODE;

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(JOB_CODE)
ORDER BY JOB_CODE;

-- �μ� �ڵ嵵 ���� ���� �ڵ嵵 ���� ������� �׷� ��� �޿��� �հ踦 ��ȸ
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE, JOB_CODE;

-- ROLLUP(�÷� 1, �÷� 2, ...) -> �÷� 1�� ������ �߰����踦 ���� �Լ�
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;

-- CUBE(�÷� 1, �÷� 2, ...) -> �÷� 1�� ������ �߰����踦 ����, �÷� 2�� ������ �߰����踦 ����. ��, ���޵Ǵ� �÷� ��� �����ϴ� �Լ�
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;



/*
    <���� ������>
        ���� ���� �������� ������ �ϳ��� ���������� ����� �������̴�.
        
        UNION       : �� �������� ������ ������� ���� �� �ߺ��Ǵ� ���� �����Ѵ�. (������)
        UNION ALL   : UNION�� �����ϰ� �� �������� ������ ������� ���ϰ� �ߺ��� ����Ѵ�. (������)
        INTERSECT   : �� �������� ������ ������� �ߺ��� ������� �����Ѵ�. (������)
        MINUS       : ���� ������ ��������� ���� ������ ������� �� ������ ������� �����Ѵ�. (������)
*/

--�μ��ڵ� D5�� ����� ��ȸ

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
;

--�޿��� 300���� �ʰ��� ����� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE SALARY > 3000000
;



