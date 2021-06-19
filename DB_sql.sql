-------------------------------------- �ʼ� ------------------------------------------------
create table member ( -- ȸ������
    id nvarchar2(20) constraint PK_MEMBER_ID PRIMARY KEY, -- �⺻Ű PK_���̺��_pk�� �÷���
    pwd nvarchar2(20) NOT NULL,
    name nvarchar2(10) NOT NULL,
    email nvarchar2(30) NOT NULL,
    address nvarchar2(50) NOT NULL,
    admin int);

create table productinfo ( -- ��ǰ���� ���̺�
    productId NUMBER constraint PK_PRODUCTINFO_PRODUCTID PRIMARY KEY, --pk
    productCode NUMBER NOT NULL,
    name NVARCHAR2(30) NOT NULL,
    detailedLink NVARCHAR2(100) NOT NULL,
    thumbnailLink NVARCHAR2(100) NOT NULL,
    price NUMBER NOT NULL,
    stock NUMBER
);

create table board ( -- �ı�Խ���
    memberId NVARCHAR2(20),
    productId NUMBER,
    boardID NUMBER constraint PK_BOARD_BOARDID PRIMARY KEY,
    regtime date NOT NULL,
    content NVARCHAR2(500) NOT NULL,
    -- �ܷ�Ű ����
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
    --�ܷ�Ű
    -- CONSTRAINT [�������� ��] FOREIGN KEY([�÷���])
    -- REFERENCES [������ ���̺� �̸�]([������ �÷�])
    -- [ON DELETE CASCADE | ON DELETE SET NULL]
    -- ������ �θ� ���̺� ���� �����Ǹ� �ڽ� ���̺��� �÷� ����, �������� �θ� ���̺� ���� �����Ǹ� �ڽ� NULL������ ����

create sequence board_seq_auto start with 1 increment by 1 minvalue 1 maxvalue 99999999; -- board ������
-- productInfo �������� ���߿� ������ ��� �� ��������� �� ����

-------------------------------------- �ʼ� ------------------------------------------------

-- ������ �ʱ�ȭ�ϰ� ���� ��
alter sequence board_seq_auto increment by 1;
-- (drop���� ����)
drop SEQUENCE board_seq_auto;
-- insert into board values(memberId, productId, board_seq_auto.nextval, title, regtime, content);
-- boardId �κп� �������� �־���
    -- CREATE SEQUENCE �������̸� START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 99999999;
    -- start with : ���� �� ����
    -- increment by ������ �� ����
    -- maxvalue : �ִ� �� ����
    -- minvalue : �ּ� �� ����

-- auto Increment ��ȸ
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
drop table member; -- MEMBER table ����
drop table productinfo; -- productinfo table ����
drop table board; -- �ı�Խ��� table ����
drop table basket;

-- BOARD ���̺� Test��    
select to_char(regtime, 'yy/mm/dd hh24:mi') from board;
insert into board values ('as', 8, board_seq_auto.nextval, sysdate, 'badCpu');

select count(MemberId) from board
where ProductId = 1;