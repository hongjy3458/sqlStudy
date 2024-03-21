-- �Լ� (FUNCTION)

/*
    <�Լ�>
        Į������ �о ��� ����� ��ȯ�Ѵ�.
          - ������ �Լ� : N���� ���� �о N���� ����� �����Ѵ�. (�� �� �Լ� ���� -> ��� ��ȯ)
          - �׷� �Լ�   : N���� ���� �о 1���� ����� �����Ѵ�. (�ϳ��� �׷캰�� �Լ� ���� -> ��� ��ȯ)
        SELECT ���� ������ �Լ��� �׷� �Լ��� �Բ� ������� ���Ѵ�. (��� ���� ������ �ٸ��� ������)
        �Լ��� ����� �� �ִ� ��ġ�� SELECT, WHERE, ORDER BY, GROUP BY, HAVING ���� ����� �� �ִ�.
*/


--------------------- ������ �Լ� ---------------------
/*
    <���� ���� �Լ�>
    1) LENGTH / LENGTHB
      - LENGTH(Į��|'���ڰ�') : ���� �� ��ȯ
      - LENGTHB(Į��|'���ڰ�') : ������ ����Ʈ �� ��ȯ
        �ѱ� �� ���� -> 3BYTE
        ������, ����, Ư������ �� ���� -> 1BYTE
        
    * DUAL ���̺�
      - SYS ����ڰ� �����ϴ� ���̺�
      - SYS ����ڰ� ���������� ��� ����ڰ� ������ �����ϴ�.
      - �� ��, �� Į���� ������ �ִ� ����(DUMMY) ���̺��̴�.
      - ����ڰ� �Լ�(���)�� ����� �� �ӽ÷� ����ϴ� ���̺��̴�.
*/

SELECT LENGTH('HELLOABC')
FROM DUAL;

SELECT LENGTH(EMAIL)
FROM EMPLOYEE;

SELECT LENGTHB('HELLO')
FROM DUAL;

/*
    2) INSTR
        - INSTR(Į��|'���ڰ�', '����'[, POSITION[, OCCURRENCE]])
        - ������ ��ġ���� ������ ���� ��°�� ��Ÿ���� ������ ���� ��ġ�� ��ȯ�Ѵ�.
*/

SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; -- 3��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- 3��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- 9��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- 10��° �ڸ��� B�� ��ġ�� ���
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL; -- 3��° �ڸ��� B�� ��ġ�� ���



/* 
    3) LPAD / RPAD
        - LPAD/RPAD(Į��|'���ڰ�', ����(����Ʈ)[, '�����̷��� �ϴ� ����'])
        - ���õ� Į��|'���ڰ�'�� ������ ���ڸ� ���� �Ǵ� �����ʿ� ���ٿ� ���� N ���� ��ŭ�� ���ڿ��� ��ȯ�Ѵ�.
        - ���ڿ� ���� ���ϰ� �ְ� ǥ���ϰ��� �� �� ����Ѵ�.
*/


-- 20��ŭ�� ���� �� EMAIL ���� ���������� �����ϰ� ������ �������� ä���.
-- 20��ŭ�� ���� �� EMAIL ���� �������� �����ϰ� ������ ���������� ä���.
SELECT 
    EMAIL 
    , LPAD(EMAIL , 20 , 'X')
    , RPAD(EMAIL , 20 , 'X')
FROM EMPLOYEE;



/*
    4) LTRIM / RTRIM
        - LTRIM/RTRIM(Į��|'���ڰ�'[, '�����ϰ��� �ϴ� ����'])
        - ���ڿ��� ���� Ȥ�� �����ʿ��� �����ϰ��� �ϴ� ���ڵ��� ã�Ƽ� ������ ����� ��ȯ�Ѵ�.
        - �����ϰ��� �ϴ� ���ڰ��� ���� �� �⺻������ ������ �����Ѵ�.
*/
SELECT LTRIM('   KH') FROM DUAL;
SELECT LTRIM('0001234560', '0') FROM DUAL;
SELECT LTRIM(' 123123KH', '312 ') FROM DUAL;

SELECT RTRIM('KH   ') AS "X" FROM DUAL;
SELECT RTRIM('00012300004560000', '0' ) FROM DUAL;

SELECT RTRIM(LTRIM('   KH   ')) FROM DUAL;



/*
    5) TRIM
        - TRIM([[LEADING|TRAILING|BOTH] '�����ϰ��� �ϴ� ���ڰ�' FROM] Į��|'���ڰ�')
        - ���ڰ� ��/��/���ʿ� �ִ� ������ ���ڸ� ������ �������� ��ȯ�Ѵ�. 
        - �����ϰ��� �ϴ� ���ڰ��� ���� �� �⺻������ ���ʿ� �ִ� ������ �����Ѵ�. 
*/
SELECT TRIM('   KH   ') FROM DUAL;
SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM(BOTH 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;


/*
    6) SUBSTR
        - SUBSTR(Į��|'���ڰ�', POSITION[, LENGTH])
        - ���ڵ����Ϳ��� ������ ��ġ���� ������ ������ŭ�� ���ڿ��� �����ؼ� ��ȯ�Ѵ�.
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;
SELECT SUBSTR('����ѹ��ź��̿͵η�̻�õ���ڵ����', 2, 5) FROM DUAL;


-- EMPLOYEE ���̺��� �ֹι�ȣ�� ������ ��Ÿ���� �κи� �߶� ��ȸ (�����, �����ڵ�)
SELECT EMP_NAME, EMP_NO , SUBSTR(EMP_NO , 8 , 1) �����ڵ�
FROM EMPLOYEE
;

-- EMPLOYEE ���̺��� ���� ����� ��ȸ (�����, �����ڵ�)
SELECT EMP_NAME, EMP_NO , SUBSTR(EMP_NO , 8 , 1) �����ڵ�
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO , 8 , 1) = 2
;

-- EMPLOYEE ���̺��� �ֹε�Ϲ�ȣ ù ��° �ڸ����� ���������� ������ ����� �����ʿ� * ���ڸ� ä���� ��ȸ
-- (991212-2****** ���·� ���)
SELECT EMP_NAME, EMP_NO , SUBSTR(EMP_NO , 1, 8) || '******' AS �ֹε�Ϲ�ȣ
FROM EMPLOYEE
;
SELECT EMP_NAME, EMP_NO , RPAD(SUBSTR(EMP_NO , 1, 8) , 14 , '*') AS �ֹε�Ϲ�ȣ
FROM EMPLOYEE
;

-- EMPLOYEE ���̺��� �����, �̸���, ���̵�(�̸��Ͽ��� '@' ���� ���� ���� ���)�� ��ȸ
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL , 1 , INSTR(EMAIL , '@' , 1)-1) ���̵�
FROM EMPLOYEE
;


/*
    7) LOWER / UPPER / INITCAP
        - LOWER/UPPER/INITCAP(�÷�|'���ڰ�')
          LOWER : ��� �ҹ��ڷ� �����Ѵ�.
          UPPER : ��� �빮�ڷ� �����Ѵ�.
          INITCAP : �ܾ� �� ���ڸ��� �빮�ڷ� �����Ѵ�.
*/
SELECT LOWER('Welcome To My World!') FROM DUAL;
SELECT UPPER('Welcome To My World!') FROM DUAL;
SELECT INITCAP('welcome to my world!') FROM DUAL;


/*
    8) CONCAT
        - CONCAT(Į��|'���ڰ�', Į��|'���ڰ�')
        - ���ڵ����� �� ���� ���޹޾Ƽ� �ϳ��� ��ģ �� ����� ��ȯ�Ѵ�.
*/
SELECT CONCAT('�����ٶ�', 'ABCD') FROM DUAL;
SELECT '�����ٶ�' || 'ABCD' FROM DUAL;

SELECT CONCAT('�����ٶ�', 'ABCD', '1234') FROM DUAL; -- ���� �߻�(CONCAT�� �� ���� ���ڵ����͸� ���޹��� �� �ִ�. )
SELECT CONCAT(CONCAT('�����ٶ�', 'ABCD'), '1234') FROM DUAL;
SELECT '�����ٶ�' || 'ABCD' || '1234' FROM DUAL;

SELECT CONCAT(EMP_ID, EMP_NAME)
FROM EMPLOYEE;

/*
    9) REPLACE
      - REPLACE(Į��|'���ڰ�', �����Ϸ��� �ϴ� ����, �����ϰ��� �ϴ� ����)
      - Į�� �Ǵ� ���ڰ����� "�����Ϸ��� �ϴ� ����"�� "�����ϰ��� �ϴ� ����"�� �����ؼ� ��ȯ�Ѵ�.
*/
SELECT REPLACE('����� ������ ���ﵿ', '���ﵿ', '�Ｚ��') FROM DUAL;

-- EMPLOYEE ���̺��� �̸����� kh.or.kr�� gmail.com �����ؼ� ��ȸ
SELECT EMP_NAME, REPLACE(EMAIL, 'kh.or.kr', 'gmail.com')
FROM EMPLOYEE;

/*
    2) MOD
        - MOD(NUMBER, NUMBER)
        - �� ���� ���� �������� ��ȯ�� �ִ� �Լ� (�ڹ��� % ����� �����ϴ�.)
*/
-- SELECT 10 % 3 FROM DUAL;
SELECT MOD(10, 3) FROM DUAL;
SELECT MOD(-10, 3) FROM DUAL;
SELECT MOD(10, -3) FROM DUAL;
SELECT MOD(10.9, -3) FROM DUAL;
SELECT MOD(-10.9, 3) FROM DUAL;

/*
    3) ROUND
        - ROUND(NUMBER[, ��ġ])
        - ��ġ�� �����Ͽ� �ݿø����ִ� �Լ�
        - ��ġ : �⺻�� 0(.), ���(�Ҽ��� �������� ������)�� ����(�Ҽ��� �������� ����)�� �Է°���
*/
SELECT ROUND(123.456) FROM DUAL;
SELECT ROUND(123.456, 1) FROM DUAL;
SELECT ROUND(123.456, 4) FROM DUAL;
SELECT ROUND(123.456, -1) FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;
SELECT ROUND(123.456, -3) FROM DUAL;
SELECT ROUND(723.456, -3) FROM DUAL;

/*
    4) CEIL
        - CEIL(NUMBER)
        - �Ҽ��� �������� �ø����ִ� �Լ�
*/
--SELECT CEIL(123.456, 2) FROM DUAL;
SELECT CEIL(123.456) FROM DUAL;

/*
    5) FLOOR
        - FLOOR(NUMBER)
        - �Ҽ��� �������� �����ϴ� �Լ�
*/
SELECT FLOOR(123.456) FROM DUAL;
SELECT FLOOR(123.789) FROM DUAL;

/*
    6) TRUNC
        - TRUNC(NUMBER[, ��ġ])
        - ��ġ�� �����Ͽ� ������ ������ �Լ�
        - ��ġ : �⺻�� 0(.), ���(�Ҽ��� �������� ������)�� ����(�Ҽ��� �������� ����)�� �Է°���
*/
SELECT TRUNC(123.456) FROM DUAL;
SELECT TRUNC(123.456, 1) FROM DUAL;
SELECT TRUNC(123.456, -1) FROM DUAL;

/*
    <��¥ ���� �Լ�>
    
    1) SYSDATE
        �ý����� ���� ��¥�� �ð��� ��ȯ�Ѵ�.
*/
SELECT SYSDATE FROM DUAL;

/* 
    2) MONTHS_BETWEEN
        [����]
            MONTHS_BETWEEN(DATE1, DATE2)
            
        - �Է¹��� �� ��¥ ������ ���� ���� ��ȯ�Ѵ�.
        - ������� NUMBER Ÿ���̴�.
*/

-- EMPLOYEE ���̺��� ������, �Ի���, �ٹ������� ��ȸ


/*
    3) ADD_MONTHS
        [����]
            ADD_MONTHS(DATE, NUMBER)
            
        - Ư�� ��¥�� �Է¹޴� ���ڸ�ŭ�� ���� ���� ���� ��¥�� �����Ѵ�.
        - ������� DATE Ÿ���̴�.
*/

SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;

/*
    4) NEXT_DAY
        [����]
            NEXT_DAY(DATE, ����(����|����))
        
        - Ư�� ��¥���� ���Ϸ��� ������ ���� ����� ��¥�� �����Ѵ�.
        - ������� DATE Ÿ���̴�.
*/

SELECT SYSDATE, NEXT_DAY(SYSDATE, '�����') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'ȭ') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 1) FROM DUAL;-- 1:�Ͽ���, 2:������, ..., 7:�����
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL; -- ����(���� �� KOREAN�̱� ������)

ALTER SESSION SET NLS_LANGUAGE = AMERICAN; -- ��� ����
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'MON') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL; -- ���� �߻�
SELECT SYSDATE, NEXT_DAY(SYSDATE, '�����') FROM DUAL; -- ���� �߻�

ALTER SESSION SET NLS_LANGUAGE = KOREAN; -- ��� ����

/*
    5) LAST_DAY
        [����]
            LAST_DAY(DATE)
        
        - �ش� ���� ������ ��¥�� ��ȯ�Ѵ�.
        - ������� DATE Ÿ���̴�.   
*/
SELECT LAST_DAY(SYSDATE) FROM DUAL;

/*
    6) EXTRACT
        [����]
            EXTRACT(YEAR|MONTH|DAY FROM DATE);
            
        - Ư�� ��¥���� ����, ��, �� ������ �����ؼ� ��ȯ�Ѵ�.
          YEAR : ������ ����
          MONTH : ���� ����
          DAY :  �ϸ� ����
        - ������� NUMBER Ÿ���̴�.
*/

SELECT SYSDATE 
, EXTRACT(YEAR FROM SYSDATE) -- ��
, EXTRACT(MONTH FROM SYSDATE) --��
, EXTRACT(DAY FROM SYSDATE)  -- ��
FROM DUAL;

--���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT SYSDATE FROM DUAL;

/*
    <����ȯ �Լ�>
    
    1) TO_CHAR
        [����]
            TO_CHAR(��¥|����[, ����])
        
        - ��¥ �Ǵ� ���� Ÿ���� �����͸� ���� Ÿ������ ��ȯ�ؼ� ��ȯ�Ѵ�.
        - ������� CHARACTER Ÿ���̴�.
*/

-- ���� --> ����
SELECT 
    1234 AS ���ڸ����ڷιٲٱ��׽�Ʈ 
    , '1234' AS ���ڸ����ڷιٲٱ��׽�Ʈ
    , TO_CHAR(1234)
FROM DUAL;

SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234, '999999') FROM DUAL; -- 6ĭ�� ������ Ȯ��, ������ ����, ��ĭ�� �������� ä���.
SELECT TO_CHAR(1234, '000000') FROM DUAL; -- 6ĭ�� ������ Ȯ��, ������ ����, ��ĭ�� 0���� ä���.
SELECT TO_CHAR(1234, 'L999999') FROM DUAL; -- ���� ������ ����(LOCAL)�� ȭ�����
SELECT TO_CHAR(1234, '$999999') FROM DUAL;
SELECT TO_CHAR(1234, 'L') FROM DUAL;
SELECT TO_CHAR(1234, 'L999,999') FROM DUAL; -- �ڸ��� ���� �޸�

-- ��¥ --> ����
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL; -- AM�̳� PM ��� �ᵵ ���X �׳� ǥ�ø��϶�°�
SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD(DY)') FROM DUAL;

/*
    2) TO_DATE
        [����]
            TO_DATE(����|����[, ����])
        
        - ���� �Ǵ� ������ �����͸� ��¥ Ÿ������ ��ȯ�ؼ� ��ȯ�Ѵ�.
        - ������� DATE Ÿ���̴�.
*/
-- ���� --> ��¥
SELECT TO_DATE(20211014) FROM DUAL;
SELECT TO_DATE(20211014190830, 'YYYYMMDD HH24MISS') FROM DUAL;

-- ���� --> ��¥
SELECT TO_DATE('20211014') FROM DUAL;
SELECT TO_DATE('20211014 190830') FROM DUAL;
SELECT TO_DATE('20211014', 'YYYYMMDD') FROM DUAL;
SELECT TO_DATE('20211014 190830', 'YYYYMMDD HH24MISS') FROM DUAL;

-- YY�� RR ��
SELECT TO_DATE('110923', 'YYMMDD') FROM DUAL;
SELECT TO_DATE('990923', 'YYMMDD') FROM DUAL; -- YY : ������ ���� ����

SELECT TO_DATE('110923', 'RRMMDD') FROM DUAL;
SELECT TO_DATE('990923', 'RRMMDD') FROM DUAL; -- RR : �ش� ���� 50 �̻��̸� ���� ����, 50 �̸��̸� ���� ���� 

/*
    3) TO_NUMBER
        [����]
            TO_NUMBER('���ڰ�'[, ����])
        
        - ���� Ÿ���� �����͸� ���� Ÿ���� �����ͷ� ��ȯ�ؼ� ��ȯ�Ѵ�.
        - ������� NUMBER Ÿ���̴�.
*/
SELECT TO_NUMBER('0123456789') FROM DUAL;
SELECT '123' + '456' FROM DUAL; -- �ڵ����� ���� Ÿ������ ����ȯ �� ����ó���� ���ش�.
SELECT '123' + '456A' FROM DUAL; -- ���� �߻�(���� ������ ���ڵ鸸 �ڵ�����ȯ �ȴ�.)
SELECT '10,000,000' + '500,000' FROM DUAL; -- ���� �߻�
SELECT TO_NUMBER('10,000,000', '99,999,999') + TO_NUMBER('500,000', '999,999') FROM DUAL;

/*
    <NULL ó�� �Լ�>
    
    1) NVL
        [����]
            NVL(�÷�, �÷����� NULL�� ��� ��ȯ�� ��)
        
        - NULL�� �Ǿ��ִ� �÷��� ���� ���ڷ� ������ ������ �����Ͽ� ��ȯ�Ѵ�.

    2) NVL2
        [����]
            NVL2(�÷�, ������ �� 1, ������ �� 2)
            
        - �÷� ���� NULL�� �ƴϸ� ������ �� 1, �÷� ���� NULL�̸� ������ �� 2�� �����Ͽ� ��ȯ�Ѵ�.  
    
    3) NULLIF
        [����]
            NULLIF(�񱳴�� 1, �񱳴�� 2)
            
        - �� ���� ���� �����ϸ� NULL ��ȯ, �� ���� ���� �������� ������ �񱳴�� 1�� ��ȯ�Ѵ�.
*/

SELECT
    EMP_NAME
    , SALARY
    , NVL(BONUS, 0)
    , (SALARY + SALARY * NVL(BONUS,0) ) * 12 AS "���ʽ� ���� ����"
    , NVL2(BONUS, 0.1, 0) AS "���ʽ� ����"
FROM EMPLOYEE;

SELECT
    'HELLO'
    , 'WORLD'
    , NULLIF('HELLO', 'HELLO')
    FROM DUAL;

/*
    <�����Լ�>
        ���� ���� ��쿡 ������ �� �� �ִ� ����� �����ϴ� �Լ��̴�.
    
    1) DECODE
        [����]
            DECODE(Į��|����, ���ǰ� 1, ����� 1, ���ǰ� 2, ����� 2, ..., �����)
        
        - ���ϰ��� �ϴ� ���� ���ǰ��� ��ġ�� ��� �׿� �ش��ϴ� ������� ��ȯ�� �ִ� �Լ��̴�.
*/

SELECT 
    EMP_NAME
    , DEPT_CODE
    , DECODE(DEPT_CODE, 'D1', '����1��', 'D2', '����2��', 'D2', '����2��', 'D2'
    , 'D3', '����3��'
    , 'D4', '����4��'
    , 'D5', '����1��'
    , 'D6', '����2��') AS �μ���
FROM EMPLOYEE;

SELECT 
    EMP_NAME
    , JOB_CODE
    , DECODE(JOB_CODE, 'J1', '��ǥ'
    , 'J2' ,'�λ���'
    , 'J3' ,'�̻�'
    , 'J4' ,'����'
    , 'J5' ,'����'
    , 'J6' ,'�븮'
    , 'J7' ,'���') AS ���޸�

FROM EMPLOYEE;

/*
    2) CASE
        [����]
            CASE WHEN ���ǽ� 1 THEN ����� 1
                 WHEN ���ǽ� 2 THEN ����� 2
                 ...
                 ELSE ����� N
            END
*/

SELECT
    EMP_NAME
    , JOB_CODE
    , CASE 
        WHEN JOB_CODE = 'J1' THEN '����'
        WHEN JOB_CODE = 'J2' THEN '����'
        WHEN JOB_CODE = 'J3' THEN '����'
        WHEN JOB_CODE = 'J4' THEN '����'
        WHEN JOB_CODE = 'J5' THEN '����'
        ELSE '�ش���׾���'
        END AS ���޸�
FROM EMPLOYEE;

-- �����, ����, �ʱ�/�߱�/���/Ư�� ���� (�޿��� 300 ������ �ʱ�, 500 ������ �߱�
-- 700������ ���, �� �ܿ��� Ư��)

SELECT
    EMP_NAME
    , SALARY
    , CASE
        WHEN SALARY > 0 AND SALARY <= 3000000 THEN '�ʱ�'
        WHEN SALARY > 3000000 AND SALARY <= 5000000 THEN '�߱�'
        WHEN SALARY > 5000000 AND SALARY <= 7000000 THEN '���'
        WHEN SALARY > 7000000 THEN 'Ư��'
        END AS ��������
FROM EMPLOYEE
ORDER BY SALARY DESC;

--�����, �ֹι�ȣ, ���� ��ȸ

SELECT
    EMP_NAME,
    EMP_NO
    , CASE
        WHEN SUBSTR(EMP_NO, 8, 1) IN (1,3) THEN '����'
        WHEN SUBSTR(EMP_NO, 8, 1) IN (2,4) THEN '����'
--        WHEN EMP_NO LIKE '_______1%'THEN '����'
--        WHEN EMP_NO LIKE '_______2%'THEN '����'
        END AS ����
FROM EMPLOYEE;

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
