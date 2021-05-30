create table member (
    id nvarchar2(20),
    pwd nvarchar2(20),
    name nvarchar2(10),
    email nvarchar2(30),
    address nvarchar2(50),
    admin int);

alter table MEMBER add constraint PK_MEMBER_id
primary key(id); --MEMBER ���̺��� id�� �⺻Ű

create table basket ( -- ��ٱ��� ���� ����
    
);
    
drop table member; -- MEMBER table ����
drop table productinfo; -- productinfo table ����

create table productinfo (
    productId NUMBER constraint PK_PRODUCTINFO_PRODUCTID PRIMARY KEY, --pk
    productCode NUMBER,
    name NVARCHAR2(30),
    info NVARCHAR2(200),
    detailedLink NVARCHAR2(100),
    thumbnailLink NVARCHAR2(100),
    price NUMBER,
    stock NUMBER
);

create table board (
    memberId nvarchar2(20),
    title nvarchar2(60),
    regtime nvarchar2(20),
    hits number,
    content nvarchar2(100)
);
