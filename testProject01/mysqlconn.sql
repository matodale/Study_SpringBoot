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