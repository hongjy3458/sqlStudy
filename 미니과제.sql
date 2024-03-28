-- MEMBER ���̺��� NO Į���� ����� ������ ����
DROP SEQUENCE SEQ_MEMBER_NO;

-- MEMBER ���̺��� NO Į���� ����� ������ ����
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

SELECT * FROM MEMBER;

-- MEMBER ���̺� ����
DROP TABLE MEMBER;

-- MEMBER ���̺� ���� (NO, ID, PWD, NICK, ENROLL_DATE, MODIFY_DATE, QUIT_YN) 
CREATE TABLE MEMBER(
    NO                  NUMBER          CONSTRAINT PK_MEMBER_NO PRIMARY KEY
    , ID                VARCHAR(100)    CONSTRAINT NN_MEMBER_ID NOT NULL CONSTRAINT UQ_MEMBER_ID UNIQUE
    , PWD               VARCHAR(100)    CONSTRAINT NN_MEMBER_PWD NOT NULL
    , NICK              VARCHAR(100)
    , ENROLL_DATE       TIMESTAMP       DEFAULT SYSDATE
    , MODIFY_DATE       TIMESTAMP
    , QUIT_YN           CHAR(1)         DEFAULT 'N' CONSTRAINT CK_MEMBER_QUIT CHECK ( QUIT_YN IN ('Y', 'N'))
    )
;

-- ȸ������
INSERT INTO MEMBER(NO, ID, PWD, NICK) VALUES (SEQ_MEMBER_NO.NEXTVAL,'TEST01', '0101', 'TEST01NICK');

INSERT INTO MEMBER(NO, ID, PWD, NICK) VALUES(SEQ_MEMBER_NO.NEXTVAL, ? , ?, ?);




-- �α���
SELECT * FROM MEMBER WHERE ID = 'TEST01' AND PWD = '0101';
SELECT * FROM MEMBER WHERE ID = ? AND PWD = ?;

--Ʈ������ ó��
--COMMIT;
ROLLBACK;


-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- BOARD ���̺��� NO Į���� ����� ������ ����
DROP SEQUENCE SEQ_BOARD_NO;
-- BOARD ���̺��� NO Į���� ����� ������ ����
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE NOCYCLE;

-- BOARD ���̺� ���� ����
DROP TABLE BOARD CASCADE CONSTRAINTS;
-- BOARD ���̺� ���� (NO , TITLE, CONTENT, ENROLL_DATE) // ENROLL_DATE �� DEFAULT ������ ����ð�
CREATE TABLE BOARD(
    NO              NUMBER
    , TITLE         VARCHAR2(100)
    , CONTENT       VARCHAR2(4000)
    , ENROLL_DATE   TIMESTAMP       DEFAULT SYSDATE
    , WRITER_NO     NUMBER
    , CONSTRAINT    FK_BOARD_MEMBER FOREIGN KEY(WRITER_NO) REFERENCES MEMBER(NO)
);

-- �Խñ� �ۼ�
INSERT INTO BOARD(NO, TITLE, CONTENT, WRITER_NO) VALUES(SEQ_BOARD_NO.NEXTVAL , '����111' , '����111', 1);
INSERT INTO BOARD(NO, TITLE, CONTENT, WRITER_NO) VALUES(SEQ_BOARD_NO.NEXTVAL , ? , ?, ?);

-- �Խñ� ���� (���� ���� - ��ȣ�̿��ؼ�)
UPDATE BOARD SET TITLE = '���������񤻤�' WHERE NO = 1;
UPDATE BOARD SET TITLE = ? WHERE NO = ?;

-- �Խñ� ���� (���� ���� - ��ȣ�̿��ؼ�)
UPDATE BOARD SET CONTENT = '�����ȳ��뤻��' WHERE NO = 1;
UPDATE BOARD SET CONTENT = ? WHERE NO = ?;

-- �Խñ� ���� (��ȣ�̿��ؼ�)
DELETE BOARD WHERE NO = 1;
DELETE BOARD WHERE NO = ?;

-- �Խñ� ��� ��ȸ (�ֽż�)
SELECT 
    NO
    , TITLE
    , TO_CHAR(ENROLL_DATE, 'MM/DD HH:MI') ENROLL_DATE
FROM BOARD 
ORDER BY NO DESC
;

-- �Խñ� �� ��ȸ (��ȣ �̿��ؼ�)
SELECT * FROM BOARD WHERE NO = 1;
SELECT * FROM BOARD WHERE NO = ?;

-- �Խñ� �˻� (��������)
SELECT * FROM BOARD WHERE TITLE LIKE '%�ȳ�%';
SELECT * FROM BOARD WHERE TITLE LIKE '%?%';

-- �Խñ� �˻� (��������)
SELECT * FROM BOARD WHERE CONTENT LIKE '%�ȳ�%';
SELECT * FROM BOARD WHERE CONTENT LIKE '%?%';

-- Ŀ��
COMMIT;


