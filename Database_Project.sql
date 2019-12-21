-- 회원 테이블
CREATE TABLE MEMBER (
    MEMID NVARCHAR2( 10 ) NOT NULL  PRIMARY KEY,
    NICKNAME NVARCHAR2( 10 ) NOT NULL,
    BIRTH NVARCHAR2( 20 ) NOT NULL,
    GENDER NVARCHAR2( 5 ) NOT NULL,
    EMAIL NVARCHAR2( 20 ) NOT NULL
);

-- 회원 테이블 값 삽입
INSERT INTO MEMBER VALUES('rlfehd12', 'gildong', '1974-09-05', '남', 'gildong@naver.com'); 
INSERT INTO MEMBER VALUES('dudtn00', 'zero', '1998-07-04', '남', 'dndn@gmail.com');
INSERT INTO MEMBER VALUES('dbfl5454', 'yuri11', '1996-03-28', '여', 'abc@naver.com');
INSERT INTO MEMBER VALUES('ooooo2', 'o2', '1990-01-16', '여', 'h2o@naver.com');
INSERT INTO MEMBER VALUES('qq1dd', 'ase2', '1987-09-18', '남', 'dmm@gmail.com');

-- ---------------------------------------------------------------
-- 영화 테이블
CREATE TABLE MOVIE (
    MID NUMBER(5) NOT NULL PRIMARY KEY,
    MNAME NVARCHAR2( 20 ) NOT NULL,
    OPENING NVARCHAR2( 20 ) NOT NULL,
    RUNTIME NVARCHAR2( 10 ) NOT NULL,
    COUNTARY NVARCHAR2( 15 ) NOT NULL,
    GENRE NVARCHAR2( 10 ) NOT NULL
);

-- 영화 테이블 값 삽입
INSERT INTO MOVIE VALUES (0001, '기생충', '2019년 5월 30일', '132분', '한국', '블랙 코미디'); 
INSERT INTO MOVIE VALUES (0002, '겨울왕국 2', '2019년 11월 21일', '103분', '미국', '애니메이션'); 
INSERT INTO MOVIE VALUES (0003, '센과 치히로의 행방불명', '2002년 6월 28일', '126분', '일본', '애니메이션'); 
INSERT INTO MOVIE VALUES (0004, '설국열차', '2013년 8월 1일', '126분', '한국', 'SF');
INSERT INTO MOVIE VALUES (0005, '인셉션', '2010년 7월 21일', '148분', '미국', 'SF'); 
INSERT INTO MOVIE VALUES (0006, '월-E', '2008년 8월 6일', '100분', '미국', '애니메이션');
INSERT INTO MOVIE VALUES (0007, '업', '2009년 7월 29일', '101분', '미국', '애니메이션'); 
INSERT INTO MOVIE VALUES (0008, '서치', '2018년 8월 29일', '101분', '미국', '드라마');
INSERT INTO MOVIE VALUES (0009, '세 얼간이', '2011년 8월', '170분', '인도', '코미디'); 
INSERT INTO MOVIE VALUES (0010, '아바타', '2009년 12월 17일', '162분', '미국', 'SF');

-- ---------------------------------------------------------------
-- 리뷰 테이블
CREATE TABLE REVIEW (
    RENO NUMBER( 5 ) NOT NULL,
    MID NUMBER( 5 ) NOT NULL,
    RE_NAME NVARCHAR2( 30 ) NOT NULL,
    RE_CONTENT NVARCHAR2( 200 ) NOT NULL,
    MEMID NVARCHAR2( 10 ),
     FOREIGN KEY(MEMID) REFERENCES MEMBER(MEMID),
     PRIMARY KEY (RENO, MID)
);
-- ---------------------------------------------------------------
-- 감독 테이블
CREATE TABLE DIRECTOR (
    DID NUMBER( 5 ) NOT NULL PRIMARY KEY,
    DNAME NVARCHAR2( 10 ) NOT NULL,
    COUNTARY NVARCHAR2( 15 )  NOT NULL,
    BIRTH NVARCHAR2( 20 ) NOT NULL
);
-- ---------------------------------------------------------------
-- 배우 테이블
CREATE TABLE ACTOR (
    AID NUMBER( 5 ) NOT NULL PRIMARY KEY,
    ANAME NVARCHAR2( 10 ) NOT NULL,
    COUNTARY NVARCHAR2( 15 ) NOT NULL,
    BIRTH NVARCHAR2( 20 ) NOT NULL
);
-- ---------------------------------------------------------------
-- 영화제 테이블
CREATE TABLE FESTIVAL (
    FNO NUMBER( 4 ) NOT NULL PRIMARY KEY,
    FNAME NVARCHAR2( 20 ) NOT NULL
);
-- ---------------------------------------------------------------
-- 수상 테이블
CREATE TABLE PRIME (
    PNO NUMBER( 3 ) NOT NULL ,
    FNO NUMBER( 3 ) NOT NULL ,
    DID NUMBER( 5 ),
    AW_MOVIE NVARCHAR2( 20 ) NOT NULL ,
    AWARD NVARCHAR2( 20 ) NOT NULL,
        PRIMARY KEY (PNO , FNO ),
        FOREIGN KEY(DID) REFERENCES DIRECTOR(DID)
);
-- ---------------------------------------------------------------
-- 카테고리 테이블
CREATE TABLE CATEGORY (
    CATEGORY_ID NUMBER( 10 ) NOT NULL PRIMARY KEY,
    CATEGORY_NAME NVARCHAR2( 10 ) NOT NULL
);
-- ---------------------------------------------------------------
-- 부서 테이블
CREATE TABLE DEPARTMENT (
    DEPTNAME NVARCHAR2( 10 ) NOT NULL PRIMARY KEY,
    CATEGORY_ID NUMBER( 10 ) NOT NULL,
            FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
);
-- ---------------------------------------------------------------
-- 관리자 테이블
CREATE TABLE ADMIN (
    ADMIN_ID NUMBER( 5 ) NOT NULL ,
    ADMIN_NAME NVARCHAR2( 10 ) NOT NULL ,
    DEPT NVARCHAR2( 10 ) NOT NULL,
        FOREIGN KEY(DEPT) REFERENCES DEPARTMENT(DEPTNAME) ON DELETE SET NULL
);
-- ---------------------------------------------------------------
-- 카테고리 담당자 테이블
CREATE TABLE CATEGORY_RESP (
    ADMIN_ID NUMBER( 5 ),
    CATEGORY_ID NUMBER( 10 ),
    PRIMARY KEY(ADMIN_ID, CATEGORY_ID),
        FOREIGN KEY(ADMIN_ID, CATEGORY_ID) REFERENCES CATEGORY_RESP(ADMIN_ID, CATEGORY_ID) ON DELETE SET NULL
);
-- ---------------------------------------------------------------
-- DB게시판 테이블
CREATE TABLE DB_NOTICEBOARD (
    DBNO NUMBER( 5 ) NOT NULL,
    DBNAME NVARCHAR2( 50 ) NOT NULL ,
    DBCONTENT NVARCHAR2( 200 ) NOT NULL ,
    MEMID NVARCHAR2( 10 ), 
    ADMIN_ID NUMBER( 5 ),
     CATEGORY_ID NUMBER( 10 ),
         PRIMARY KEY(DBNO),
         FOREIGN KEY(ADMIN_ID,CATEGORY_ID) REFERENCES CATEGORY_RESP(ADMIN_ID, CATEGORY_ID),
         FOREIGN KEY(MEMID) REFERENCES MEMBER(MEMID) ON DELETE CASCADE
);
-- ---------------------------------------------------------------
-- 평가 테이블
CREATE TABLE ASSESSMENT (
    ASSNAME NVARCHAR2( 20 ) NOT NULL primary key,
    MEMID NVARCHAR2( 10 ),
    RENO NUMBER( 5 ),
    CONTENT NVARCHAR2( 50 ) NOT NULL ,
    RECOMMEND NUMBER( 1 ) NULL
);
-- ---------------------------------------------------------------
-- 연출 테이블
CREATE TABLE DIRECTION (
    MID NUMBER( 5 ),
    DID NUMBER( 5 ),
        PRIMARY KEY(MID , DID),
        FOREIGN KEY(MID) REFERENCES MOVIE(MID),
        FOREIGN KEY(DID) REFERENCES DIRECTOR(DID)
);
-- ---------------------------------------------------------------
-- 출연 테이블
CREATE TABLE APPEAR (
    MID NUMBER( 5 ),
    AID NUMBER( 5 ),
        PRIMARY KEY(MID , AID),
        FOREIGN KEY(MID) REFERENCES MOVIE(MID),
        FOREIGN KEY(AID) REFERENCES ACTOR(AID)
);
-- ---------------------------------------------------------------
-- 제공 테이블
CREATE TABLE PROVIDE (
    MID NUMBER( 5 ),
    MEMID NVARCHAR2( 10 ) ,
    RENO NUMBER( 5 ),
         FOREIGN KEY(MEMID) REFERENCES MEMBER(MEMID),
         FOREIGN KEY(RENO, MID) REFERENCES REVIEW(RENO, MID)
);
-- ---------------------------------------------------------------
-- 감독 필모그래피
CREATE TABLE DIRECTOR_FILMOGRAPHY (
    DID NUMBER( 5 ),
    FILMOGRAPHY NVARCHAR2( 20 ) NOT NULL,
        PRIMARY KEY(DID),
        FOREIGN KEY(DID) REFERENCES DIRECTOR(DID)
);
-- ---------------------------------------------------------------
-- 배우 필모그래피
CREATE TABLE ACTOR_FILMOGRAPHY (
    AID NUMBER( 5 ),
    FILMOGRAPHY NVARCHAR2( 20 ) NOT NULL,
        PRIMARY KEY(AID),
        FOREIGN KEY(AID) REFERENCES ACTOR(AID)
);