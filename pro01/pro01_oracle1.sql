select * from notice;

insert into notice values(nseq.nextval, '더미제목1', '더미내용1', sysdate, default);
insert into notice values(nseq.nextval, '더미제목2', '더미내용2', sysdate, default);

select * from member;
insert into member values('admin', '1234', '관리자', 'admin@gangreung.org', '010-1111-1111');