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
    m_joindate timestamp default sysdate,
    m_ipaddress varchar(20) not null,
    m_admin char(1) check(m_admin in('y', 'n'))
);
--drop table members;

select * from members;

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
    b_contents CLOB not null,
    b_viewcount number default 0,
    b_writedate timestamp default sysdate,
    b_recommend number default 0,
    b_sum_amount number default 0
);
drop table board;

create sequence b_no_seq
start with 1
increment by 1
nocache
nomaxvalue;
--drop sequence b_no_seq;

--select b_no_seq.currval from dual;

select * from board;

update board set b_due_date='190607' where b_no=3;

commit;

create table closed(
    cl_b_no number primary key,
    cl_b_title varchar(100) not null,
    cl_b_email varchar(30) not null,
    cl_b_writer varchar(20) not null,
    cl_b_amount number not null,
    cl_b_bank varchar(20) not null,
    cl_b_account varchar(30) not null,
    cl_b_due_date timestamp not null,
    cl_b_contents clob not null,
    cl_b_viewcount number default 0,
    cl_b_writedate timestamp default sysdate,
    cl_b_recommend number default 0,
    cl_b_sum_amount number default 0
);
--drop table closed;

select * from closed;

create or replace trigger board_delete_trg
after delete
on board
for each row
begin
    insert into closed values(:old.b_no, :old.b_title, :old.b_email, :old.b_writer, :old.b_amount,
    :old.b_bank, :old.b_account, :old.b_due_date, :old.b_contents, :old.b_viewcount, :old.b_writedate, :old.b_recommend, :old.b_sum_amount);
end;
/

--------------------------------------------------------------------------------

create table title_img(
    t_b_no number not null,
    t_fileName varchar(300) not null,
    t_oriFileName varchar(300) not null,
    t_filePath varchar(300) not null,
    t_fileSize number not null
);
--drop table title_img;

--create sequence t_b_no_seq
--start with 1
--increment by 1
--nocache
--nomaxvalue;
--drop sequence t_b_no_seq;

select * from title_img;

commit;

--------------------------------------------------------------------------------

create table payment(
    p_b_no number not null,
    p_name varchar(20) not null,
    p_email varchar(30) not null,
    p_phone varchar(20) not null,
    p_amount number not null,
    p_payment_date timestamp default sysdate
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
    c_write_date timestamp default sysdate
);
--drop table comments;

select * from comments;

commit;

--------------------------------------------------------------------------------

create table timepersoncount(
    time1 number,
    time2 number,
    time3 number,
    time4 number,
    time5 number,
    time6 number,
    time7 number,
    time8 number,
    time9 number,
    time10 number,
    time11 number,
    time12 number,
    time13 number,
    time14 number,
    time15 number,
    time16 number,
    time17 number,
    time18 number,
    time19 number,
    time20 number,
    time21 number,
    time22 number,
    time23 number,
    time24 number
);
insert into timepersoncount values(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
select * from timepersoncount;
                          
--------------------------------------------------------------------------------

create table closed(
    cl_b_no number primary key,
    cl_b_title varchar(100) not null,
    cl_b_email varchar(30) not null,
    cl_b_writer varchar(20) not null,
    cl_b_amount number not null,
    cl_b_bank varchar(20) not null,
    cl_b_account varchar(30) not null,
    cl_b_due_date timestamp not null,
    cl_b_contents clob not null,
    cl_b_viewcount number default 0,
    cl_b_writedate timestamp default sysdate,
    cl_b_recommend number default 0,
    cl_b_sum_amount number default 0
);
--drop table closed;

select * from closed;

create or replace trigger board_delete_trg
after delete
on board
for each row
begin
    insert into closed values(:old.b_no, :old.b_title, :old.b_email, :old.b_writer, :old.b_amount,
    :old.b_bank, :old.b_account, :old.b_due_date, :old.b_contents, :old.b_viewcount, :old.b_writedate, :old.b_recommend, :old.b_sum_amount);
end;
/
                          
commit;
