-- 회원 테이블
CREATE TABLE MEMBER (
    MEMID NVARCHAR2( 10 ) NOT NULL  PRIMARY KEY,
    NICKNAME NVARCHAR2( 10 ) NOT NULL,
    BIRTH DATE NOT NULL,
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
    OPENING DATE NOT NULL,
    RUNTIME NUMBER( 4 ) NOT NULL,
    COUNTARY NVARCHAR2( 15 ) NOT NULL,
    GENRE NVARCHAR2( 10 ) NOT NULL
);

-- 영화 테이블 값 삽입
INSERT INTO MOVIE VALUES (0001, '기생충', '2019-05-30', '132', '한국', '블랙 코미디'); 
INSERT INTO MOVIE VALUES (0002, '겨울왕국 2', '2019-11-21', '103', '미국', '애니메이션'); 
INSERT INTO MOVIE VALUES (0003, '센과 치히로의 행방불명', '2002-06-28', '126', '일본', '애니메이션'); 
INSERT INTO MOVIE VALUES (0004, '설국열차', '2013-08-01', '126', '한국', 'SF');
INSERT INTO MOVIE VALUES (0005, '인셉션', '2010-07-21', '148', '미국', 'SF'); 
INSERT INTO MOVIE VALUES (0006, '월-E', '2008-08-06', '100', '미국', '애니메이션');
INSERT INTO MOVIE VALUES (0007, '업', '2009-07-29', '101', '미국', '애니메이션'); 
INSERT INTO MOVIE VALUES (0008, '서치', '2018-08-29', '101', '미국', '드라마');
INSERT INTO MOVIE VALUES (0009, '세 얼간이', '2011-08-12', '170', '인도', '코미디'); 
INSERT INTO MOVIE VALUES (0010, '아바타', '2009-12-17', '162', '미국', 'SF');

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
-- 리뷰 테이블값 삽입
INSERT INTO REVIEW VALUES (0001, 0001, '희비를 외줄타듯 넘나드는, 참으로 시의적절한 우화', '봉준호 감독이 사랑받는 가장 큰 이유는 ''일타쌍피의 장인''이란 것이다. 대중적인 재미와 예술적 완성도 모두 A급으로 보장하는 장르 영화 감독이라니, 불가능해 보이지만 이를 가능케 하는 감독이 바로 봉준호다. 필자가 호평한 영화들 중 재밌냐는 질문에 대답하기 난감한 녀석들이 종종 있다. 하지만 <기생충>은 과감하게 ''오지게 재밌다!!!''라고 말할 수 있다. ', 'ooooo2');
INSERT INTO REVIEW VALUES (0002, 0001, '한국영화라는 ‘장르’, 봉준호 영화의 ‘이상함’', '<기생충>에서는 ‘한국적’이라는 것과 ‘한국성’이라는 것이 분리되어있다. 여기서 ‘한국적’이라는 것은 우리가 사회적으로 접할 수 있는 뉴스에 근거한 여러 담론을 뜻한다. 따라서 평소에 뉴스만 자주 보았다면, 외국인이라도 쉽게 이해하고 공감할 수 있는 표면적인 지점이다. ', 'dbfl5454');
INSERT INTO REVIEW VALUES (0003, 0003, '목욕은 나를 벗겨내서 나를 찾아내는 일', '여흥으로, 이 작품은 공산주의적 관점으로 볼 수도 있다. 유바바는 자본주의 사회의 중간 관리자쯤 된다. 임원들과 계약을 하고, 프롤레타리아들과의 계약을 하는 일을 한다. 프롤레타리아는 이름을 빼앗기고, ‘사원 no.00001’로 관리된다. 이 체계에서는 딱히 도망칠 곳이 없어 보인다.', 'ooooo2');
INSERT INTO REVIEW VALUES (0004, 0008, '데스크탑 필름의 가능성과 한계', '<서치>는 모두가 SNS를 가지고 있고, 몇 번의 검색을 통해 상대방에 대한 상당한 정보를 알아낼 수 있는 시대이기에 가능한 이야기임과 동시에,  데스크탑 필름이 장르영화 공식을 어떻게 소화해낼 수 있는지, 더 나아가 드라마적 연출의 가능성을 보여준 오프닝 시퀀스 등의 장점은 젊은 감독이 이끌어낸 뚜렷한 성취이다.', 'dudtn00');
INSERT INTO REVIEW VALUES (0005, 0010, '엄청난 시각효과가 돋보였던 영화', '개봉당시 엄청난 시각효과를 자랑하는 컴퓨터그래픽과 연출로 전세계를 놀라게 했던 영화이다. 하지만 나는 시각효과,컴퓨터그래픽,액션,연출같은 면에서는 정말 칭찬해주고 싶고 잘 만들었다고 인정하지만, 솔직히 그거밖에 볼게 없었던거 같다.', 'rlfehd12');
INSERT INTO REVIEW VALUES (0006, 0007, '스키마의 반전을 다룬  플롯을  애니메이션에서 해낸다', '픽사가 대사 없이 작품을 진행할 때는 주목해야 한다. <월-e>의 초반 40분과 같이 본 작의 초반 5분은 정말 아름답다. 특히 우체통을 만들 때 칼이 본의 아닌 핸드 프린팅(?)을 했을 때 엘리가 따라서 손자국을 남기는 장면은 그 자체로 시와 같다. 그 장면으로도 사랑이 무엇인지 알게 되니까. 그 장면이 인상 깊다.', 'ooooo2');
INSERT INTO REVIEW VALUES (0007, 0002, '실패는 아니지만 성공이라 할 수는 없는 속편', '엘사와 안나의 자매애는 여전히 유효한 이야기이며, 아버지에게서 아들로 왕위와 전통이 계승되는 클리셰(가령 말을 길들인다는 상징)가 어머니에게서 딸로 계승되는 것으로 변화한 지점, 가을이라는 계절이 주는 시각적 쾌감, 전작만큼 캐치하진 않지만 적어도 영화를 보는 동안은 즐거운 음악은 <겨울왕국 2>의 강점이다. ', 'dbfl5454');
INSERT INTO REVIEW VALUES (0008, 0001, '이렇게 재밌고 흥미로운데 예술적이기까지 한 봉준호 월드', '<기생충>은 충분히 ''다른'' 영화다. 그 공간을 옮기는 과정의 영화라는 공간에서 한정되고 보편화 되었던 장르적인 방식에 얶매였던 관객들의 시각을 조금은 다른 시각으로 안내할 수 있는 영화다. 그것만으로 <기생충>의 영화적 성취는 충분히 놀랍다.', 'qq1dd');
-- ---------------------------------------------------------------
-- 감독 테이블
CREATE TABLE DIRECTOR (
    DID NUMBER( 5 ) NOT NULL PRIMARY KEY,
    DNAME NVARCHAR2( 10 ) NOT NULL,
    COUNTARY NVARCHAR2( 15 )  NOT NULL,
    BIRTH DATE NOT NULL
);
-- 감독 테이블값 삽입
INSERT INTO DIRECTOR VALUES (0001, '봉준호', '한국', '1969-09-14');
INSERT INTO DIRECTOR VALUES (0002, '크리스 벅', '미국', '1958-02-24'); 
INSERT INTO DIRECTOR VALUES (0003, '미야자키 하야오', '일본', '1941-01-05');
INSERT INTO DIRECTOR VALUES (0004, '크리스토퍼 놀란', '영국', '1970-07-30');
INSERT INTO DIRECTOR VALUES (0005, '앤드류 스탠튼', '미국', '1965-12-03');
INSERT INTO DIRECTOR VALUES (0006, '피트 닥터', '미국', '1968-10-09');
INSERT INTO DIRECTOR VALUES (0007, '아니시 샤간티', '미국', '1991-01-01');
INSERT INTO DIRECTOR VALUES (0008, '라지쿠마르 히라니', '인도', '1962-01-20');
INSERT INTO DIRECTOR VALUES (0009, '제임스 카메론', '캐나다', '1954-08-16');
INSERT INTO DIRECTOR VALUES (0010, '박찬욱', '한국', '1963-08-23');
-- ---------------------------------------------------------------
-- 배우 테이블
CREATE TABLE ACTOR (
    AID NUMBER( 5 ) NOT NULL PRIMARY KEY,
    ANAME NVARCHAR2( 10 ) NOT NULL,
    COUNTARY NVARCHAR2( 15 ) NOT NULL,
    BIRTH DATE NOT NULL
);
-- 배우 테이블값 삽입
INSERT INTO ACTOR VALUES (0001, '송강호', '한국', '1967-01-17');
INSERT INTO ACTOR VALUES (0002, '디카프리오', '미국', '1974-11-11');
INSERT INTO ACTOR VALUES (0003, '매튜 매커너히', '미국', '1969-11-04');
INSERT INTO ACTOR VALUES (0004, '톰 행크스', '미국', '1956-07-09');
INSERT INTO ACTOR VALUES (0005, '이하늬', '한국', '1983-03-02');
INSERT INTO ACTOR VALUES (0006, '조여정', '한국', '1981-02-10');
INSERT INTO ACTOR VALUES (0007, '크리스 에반스', '미국', '1981-06-13일');

-- ---------------------------------------------------------------
-- 영화제 테이블
CREATE TABLE FESTIVAL (
    FNO NUMBER( 4 ) NOT NULL PRIMARY KEY,
    FNAME NVARCHAR2( 20 ) NOT NULL
);

-- 영화제 테이블값 삽입
INSERT INTO FESTIVAL VALUES (0001, '칸 영화제');
INSERT INTO FESTIVAL VALUES (0002, '베를린 영화제');
INSERT INTO FESTIVAL VALUES (0003, '아카데미 상');
INSERT INTO FESTIVAL VALUES (0004, '휴고상');
INSERT INTO FESTIVAL VALUES (0005, '골든글로브상');
INSERT INTO FESTIVAL VALUES (0006, '백상예술대상');
INSERT INTO FESTIVAL VALUES (0007, '선댄스 영화제');
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

-- 수상 테이블값 삽입
INSERT INTO PRIME VALUES (0001, 0001, 0001, '기생충', '황금종려상');
INSERT INTO PRIME VALUES (0002, 0007, 0007, '서치', '관객상');
INSERT INTO PRIME VALUES (0003, 0003, 0003, '센과 치히로의 행방불명', '장편애니메이션상');
INSERT INTO PRIME VALUES (0004, 0002, 0003, '센과 치히로의 행방불명', '황금곰상');
INSERT INTO PRIME VALUES (0005, 0003, 0005, '월-E', '장편애니메이션상');
INSERT INTO PRIME VALUES (0006, 0004, 0005, '월-E', '최우수 드라마틱 프리젠테이션');
INSERT INTO PRIME VALUES (0007, 0004, 0004, '인셉션', '최우수 드라마틱 프리젠테이션');
INSERT INTO PRIME VALUES (0008, 0006, 0001, '설국열차', '영화부문 감독상');

-- ---------------------------------------------------------------
-- 카테고리 테이블
CREATE TABLE CATEGORY (
    CATEGORY_ID NUMBER( 10 ) NOT NULL PRIMARY KEY,
    CATEGORY_NAME NVARCHAR2( 10 ) NOT NULL
);

-- 카테고리 테이블값 삽입
INSERT INTO CATEGORY VALUES (1, 'DB제보');
INSERT INTO CATEGORY VALUES (2, '오류');
INSERT INTO CATEGORY VALUES (3, '이용제안');
INSERT INTO CATEGORY VALUES (4, '불법사용자 신고');
-- ---------------------------------------------------------------
-- 부서 테이블
CREATE TABLE DEPARTMENT (
    DEPTNAME NVARCHAR2( 10 ) NOT NULL PRIMARY KEY,
    CATEGORY_ID NUMBER( 10 ) NOT NULL,
            FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
);

-- 부서 테이블값 삽입
INSERT INTO DEPARTMENT VALUES ('기획부', 1);
INSERT INTO DEPARTMENT VALUES ('운영부', 2);
INSERT INTO DEPARTMENT VALUES ('관리부', 3);
INSERT INTO DEPARTMENT VALUES ('감사팀', 4);
-- ---------------------------------------------------------------
-- 관리자 테이블
CREATE TABLE ADMIN (
    ADMIN_ID NUMBER( 5 ) NOT NULL ,
    ADMIN_NAME NVARCHAR2( 10 ) NOT NULL ,
    DEPT NVARCHAR2( 10 ) NOT NULL,
        FOREIGN KEY(DEPT) REFERENCES DEPARTMENT(DEPTNAME) ON DELETE SET NULL
);

-- 관리자 테이블값 삽입
INSERT INTO ADMIN VALUES (5642, '김철수', '기획부');
INSERT INTO ADMIN VALUES (5412, '곽두철', '기획부');
INSERT INTO ADMIN VALUES (9741, '리청도', '관리부');
INSERT INTO ADMIN VALUES (2134, '조대척', '감사팀');
INSERT INTO ADMIN VALUES (5482, '여춘팔', '운영부');
-- ---------------------------------------------------------------
-- 카테고리 담당자 테이블
CREATE TABLE CATEGORY_RESP (
    ADMIN_ID NUMBER( 5 ),
    CATEGORY_ID NUMBER( 10 ),
    PRIMARY KEY(ADMIN_ID, CATEGORY_ID),
        FOREIGN KEY(ADMIN_ID, CATEGORY_ID) REFERENCES CATEGORY_RESP(ADMIN_ID, CATEGORY_ID) ON DELETE SET NULL
);

-- 카테고리 담당자 테이블값 삽입
INSERT INTO CATEGORY_RESP VALUES (5642, 1);
INSERT INTO CATEGORY_RESP VALUES (5412, 1);
INSERT INTO CATEGORY_RESP VALUES (9741, 3);
INSERT INTO CATEGORY_RESP VALUES (2134, 4);
INSERT INTO CATEGORY_RESP VALUES (5482, 2);
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

-- DB게시판 값 삽입
INSERT INTO DB_NOTICEBOARD VALUES (0001, '영화 좀 넣어주세요!!', '터미널, 캐치 미 이프 유 캔, 해리포터 시리즈 없는 게 왜이렇게 많나요...','dudtn00',5412,1);
INSERT INTO DB_NOTICEBOARD VALUES (0002, '없는 영화 업로드 부탁드립니다.', '일해라 일', 'ooooo2',  5642,1);
INSERT INTO DB_NOTICEBOARD VALUES (0003, '드라마는 업로드 안되나요?', '요새 시대가 어느 시대인데 영화만 관리합니까? 드라마도 해주세요', 'rlfehd12',  9741,3);
INSERT INTO DB_NOTICEBOARD VALUES (0004, '별점 테러 하고 다니는 이상한 놈.', '알바인가요 추천 테러 하고 다니는 사람을 보았습니다.', 'dudtn00',2134,4);

-- ---------------------------------------------------------------
-- 평가 테이블
CREATE TABLE ASSESSMENT (
    ASSNAME NVARCHAR2( 20 ) NOT NULL primary key,
    MEMID NVARCHAR2( 10 ),
    RENO NUMBER( 5 ),
    CONTENT NVARCHAR2( 50 ) NOT NULL ,
    RECOMMEND NUMBER( 1 ) NULL
);

-- 평가 테이블값 삽입
INSERT INTO ASSESSMENT VALUES ('스토리텔링의 후퇴', 'dudtn00', 0007, '감동도, 재미도 없을뿐더러 음악도 1편에 비해 형편없다.', 5);
INSERT INTO ASSESSMENT VALUES ('수직의 선으로 그어진 계급', 'rlfehd12', 0002, '<기생충>은 이 무기력을 장르영화의 활력으로 포장하고만 있을 뿐이다.', 2);
INSERT INTO ASSESSMENT VALUES ('영상혁명은 분명하나 12세용 각본', 'ooooo2', 0005, '기술의 진보보다 더욱 중요한 것은 기술의 활용', 2);
INSERT INTO ASSESSMENT VALUES ('누군가를 생각하는 마음', 'qq1dd', 0004, '공간이 좁아질수록 형식의 범위는 넓어진다', 5);

-- ---------------------------------------------------------------
-- 연출 테이블
CREATE TABLE DIRECTION (
    MID NUMBER( 5 ),
    DID NUMBER( 5 ),
        PRIMARY KEY(MID , DID),
        FOREIGN KEY(MID) REFERENCES MOVIE(MID),
        FOREIGN KEY(DID) REFERENCES DIRECTOR(DID)
);

-- 연출 테이블값 삽입
INSERT INTO DIRECTION VALUES (0001, 0001);
INSERT INTO DIRECTION VALUES (0002, 0002);
INSERT INTO DIRECTION VALUES (0003, 0003);
INSERT INTO DIRECTION VALUES (0004, 0001);
INSERT INTO DIRECTION VALUES (0005, 0004);
INSERT INTO DIRECTION VALUES (0006, 0005);
INSERT INTO DIRECTION VALUES (0007, 0006);
INSERT INTO DIRECTION VALUES (0008, 0007);

-- ---------------------------------------------------------------
-- 출연 테이블
CREATE TABLE APPEAR (
    MID NUMBER( 5 ),
    AID NUMBER( 5 ),
        PRIMARY KEY(MID , AID),
        FOREIGN KEY(MID) REFERENCES MOVIE(MID),
        FOREIGN KEY(AID) REFERENCES ACTOR(AID)
);

-- 출연 테이블값 삽입
INSERT INTO APPEAR VALUES (0001, 0001);
INSERT INTO APPEAR VALUES (0001, 0006);
INSERT INTO APPEAR VALUES (0004, 0001);
INSERT INTO APPEAR VALUES (0004, 0007);



-- ---------------------------------------------------------------
-- 제공 테이블
CREATE TABLE PROVIDE (
    MID NUMBER( 5 ),
    MEMID NVARCHAR2( 10 ) ,
    RENO NUMBER( 5 ),
         FOREIGN KEY(MEMID) REFERENCES MEMBER(MEMID),
         FOREIGN KEY(RENO, MID) REFERENCES REVIEW(RENO, MID)
);

-- 제공 테이블값 삽입
INSERT INTO PROVIDE VALUES (0001, 'ooooo2'  ,0001);
INSERT INTO PROVIDE VALUES (0001, 'dbfl5454' ,0002);
INSERT INTO PROVIDE VALUES (0003, 'ooooo2'  ,0003);
INSERT INTO PROVIDE VALUES (0008, 'dudtn00'  ,0004);
INSERT INTO PROVIDE VALUES (0010, 'rlfehd12'  ,0005);
INSERT INTO PROVIDE VALUES (0007, 'ooooo2'  ,0006);
INSERT INTO PROVIDE VALUES (0002, 'dbfl5454'  ,0007);
INSERT INTO PROVIDE VALUES (0001, 'qq1dd'  ,0008);

-- ---------------------------------------------------------------
-- 감독 필모그래피
CREATE TABLE DIRECTOR_FILMOGRAPHY (
    DID NUMBER( 5 ),
    FILMOGRAPHY NVARCHAR2( 20 ) NOT NULL,
        PRIMARY KEY(DID),
        FOREIGN KEY(DID) REFERENCES DIRECTOR(DID)
);

-- 감독 필모그래피값 삽입
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0001, '기생충');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0001, '설국열차');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0001, '괴물');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0002, '겨울왕국');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0002, '겨울왕국2');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0003, '센과 치히로의 행방불명');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0004, '인셉션');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0004, '인터스텔라');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0005, '월-E');

-- ---------------------------------------------------------------
-- 배우 필모그래피
CREATE TABLE ACTOR_FILMOGRAPHY (
    AID NUMBER( 5 ),
    FILMOGRAPHY NVARCHAR2( 20 ) NOT NULL,
        PRIMARY KEY(AID),
        FOREIGN KEY(AID) REFERENCES ACTOR(AID)
);

-- 배우 필모그래피값 삽입
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0001, '기생충');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0001, '설국열차');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0001, '괴물');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0002, '인셉션');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0002, '위대한 개츠비');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0002, '캐치 미 이프 유 캔');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0006, '기생충');
INSERT INTO DIRECTOR_FILMOGRAPHY VALUES (0007, '설국열차');
