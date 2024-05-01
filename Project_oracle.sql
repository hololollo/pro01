create table traffic(tno number primary key, ttype varchar2(20), no varchar2(20), route varchar2(1000), coment varchar2(2000), uri varchar2(150));

create sequence tseq start with 1 increment by 1;

drop table traffic;
drop sequence tseq;

-- 교통편 등록
insert into traffic values(tseq.nextval, '버스','202번','경포해변→강문→강릉녹색도시체험센터→종합경기장→강릉역건너편→한국자산관리공사→교보생명→고용센터→강릉시외고속버스터미널→우미린아파트→선수촌8단지→구름다리→방축거리→오죽헌→선교장→경포해변','2003년 4월 1일 노선번호 변경 때 19-7번에서 경포 방향은 202번으로 바뀌었다. 2018년 1월 29일부터 강릉역을 경유하게 되었다.2018년 1월 24일 시내지역 및 주요관광지 순환노선으로 해당 노선을 개편한다고 공지하여, 202번은 강문에서 경포까지 시계방향으로 변경되었다.','https://bis.gn.go.kr/schedule');
insert into traffic values(tseq.nextval, '버스','202-1번','경포해변→선교장→오죽헌→방축거리→구름다리→선수촌8단지→우미린아파트→강릉시외고속버스터미널→용강동서부시장→신영극장→강릉여고→강릉역→교2동주민센터→종합경기장→강릉녹색도시체험센터→강문→경포해변','2003년 4월 1일 노선번호 변경 때 차고지(공단/안목) 방향은 202-1번으로 바뀌었다. 2018년 1월 29일부터 강릉역을 경유하게 되었다.2018년 1월 24일 시내지역 및 주요관광지 순환노선으로 해당 노선을 개편한다고 공지하여, 202-1번 노선은 경포에서 강문까지 반시계방향으로 변경되었다.','https://bis.gn.go.kr/schedule');

select * from traffic;

-- 교통편 검색
select * from traffic order by ttype desc, no asc;

-- 교통편 수정
update traffic set route='', coment='' where tno=1;

-- 교통편 삭제
delete from traffic where tno=1;

commit;



create table guide(pcode int not null, pname varchar(100) not null, ptype varchar(3) not null, paddr varchar(200) not null, ptel varchar(20), pgps varchar(50), pcomment varchar(2000));
-- tour
create sequence gseq start with 1 increment by 1;

drop table guide;
drop sequence gseq;

-- 장소 검색
select * from guide where pcode=1;

-- 장소 등록
insert into guide values (gseq.nextval, '','','','','','');
insert into guide values (gseq.nextval, 'BYC하이시티','01','서울특별시 금천구 가산동 가산디지털1로 131','1544-7871','37.4769693,126.8824741','디지털로의 대로변에 위치한 빌딩입니다.');
insert into guide values (gseq.nextval, 'G밸리산업협회','02','서울특별시 금천구 디지털로9길 32 B동 1406호(가산동, 갑을그레이트밸리)','02-867-2100','37.4794491,126.8875147','남부순환로의 금천경찰서 가산치안센터의 뒷 건물에 위치한 협회입니다.');
insert into guide values (gseq.nextval, '중화요리 연','03','서울특별시 금천구 가산디지털1로 225, 에이스 가산 포휴 1층 116호 (가산동)','전화번호 없음','37.4851258,126.8787374','가산디지털1로의 에이스가산포휴 빌딩에 위치한 중국요리 맛집입니다.');
insert into guide values (gseq.nextval, '더스테이 호텔','04','서울특별시 금천구 가산동 139-25','010-3137-1810','37.4792982,126.8886446','깨끗한 숙박시설');

-- 장소 수정
update guide set pname='', paddr='', ptel='', pgps='', pcoment='' where pcode=1;

-- 장소 삭제
delete from guide where pcode=1;

-- ptype : 01-주요 빌딩, 02-주요 협회 단체, 03-맛집안내, 04-숙박시설, 05-교육시설, 06-공원 및 스포츠 시설, 07-상업시설, 08-기타시설 





create table notice(no int primary key not null, title varchar(200) not null, content varchar(1000) not null, resdate timestamp, visited int);
create sequence nseq start with 1 increment by 1;

select * from notice;
commit;
insert into notice values(nseq.nextval, '더미제목1', '더미내용1', sysdate, default);


create table inroduce(comment1 varchar(2000), photo varchar(50), locat varchar(50));




create table qna (no int, plevel int, parno int, title varchar(100), content varchar(2000), resdate varchar(20), visited int, aid varchar(50));
-- 질문은 회원만 하기 때문에 member테이블의 id와 비교하는 작업이 필요 (외래키 등록) -> id와 aid는 타입이 같아야한다. varchar면 varchar, 50이면 50
-- 외래키 => 참조테이블의 참조키에 해당하는 aid만 insert(참조무결성 강화)
drop table qna;
-- plevel -> 1:질문, 2:답변
-- parno -> 질문(부모)글번호, 질문:자기자신번호, 답변:질문에 대한 글번호

-- 최근 질문 및 답변 목록 출력
select * from (select * from qna order by parno desc, plevel asc) where rownum<=5;


-- 질문 및 답변의 목록 출력 : 질문(부모)글번호인 parno의 내림차순으로 하고, 
-- 같은 경우은 질문부터 출력될 수 있도록 plevel의 오름차순으로 정렬하도록 한다.
select * from qna order by parno desc, plevel asc;


-- 질문 등록
insert into qna values(qseq.nextval,1,null,'질문5','질문5의 내용임',default,0,'kang');
update qna set parno=qseq.currval 
where no = (select * from (select no from qna order by no desc) where rownum<=1);

-- 답변 등록
insert into qna values(qseq.nextval,2,5,'질문4의 답변1','질문4의 답변 내용',default,0,'admin');

-- 질문 및 답변 수정
update qna set title='', content='' where no=1;

-- 질문 및 답변 삭제
delete from qna where no=1;

commit;


create sequence qseq start with 1 increment by 1;
drop sequence qseq;
drop table qna;
insert into qna values(qseq.nextval,1,null,'질문1','질문1내용','default',0,'kang');
select * from qna;
commit;


-- 자료실
create table data (no int primary key not null, plevel varchar(20), content varchar(2000), datafile varchar(100), resdate varchar(20), visited int);
select * from data;
desc data;
create sequence dseq start with 1 increment by 1;



create table member (id varchar(50) primary key not null, pw varchar(20) not null, name varchar(10) not null, email varchar(30) not null, tel varchar(15) not null);
select * from member;
insert into member values('admin','1234','관리자','admin@gangreung.org','010-1111-1111');
insert into member values('kang', '1234', '강범준', 'kang@gangreung.org','010-8960-3255');
insert into member values('kang1', '1234', '강', 'aaa@aaa.aaa','010-2222-2222');

alter table member add addr varchar2(300);
alter table member add postcode varchar2(8);

alter table member modify pw varchar2(200);
commit;
-- 
update member set addr='경포동 $ 287', postcode='12-345' where id='admin'; -- 1234
update member set addr='교동 $ 381', postcode='45-678' where id='kang1'; -- 1234
update member set addr='하슬라로 223 $ 독립건물 2층', postcode='36-124' where id='kang'; -- 1234

-- 
update member set pw='aoYSeQYh1TCNbZDlbo7NLfvf5vw8G+jPsOpUgkpeDwmMuGa6MqROWbAv1i/9b9gDv/kiiQ==' where id='admin';
update member set pw='' where id='kang1';
update member set pw='' where id='kang';

commit;

select * from member;
desc member;
-- 외래키 만들기 (id <-> aid, no)
-- create table aid (aidId varchar(15) primary key);
alter table qna add CONSTRAINT fkey FOREIGN KEY (aid) REFERENCES member(id);

-- create table no (noNo int primary key);

alter table data add constraint fkey2 foreign key(no) references member(id);
drop table member cascade constraints;
