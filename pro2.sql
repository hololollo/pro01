create table traffic(tno int primary key, ttype varchar(20) not null, no varchar(20) not null, route varchar(50), coment varchar(2000));

create sequence tseq start with 1 increment by 1;

create table guide(pcode int primary key not null, pname varchar(100) not null, ptype varchar(3) not null, paddr varchar(200) not null, ptel varchar(20), pgps varchar(50), pcomment varchar(2000));

create sequence gseq start with 1 increment by 1;

create table notice(no varchar(20) primary key not null, title varchar(200) not null, content varchar(1000) not null, resdate varchar(100) not null, visited int);

create sequence nseq start with 1 increment by 1;

create table inroduce(comment1 varchar(2000), photo varchar(50), locat varchar(50));




create table qna (no varchar(20) not null, plevel varchar(20), parno int not null, title varchar(100), content varchar(2000), visited int, aid varchar(50) primary key, resdate varchar(20));
-- 질문은 회원만 하기 때문에 member테이블의 id와 비교하는 작업이 필요 (외래키 등록) -> id와 aid는 타입이 같아야한다. varchar면 varchar, 50이면 50
-- 외래키 => 참조테이블의 참조키에 해당하는 aid만 insert(참조무결성 강화)
create sequence qseq start with 1 increment by 1;



create table data (no varchar(50) primary key not null, plevel varchar(20), content varchar(2000), datafile varchar(100), resdate varchar(20), visited int);

create sequence dseq start with 1 increment by 1;



create table member (id varchar(50) primary key not null, pw varchar(15) not null, pwRemark varchar(15) not null, name varchar(10) not null, tel varchar(12) not null, email varchar(30) not null, bdate varchar(10), gender varchar(4) not null);
select * from member;
-- 외래키 만들기 (id <-> aid, no)
-- create table aid (aidId varchar(15) primary key);
alter table qna add CONSTRAINT fkey FOREIGN KEY (aid) REFERENCES member(id);

-- create table no (noNo int primary key);

alter table data add constraint fkey2 foreign key(no) references member(id);




