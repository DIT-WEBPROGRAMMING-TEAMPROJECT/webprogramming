create table member ( -- 회원정보
    id nvarchar2(20) constraint PK_MEMBER_id PRIMARY KEY, -- 기본키 PK_테이블명_pk인 컬럼명
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

);


create table basket ( -- 장바구니 아직 안함
    
);
    
drop table member; -- MEMBER table 삭제
drop table productinfo; -- productinfo table 삭제
drop table board; -- 후기게시판 table 삭제