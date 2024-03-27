-- SEQUENCE


/*
    <SEQUENCE>
        정수값을 순차적으로 생성하는 역할을 하는 객체이다.
        
    <SEQUENCE 생성>
        [문법]
            CREATE SEQUNCE 시퀀스명
            [START WITH 숫자]
            [INCREAMENT BY 숫자]
            [MAXVALUE 숫자]
            [MINVALUE 숫자]
            [CYCLE | NOCYCLE]
            [CACHE 바이트크기 | NOCACHE]; (기본값 20 바이트)
            
        [사용 구문]
            시퀀스명.CURRVAL : 현재 시퀀스의 값
            시퀀스명.NEXTVAL : 시퀀스 값을 증가시키고 증가된 시퀀스 값
                              (기존 시퀀스 값에서 INCREAMENT 값 만큼 증가된 값)
                              
        * 캐시메모리
          - 미리 다음 값들을 생성해서 저장해둔다.
          - 매번 호출할 때마다 시퀀스 값을 새로 생성을 하는 것이 아닌 캐시 메모리 공간에 미리 생성된 값들을 사용한다.
*/



/*
    <SEQUENCE 수정>
        [표현법]
            ALTER SEQUENCE 시퀀스명
            [INCREAMENT BY 숫자]
            [MAXVALUE 숫자]
            [CYCLE | NOCYCLE]
            [MINVALUE 숫자]
            [CACHE 바이트크기 | NOCACHE]; (기본값 20 바이트)
            
        - START WITH는 변경이 불가능하다. 즉, 재설정하고 싶다면 기존에 시퀀스를 삭제 후 재 생성해야 한다.
*/

/*
    <SEQUENCE 삭제>
        DROP SEQUENCE 시퀀스명;
*/
-------------------------------------------------------------



CREATE SEQUENCE ABC;
DROP SEQUENCE ABC;
CREATE SEQUENCE ABC NOCACHE NOCYCLE;

SELECT ABC.NEXTVAL FROM DUAL;
SELECT ABC.CURRVAL FROM DUAL;

--MEMBER 테이블 생성 ( NO, ID, PWD, NICK, ENROLL_DATE, QUIT_YN)

SELECT * FROM MEMBER;

CREATE TABLE MEMBER(
    NO              NUMBER
    , ID            VARCHAR(100)
    , PWD           VARCHAR(100)
    , NICK          VARCHAR(100)
    , ENROLL_DATE   TIMESTAMP
    , QUIT_YN       CHAR(1)
    );
    
-- 회원가입

CREATE SEQUENCE ABC;

INSERT INTO MEMBER(NO, ID, PWD, NICK, ENROLL_DATE, QUIT_YN) 
VALUES(ABC.NEXTVAL, 'USER01' , '1234', 'NICK', SYSDATE , 'N')
;

-- 로그인
UPDATE MEMBER
    SET QUIT_YN = 'Y'
    ;

-- 회원 정보 수정( 비번 변경 )
UPDATE MEMBER
    SET PWD = '123'
    ;

COMMIT;

-- 회원 정보 수정 ( 닉네임 변경)

UPDATE MEMBER
    SET NICK = 'NICK2'
    ;

-- 회원 탈퇴

DELETE FROM MEMBER
    WHERE NICK = 'NICK2'
    ;
    
DROP TABLE MEMBER;

--BOARD 테이블 생성 (NO, TITLE, CONTENT, WRITER, ENROLL_DATE, DEL_YN

CREATE TABLE BOARD(
    NO              NUMBER
    , TITLE         VARCHAR(100)
    , CONTENT       VARCHAR(100)
    , WRITER        VARCHAR(100)
    , ENROLL_DATE   TIMESTAMP
    , DEL_YN        VARCHAR(1)
    );
    
CREATE SEQUENCE BOARDNO;

--게시글 작성
INSERT INTO BOARD(NO, TITLE, CONTENT, WRITER, ENROLL_DATE, DEL_YN)
VALUES(BOARDNO.NEXTVAL, '제목', '내용', '글쓴이', SYSDATE, 'N');



--게시글 목록 조회(최신순)
SELECT NO, TITLE, WRITER, ENROLL_DATE
FROM BOARD
ORDER BY NO DESC
;

--게시글 상세 조회(게시글 번호 이용해서)
SELECT TITLE, WRITER, CONTENT, ENROLL_DATE
FROM BOARD
WHERE NO = 1
;

--게시글 검색(제목 검색)
SELECT TITLE, WRITER, CONTENT,ENROLL_DATE
FROM BOARD
WHERE TITLE = '제목'
;

-- 게시글 검색 ( 내용 검색)
SELECT TITLE, WRITER, CONTENT ,ENROLL_DATE
FROM BOARD
WHERE CONTENT = '내용'
;

-- 게시글 수정 ( 제목 수정 - 게시글 번호 이용해서 )
UPDATE BOARD
SET TITLE = '제목2'
WHERE NO = 1
;

-- 게시글 수정 ( 내용 수정 - 게시글 번호 이용해서 ) 
UPDATE BOARD
SET CONTENT = '내용2'
WHERE NO = 1
;
 
-- 게시글 삭제 ( 번호 이용해서 )
DELETE BOARD
WHERE NO = 1
;

SELECT * FROM BOARD;

