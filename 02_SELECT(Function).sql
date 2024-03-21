--�� ���б� ��ũ�� ����
--SQL02_SELECT(Function)

-- 1��
-- ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���� ������ ǥ���ϴ� SQL������ �ۼ��Ͻÿ�.
-- (��, ����� "�й�", "�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)
SELECT STUDENT_NO AS �й�,
        STUDENT_NAME AS �̸�,
        ENTRANCE_DATE AS ���г⵵
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'

ORDER BY ENTRANCE_DATE ASC
;


-- 2��
-- �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�. �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL������ �ۼ��غ���.
-- (*�̶� �ùٸ��� �ۼ��� SQL ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��) 

SELECT PROFESSOR_NAME,
        PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3
;


-- 3��
-- �� ������б��� ���� �������� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. �� �̶� ���̰� ���� ������� ���� ��� ����
-- (���̰� ���ٸ� �̸��� ������ ����)�� ȭ�鿡 ��µǵ��� ����ÿ�.
-- (��, ���� �� 2000�� ���� ����ڴ� ������ ��� ����� "�����̸�"���� �Ѵ�. ���̴� '��'���� ����Ѵ�.)
-- ���� ���� ���� ��� �� �ٸ� �� �����Ƿ� PROFESSOR_SSN ���� SELECT �ؼ� Ȯ���غ���!!

SELECT PROFESSOR_NAME
        , PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_SSN LIKE '_______1%'
ORDER BY PROFESSOR_SSN DESC, PROFESSOR_NAME DESC
;


-- 4��
-- �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� ����� "�̸�"�� �������� �Ѵ�.
-- (���� 2���� ����� ������ ���ٰ� �����Ͻÿ�)

SELECT SUBSTR(PROFESSOR_NAME, 2) AS �̸�
FROM TB_PROFESSOR
;


-- 5��
-- �� ������б��� ����� ������ �й��� �̸��� ǥ���Ͻÿ�.(�̶�, 19�쿡 �����ϸ� ����� ���� ���� ������ ����)
-- �������� �䱸�ϴ� ������ ������ ������� ��� ������ ������� �߷����� �� (������� ������ ����� 245��)
-- 0301���� ������ �л��� ���ܽ�Ű�� ���� 19 �ʰ� 20 ���϶�� ���ǽ� ���

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE, 1, 2) - SUBSTR(STUDENT_SSN, 1, 2) +1 > 20 
AND SUBSTR(ENTRANCE_DATE, 1, 2) - SUBSTR(STUDENT_SSN, 1, 2) +1 <= 21 
;

-- 6��
-- 2020�� ũ���������� ���� �����ΰ�?
--'DAY': �ݿ��� 'DY': �� 'D': 6

SELECT TO_CHAR((TO_DATE(20201225)),'day')
FROM DUAL
;


-- 7��
-- TO_DATE('99/10/11', 'YY/MM/DD'), TO_DATE('49/10/11', 'YY/MM/DD')�� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- �� TO_DATE('99/10/11', 'RR/MM/DD'), TO_DATE('49/10/11', 'RR/MM/DD')�� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- YY�� ��� 2000���
-- RR�� 49���ϴ� 2000��� 50�̻��� 1900���

--2099��  , 2049��
--1999��, 2049��


-- 8��
-- �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�. 
-- 2000�⵵ ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE,1,2) <= 99 AND SUBSTR(ENTRANCE_DATE,1,2) >50;



-- 9��
-- �й��� A517178�� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- ��, �̶� ��� ȭ���� ����� "����"�̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ������� ǥ���Ѵ�.

SELECT ROUND(AVG(POINT),1) AS ����
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178'
;


-- 10��
-- �а��� �л� ���� ���Ͽ� "�а���ȣ", "�л���(��)"�� ���·� Į������ ����� ������� ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO AS �а���ȣ
    ,COUNT(*) AS �л���
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
;
-- 11��
-- ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ��� �˾Ƴ��� SQL���� �ۼ��Ͻÿ�
SELECT COUNT(*) AS ������
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL
;

-- 12��
-- �й��� A112113�� ���� �л��� �⵵ �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- ��, �̶� ���ȭ���� ����� "�⵵", "�⵵ �� ����"�̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ������� ǥ���Ѵ�.

SELECT 
    SUBSTR(TERM_NO, 1,4) AS �⵵ 
    , ROUND(AVG(POINT),1) AS �⵵������

FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
;


-- 13��
-- �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL������ �ۼ��Ͻÿ�.


-- COUNT(DECODE(ABSENCE_YN, 'Y', 1, NULL)) �� �ο�����
-- ���� ABSENCE_YN�� ���� 'Y'���� ��� COUNT(1)�� �Ǿ� ������ ���� �ǰ�
--     ABSENCE_YN�� ���� 'Y'�� �ƴϿ��� ��� COUNT(NULL)�� �Ǿ� ������ ���� �ʰԵǴ� ����!!

SELECT DEPARTMENT_NO
    , COUNT(STUDENT_NO)
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
GROUP BY DEPARTMENT_NO
;


-- 14��
-- �� ���б��� �ٴϴ� �������� �л����� �̸��� ã���� �Ѵ�.
-- � SQL ������ ����ϸ� �����ϰڴ°�?

SELECT STUDENT_NAME, COUNT(STUDENT_NAME) AS �����̸�����
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(STUDENT_NAME) >1
;


-- 15��
-- �й��� A112113�� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ����, �� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)

SELECT 
    SUBSTR(TERM_NO, 1,4) AS �⵵ 
    , SUBSTR(TERM_NO, 5,2) AS �б�
    , ROUND(AVG(POINT),1) AS �б⺰����
--    , ROUND(SUM(POINT),1) OVER AS �⵵����������
  --  , ROUND(AVG(POINT),1) OVER AS ������

FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
ORDER BY TERM_NO
;


