create table member ( -- 회원정보
    id nvarchar2(20) constraint PK_MEMBER_ID PRIMARY KEY, -- 기본키 PK_테이블명_pk인 컬럼명
    pwd nvarchar2(20),
    name nvarchar2(10),
    email nvarchar2(30),
    address nvarchar2(50),
    admin int);

create table productinfo ( -- 상품정보 테이블
    productId NUMBER constraint PK_PRODUCTINFO_PRODUCTID PRIMARY KEY, --pk
    productCode NUMBER,
    name NVARCHAR2(30),
    info NVARCHAR2(200),
    detailedLink NVARCHAR2(100),
    thumbnailLink NVARCHAR2(100),
    price NUMBER,
    stock NUMBER
);

create table board ( -- 후기게시판
    memberId NVARCHAR2(20),
    productId NUMBER,
    boardID NUMBER constraint PK_BOARD_BOARDID PRIMARY KEY,
    title NVARCHAR2(60),
    regtime date,
    content NVARCHAR2(100),
    -- 외래키 지정
    constraint FK_MEMBER_BOARD_MEMBERID FOREIGN KEY(memberId)
        REFERENCES MEMBER(id) ON DELETE CASCADE,
    constraint FK_PRODUCTINFO_BOARD_PRODUCTID FOREIGN KEY(productID)
        REFERENCES PRODUCTINFO(productID) ON DELETE CASCADE
);
    --외래키
    -- CONSTRAINT [제약조건 명] FOREIGN KEY([컬럼명])
    -- REFERENCES [참조할 테이블 이름]([참조할 컬럼])
    -- [ON DELETE CASCADE | ON DELETE SET NULL]
    -- 왼쪽은 부모 테이블에 값이 삭제되면 자식 테이블의 컬럼 삭제, 오른쪽은 부모 테이블에 값이 삭제되면 자식 NULL값으로 변경

create table basket ( -- 장바구니 아직 안함
    
);
    
drop table member; -- MEMBER table 삭제
drop table productinfo; -- productinfo table 삭제
drop table board; -- 후기게시판 table 삭제