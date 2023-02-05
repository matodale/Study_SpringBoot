/* 전체 데이터베이스를 보여줍니다. */
show databases;≈

/* 사용자 계정 및 권한 설정 입니다. 5.1 버전 입니다. */
grant select, insert, update, delete, create, drop, alter on springstudy.* to 'springid'@'localhost' identified by 'springstudy';
/* 8버전 이후 */
create database springstudy;
CREATE USER 'springid'@'localhost' IDENTIFIED BY 'springstudy';
GRANT ALL PRIVILEGES ON *.* TO 'springid'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON springstudy.* to 'springid'@'localhost' WITH GRANT OPTION;
flush privileges;

SHOW TABLES;
/* num_id int not null primary key auto_increment 글 번호 등을 자동으로 증가시킬 때 사용한다.*/
create table dept(
	deptno varchar(50) not null,
	dname varchar(50) not null,
	loc varchar(50) not null
);
select * from dept;
drop table dept;
insert into dept(deptno,dname,loc) values(11, '인사동', '일반위치1');

create table member(
	id varchar(50) not null primary key,
	passwd varchar(16) not null,
	name varchar(10) not null,
	reg_date datetime not null
);


/*
 * 1, 1, 개발자
 * 2, 1, 디자이너
 * 3, 2, 축구
 * 4, 2, 농구
 * 5, 2, 야구
 
	오라클에서의 추가 SQL문 
		시퀀스
		create table codes(
			code number not null primary key,
			gid number not null,
			name varchar2(100) not null
		);
	
	/* oracle 에서 auto_increate 기능 */	
	create sequence codes_seq increment by 1 start with 1 maxvalue 9999;
	insert into codes(code,gid,name) values(codes_seq.nextval,#gid#,#name#)
	
	[파일 목록]
	CodeVO.java
	CodeController.java
	CodeService.java
	CodeServiceImpl.java
	CodeDAO.java
	Code_SQL.xml
	
	codeWrite.jsp
	codeList.jsp
	codeModifyWrite.jsp
	
	[프로그램 목록]
	codeWrite.do - 갱신화면
	codeWriteSave.do - 저장기능
	codeList.do  - 갱신기능
	codeModifyWrite.do - 수정하기화면
	codeModifySave.do - 수정기능
	codeDelete.do - 삭제기능
	
*/

create table codes(
	code int not null primary key auto_increment, /* 중복 불가로 지정함. */
	gid int not null,
	name varchar(100) not null
);

desc codes;
select * from codes; /* 데이터 갱신 */
insert into codes(code, gid, name) values(4, 2, '프론트엔드'); /* 데이터 입력 */
update codes set name ='그림그리기' where code = 4; /* 데이터 수정 */
delete from codes where code = 4; /* 데이터 삭제 */
SELECT code, gid, name FROM codes ORDER BY gid ASC;

/* mysql에서 sql 작성 시 */
SELECT code, 
		gid, 
		CASE gid 
		WHEN 1 THEN 'JOB(업무)'
		WHEN 2 THEN 'HOBBY(취미)' 
		END as "gidname",
		name
FROM codes ORDER BY gid ASC;
select count(*) from codes;
/* oracle에서 sql 작성 시  */
/* SELECT code, decode(gid, '1', 'JOB', '2' ,'HOBBY') gid, name FROM codes ORDER BY gid ASC; */

select code, gid, name from codes where code='5';
drop table NBoard;
/* 게시판 테이블 작성 */
create table nboard(
	unq int not null primary key auto_increment, /* 중복 불가로 지정함 */
	title varchar(100) not null,
	pass varchar(20) not null,
	name varchar(10) not null,
	content varchar(1000) not null,
	hits int default 0, /* 초기 값은 0 */
	rdate datetime not null default CURRENT_TIMESTAMP() /* java 에서 Timestamp 와 연동하여 쓸 예정 */
);
/* 오라클 에서의 세
create table nboard(
	unq number not null primary key, /* 중복 불가로 지정함 */
	title varchar2(100) not null,
	pass varchar2(20) not null,
	name varchar2(10) not null,
	content varchar2(1000) not null,
	hits number default 0, /* 초기 값은 0 */
	rdate timestamp(6) not null /* java 에서 Timestamp 와 연동하여 쓸 예정 */
);
	/* oracle 에서 auto_increate 기능 */	
	create sequence nboard_seq increment by 1 start with 1 maxvalue 9999;
	insert into nboard(unq, title, pass, name, content, hits, rdate) values(nboard_seq.nextval,#title#,#pass#, #name#, #content#, 0, sysdate);
*/
ALTER TABLE nboard MODIFY COLUMN hits int not null default 0;
desc nboard;
select * from nboard;
insert into nboard(title, pass, name, content, rdate) values('엄청난 일이 일어났습니다.', '123', '관리자', '2023년 01월 22일은 설날입니다.', CURRENT_TIMESTAMP());
delete from nboard where unq = 1;
SELECT unq,pass ,title, name, content, hits, DATE_FORMAT(rdate, '%Y-%m-%d') as rdate FROM nboard ORDER BY unq DESC;
/* oracle 에서는 to_char() 함수로 적는다. to_char(rdate, 'yyyy-mm-dd') */

/* 패이징 처리에 필요한 SQL문 */
SELECT b.* FROM (
		SELECT row_number() over (ORDER BY unq DESC) AS rn, a.* FROM (
		SELECT unq, 
			 title, 
			  name, 
		   content, 
		      hits, 
		      DATE_FORMAT(rdate, '%Y-%m-%d') AS rdate 
		FROM nboard ORDER BY unq DESC) AS a ) AS b
		WHERE (rn >= 1) AND (rn <= 10);
/*
oracle 에서의 페이징 rownum() 적용
SELECT b.* FROM (
		SELECT rownum() AS rn, a.* FROM (
		SELECT unq, 
			 title, 
			  name, 
		   content, 
		      hits, 
		      TO_CHAR(rdate, 'yyyy-mm-dd') AS rdate 
		FROM nboard 
		ORDER BY unq DESC) AS a ) AS b
		WHERE (rn >= 1) AND (rn <= 10);
*/
SELECT COUNT(*) as total FROM nboard;

SELECT unq, title, name, content, DATE_FORMAT(rdate, '%Y-%m-%d') AS rdate FROM nboard WHERE unq = 14;
/* member TABLE 작성 */
CREATE TABLE member(
	userid VARCHAR(20) NOT null PRIMARY KEY,
	pass VARCHAR(20) NOT null,
	name VARCHAR(20) NOT null,
	birth DATE NOT null,
	phone VARCHAR(20) NOT null,
	gender VARCHAR(1) CHECK (gender IN('M','F')),
	zipcode VARCHAR(10),
	address VARCHAR(100),
	reg TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);
-- gender VARCHAR(1) enum('M','F')
-- MYSQL 에서 CHECK 변수 대신 함수 
SELECT * FROM member;
DESC member;
DROP TABLE member;

/*
 * 오라클에서의 작성 방식
CREATE TABLE member(
	userid VARCHAR2(20) NOT null,
	pass VARCHAR2(20) NOT null,
	name VARCHAR2(20) NOT null,
	birth DATE NOT null,
	phone VARCHAR2(20) NOT null,
	gender VARCHAR2(1),
	zipcode VARCHAR2(10),
	address VARCHAR2(100),
	reg TIMESTAMP DEFAULT sysdate,
	CONSTRAINT member_pk PRIMARY KEY(userid), /* 제약조건 CONSTRAINT 중복 데이터 방지 PRIMARY KEY */
	CONSTRAINT member_ck CHECK (gender IN('M','F')) /* 제약조건 CONSTRAINT */
);
*/

-- 우편번호 테이블 대량으로 데이터 넣기.
CREATE TABLE post(
	a1 VARCHAR(6),
	a2 VARCHAR(50),
	a3 VARCHAR(50),
	a4 VARCHAR(50),
	a5 VARCHAR(50),
	a6 VARCHAR(50),
	a7 VARCHAR(50),
	a8 VARCHAR(100)
);

SELECT * FROM post;
DESC post;
use springstudy;
SHOW TABLES;
show variables like "secure_file_priv";
-- 확인해보자.
show global variables like 'local_infile'; 
-- off 면 on으로 바꿔준다.
set global local_infile=true; 
load data local infile "/Users/parkchoelho/Desktop/Work/eGovFrame_workspace/post1.csv" INTO TABLE post  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; 
/* 터미널에서 실행이 가능함. 
 * 오라클 SQL Developer 에서는 데이터 임포트를 통해 해당 문서와 연동하여 쓸 수 있다.
 * 인코딩을 UTF-8 로 변환.
 * 헤더 체크 해제를 하면 첫번째 데이터를 컬럼명으로 인식하고 데이터를 저장을 할 수 있다.
 * */
select count(*) from post;

INSERT INTO member(
				userid, 
				pass, 
				name, 
				birth, 
				phone, 
				gender, 
				zipcode, 
				address,
				reg
			) 
	 	VALUES 
	 		(
	 			'admin_test', 
	 			'test1234', 
	 			'관리자', 
	 			'2007-06-19', 
	 			'010-9432-2132', 
	 			'M', 
	 			'333-333', 
	 			'대전광역시 대덕구 중리',
	 			CURRENT_TIMESTAMP
	 		);
SELECT * FROM member;
