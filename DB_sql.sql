-------------------------------------- 필수 ------------------------------------------------
create table member ( -- 회원정보
    id nvarchar2(20) constraint PK_MEMBER_ID PRIMARY KEY, -- 기본키 PK_테이블명_pk인 컬럼명
    pwd nvarchar2(20) NOT NULL,
    name nvarchar2(10) NOT NULL,
    email nvarchar2(30) NOT NULL,
    address nvarchar2(50) NOT NULL,
    admin int);

create table productinfo ( -- 상품정보 테이블
    productId NUMBER constraint PK_PRODUCTINFO_PRODUCTID PRIMARY KEY, --pk
    productCode NUMBER NOT NULL,
    name NVARCHAR2(30) NOT NULL,
    detailedLink NVARCHAR2(100) NOT NULL,
    thumbnailLink NVARCHAR2(100) NOT NULL,
    price NUMBER NOT NULL,
    stock NUMBER
);

create table board ( -- 후기게시판
    memberId NVARCHAR2(20),
    productId NUMBER,
    boardID NUMBER constraint PK_BOARD_BOARDID PRIMARY KEY,
    regtime date NOT NULL,
    content NVARCHAR2(500) NOT NULL,
    -- 외래키 지정
    constraint FK_MEMBER_BOARD_MEMBERID FOREIGN KEY(memberId)
        REFERENCES MEMBER(id) ON DELETE CASCADE,
    constraint FK_PRODUCTINFO_BOARD_PRODUCTID FOREIGN KEY(productID)
        REFERENCES PRODUCTINFO(productID) ON DELETE CASCADE
);

create table basket(
    memberId NVARCHAR2(20),
    productId NUMBER,
    regtime date,
    quantity number,
    constraint FK_MEMBER_BASKET_MEMBERID FOREIGN KEY (memberId)
        REFERENCES MEMBER(id) ON DELETE CASCADE,
    constraint FK_PRODUCTINFO_BASKET_PRODUCTID FOREIGN KEY (productID)
        REFERENCES PRODUCTINFO(productID) ON DELETE CASCADE
);
create table orderlist (
    memberId nvarchar2(20),
    productId number,
    quantity number,
    regtime date,
    constraint FK_MEMBER_ORDERLIST_MEMBERID FOREIGN KEY (memberId)
        REFERENCES MEMBER(id) ON DELETE CASCADE,
    constraint FK_PRODUCTINFO_ORDERLIST_PRODUCTID FOREIGN KEY (productID)
        REFERENCES PRODUCTINFO(productID) ON DELETE CASCADE
);
    --외래키
    -- CONSTRAINT [제약조건 명] FOREIGN KEY([컬럼명])
    -- REFERENCES [참조할 테이블 이름]([참조할 컬럼])
    -- [ON DELETE CASCADE | ON DELETE SET NULL]
    -- 왼쪽은 부모 테이블에 값이 삭제되면 자식 테이블의 컬럼 삭제, 오른쪽은 부모 테이블에 값이 삭제되면 자식 NULL값으로 변경

create sequence board_seq_auto start with 1 increment by 1 minvalue 1 maxvalue 99999999; -- board 시퀀스
-- productInfo 시퀀스는 나중에 관리자 기능 다 만들어졌을 때 적용

-------------------------------------- 필수 ------------------------------------------------

-- 시퀸스 초기화하고 싶을 때
alter sequence board_seq_auto increment by 1;
-- (drop으로 삭제)
drop SEQUENCE board_seq_auto;
-- insert into board values(memberId, productId, board_seq_auto.nextval, title, regtime, content);
-- boardId 부분에 시퀀스를 넣어줌
    -- CREATE SEQUENCE 시퀀스이름 START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 99999999;
    -- start with : 시작 값 지정
    -- increment by 증가할 값 지정
    -- maxvalue : 최대 값 지정
    -- minvalue : 최소 값 지정

-- auto Increment 조회
select LAST_NUMBER from USER_SEQUENCES where SEQUENCE_NAME = 'board_seq_auto';
alter sequence board_seq_auto 
alter sequence board_seq_auto increment by 1;

    -- DetailReview
    select * from (select rownum num, L.* from (select B.memberId, B.regtime, B.content, P.name, P.thumbnaillink from board B join productinfo P on B.productId = P.productId order by regtime desc) L) where num between 1 and 9;
    
    select p.name, p.thumbnaillink, p.price, count(b.memberId) as "count" from productInfo p join basket b
    on p.productId = b.productId
    where b.memberId = 'as'
    group by p.name, p.thumbnaillink, p.price;
    
    select p.name, p.thumbnaillink, b.memberId, b.regtime, b.content
    from productInfo p join board b
    on p.productId = b.productId
    order by b.regtime desc;
    select * from Board where productId = 1 order by regtime desc;
    
    select p.name, p.thumbnaillink, b.memberId, b.regtime, b.content from productInfo p join board b on p.productId = b.productId order by b.regtime desc
    
    select * from productInfo
    where productCode = 1
    order by productId desc;
    
    select p.name, p.thumbnaillink, p.price, count(b.memberId) from productInfo p join basket b on p.productId = b.productId where b.memberId = 'as' group by p.name, p.thumbnaillink, p.price;
    
    where productId = ;
    (select productId, count(*) from basket
    group by memberId, productId);
    
    select b.productId from basket b
    where memberId = 'as';
    
    select productId, productcode, name, detailedlink, thumbnaillink, price, stock from productInfo
    where productId in (select productId from basket
                        where memberId = (select memberId from member
                                          where id = 'as'));
    select     
drop table member; -- MEMBER table 삭제
drop table productinfo; -- productinfo table 삭제
drop table board; -- 후기게시판 table 삭제
drop table basket;

-- BOARD 테이블 Test용    
select to_char(regtime, 'yy/mm/dd hh24:mi') from board;
insert into board values ('as', 8, board_seq_auto.nextval, sysdate, 'badCpu');

select count(MemberId) from board
where ProductId = 1;