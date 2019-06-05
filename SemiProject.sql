create user semi identified by semi;
grant connect, resource to semi;
commit;

--------------------------------------------------------------------------------

create table members(
    m_email varchar(30) primary key,
    m_pw varchar(100),
    m_name varchar(20) not null,
    m_phone varchar(20),
    m_zipcode varchar(20),
    m_address1 varchar(100),
    m_address2 varchar(100),
    m_joindate timestamp default sysdate not null,
    m_ipaddress varchar(20) not null,
    m_admin char(1) check(m_admin in('y', 'n'))
);
--drop table members;

select * from members;

select m_name, m_email, m_phone from members where m_email='junhaeyong95@naver.com';

commit;

--------------------------------------------------------------------------------

create table board(
    b_no number primary key,
    b_title varchar(100) not null,
    b_email varchar(30) not null,
    b_writer varchar(20) not null,
    b_amount number not null,
    b_bank varchar(20) not null,
    b_account varchar(30) not null,
    b_due_date timestamp not null,
    b_contents long not null,
    b_viewcount number default 0,
    b_writedate timestamp default sysdate not null,
    b_recommend number default 0 not null,
    b_sum_amount number default 0
);
--drop table board;

create sequence b_no_seq
start with 1
increment by 1
nocache
nomaxvalue;
--drop sequence b_no_seq;

select * from board;

commit;
--------------------------------------------------------------------------------

create table title_img(
    t_b_no number not null,
    t_fileName varchar(300) not null,
    t_oriFileName varchar(300) not null,
    t_filePath varchar(300) not null,
    t_fileSize number not null
);
--drop table title_img;

create sequence t_fileSeq_seq
start with 1
increment by 1
nocache
nomaxvalue;

create sequence t_b_no_seq
start with 1
increment by 1
nocache
nomaxvalue;
--drop sequence t_fileSeq_seq;

select * from title_img;

commit;

--------------------------------------------------------------------------------

create table payment(
    p_b_no number not null,
    p_name varchar(20) not null,
    p_email varchar(30) not null,
    p_phone varchar(20) not null,
    p_amount number not null,
    p_payment_date timestamp default sysdate not null
);
--drop table payment;

select * from payment;

commit;

--------------------------------------------------------------------------------

create table recommend(
    r_email varchar(30) not null,
    r_b_no number not null,
    r_b_title varchar(100) not null
);
--drop table recommend;

select * from recommend;

commit;

--------------------------------------------------------------------------------

create table comments(
    c_email varchar(30) not null,
    c_name varchar(20) not null,
    c_b_no number not null,
    c_comment varchar(1000) not null,
    c_write_date timestamp default sysdate not null
);
--drop table comments;

select * from comments;

commit;
