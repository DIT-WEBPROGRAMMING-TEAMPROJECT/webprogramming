create table member ( -- ȸ������
    id nvarchar2(20) constraint PK_MEMBER_ID PRIMARY KEY, -- �⺻Ű PK_���̺��_pk�� �÷���
    pwd nvarchar2(20),
    name nvarchar2(10),
    email nvarchar2(30),
    address nvarchar2(50),
    admin int);

create table productinfo ( -- ��ǰ���� ���̺�
    productId NUMBER constraint PK_PRODUCTINFO_PRODUCTID PRIMARY KEY, --pk
    productCode NUMBER,
    name NVARCHAR2(30),
    info NVARCHAR2(200),
    detailedLink NVARCHAR2(100),
    thumbnailLink NVARCHAR2(100),
    price NUMBER,
    stock NUMBER
);

create table board ( -- �ı�Խ���
    memberId NVARCHAR2(20),
    productId NUMBER,
    boardID NUMBER constraint PK_BOARD_BOARDID PRIMARY KEY,
    title NVARCHAR2(60),
    regtime date,
    content NVARCHAR2(100),
    -- �ܷ�Ű ����
    constraint FK_MEMBER_BOARD_MEMBERID FOREIGN KEY(memberId)
        REFERENCES MEMBER(id) ON DELETE CASCADE,
    constraint FK_PRODUCTINFO_BOARD_PRODUCTID FOREIGN KEY(productID)
        REFERENCES PRODUCTINFO(productID) ON DELETE CASCADE
);
    --�ܷ�Ű
    -- CONSTRAINT [�������� ��] FOREIGN KEY([�÷���])
    -- REFERENCES [������ ���̺� �̸�]([������ �÷�])
    -- [ON DELETE CASCADE | ON DELETE SET NULL]
    -- ������ �θ� ���̺� ���� �����Ǹ� �ڽ� ���̺��� �÷� ����, �������� �θ� ���̺� ���� �����Ǹ� �ڽ� NULL������ ����

create table basket ( -- ��ٱ��� ���� ����
    
);
    
drop table member; -- MEMBER table ����
drop table productinfo; -- productinfo table ����
drop table board; -- �ı�Խ��� table ����