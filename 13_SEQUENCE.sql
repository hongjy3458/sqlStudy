-- SEQUENCE


/*
    <SEQUENCE>
        �������� ���������� �����ϴ� ������ �ϴ� ��ü�̴�.
        
    <SEQUENCE ����>
        [����]
            CREATE SEQUNCE ��������
            [START WITH ����]
            [INCREAMENT BY ����]
            [MAXVALUE ����]
            [MINVALUE ����]
            [CYCLE | NOCYCLE]
            [CACHE ����Ʈũ�� | NOCACHE]; (�⺻�� 20 ����Ʈ)
            
        [��� ����]
            ��������.CURRVAL : ���� �������� ��
            ��������.NEXTVAL : ������ ���� ������Ű�� ������ ������ ��
                              (���� ������ ������ INCREAMENT �� ��ŭ ������ ��)
                              
        * ĳ�ø޸�
          - �̸� ���� ������ �����ؼ� �����صд�.
          - �Ź� ȣ���� ������ ������ ���� ���� ������ �ϴ� ���� �ƴ� ĳ�� �޸� ������ �̸� ������ ������ ����Ѵ�.
*/



/*
    <SEQUENCE ����>
        [ǥ����]
            ALTER SEQUENCE ��������
            [INCREAMENT BY ����]
            [MAXVALUE ����]
            [CYCLE | NOCYCLE]
            [MINVALUE ����]
            [CACHE ����Ʈũ�� | NOCACHE]; (�⺻�� 20 ����Ʈ)
            
        - START WITH�� ������ �Ұ����ϴ�. ��, �缳���ϰ� �ʹٸ� ������ �������� ���� �� �� �����ؾ� �Ѵ�.
*/

/*
    <SEQUENCE ����>
        DROP SEQUENCE ��������;
*/
-------------------------------------------------------------



CREATE SEQUENCE ABC;
DROP SEQUENCE ABC;
CREATE SEQUENCE ABC NOCACHE NOCYCLE;

SELECT ABC.NEXTVAL FROM DUAL;
SELECT ABC.CURRVAL FROM DUAL;

--MEMBER ���̺� ���� ( NO, ID, PWD, NICK, ENROLL_DATE, QUIT_YN)

SELECT * FROM MEMBER;

CREATE TABLE MEMBER(
    NO              NUMBER
    , ID            VARCHAR(100)
    , PWD           VARCHAR(100)
    , NICK          VARCHAR(100)
    , ENROLL_DATE   TIMESTAMP
    , QUIT_YN       CHAR(1)
    );
    
-- ȸ������

CREATE SEQUENCE ABC;

INSERT INTO MEMBER(NO, ID, PWD, NICK, ENROLL_DATE, QUIT_YN) 
VALUES(ABC.NEXTVAL, 'USER01' , '1234', 'NICK', SYSDATE , 'N')
;

-- �α���
UPDATE MEMBER
    SET QUIT_YN = 'Y'
    ;

-- ȸ�� ���� ����( ��� ���� )
UPDATE MEMBER
    SET PWD = '123'
    ;

COMMIT;

-- ȸ�� ���� ���� ( �г��� ����)

UPDATE MEMBER
    SET NICK = 'NICK2'
    ;

-- ȸ�� Ż��

DELETE FROM MEMBER
    WHERE NICK = 'NICK2'
    ;
    
DROP TABLE MEMBER;

--BOARD ���̺� ���� (NO, TITLE, CONTENT, WRITER, ENROLL_DATE, DEL_YN

CREATE TABLE BOARD(
    NO              NUMBER
    , TITLE         VARCHAR(100)
    , CONTENT       VARCHAR(100)
    , WRITER        VARCHAR(100)
    , ENROLL_DATE   TIMESTAMP
    , DEL_YN        VARCHAR(1)
    );
    
CREATE SEQUENCE BOARDNO;

--�Խñ� �ۼ�
INSERT INTO BOARD(NO, TITLE, CONTENT, WRITER, ENROLL_DATE, DEL_YN)
VALUES(BOARDNO.NEXTVAL, '����', '����', '�۾���', SYSDATE, 'N');



--�Խñ� ��� ��ȸ(�ֽż�)
SELECT NO, TITLE, WRITER, ENROLL_DATE
FROM BOARD
ORDER BY NO DESC
;

--�Խñ� �� ��ȸ(�Խñ� ��ȣ �̿��ؼ�)
SELECT TITLE, WRITER, CONTENT, ENROLL_DATE
FROM BOARD
WHERE NO = 1
;

--�Խñ� �˻�(���� �˻�)
SELECT TITLE, WRITER, CONTENT,ENROLL_DATE
FROM BOARD
WHERE TITLE = '����'
;

-- �Խñ� �˻� ( ���� �˻�)
SELECT TITLE, WRITER, CONTENT ,ENROLL_DATE
FROM BOARD
WHERE CONTENT = '����'
;

-- �Խñ� ���� ( ���� ���� - �Խñ� ��ȣ �̿��ؼ� )
UPDATE BOARD
SET TITLE = '����2'
WHERE NO = 1
;

-- �Խñ� ���� ( ���� ���� - �Խñ� ��ȣ �̿��ؼ� ) 
UPDATE BOARD
SET CONTENT = '����2'
WHERE NO = 1
;
 
-- �Խñ� ���� ( ��ȣ �̿��ؼ� )
DELETE BOARD
WHERE NO = 1
;

SELECT * FROM BOARD;

