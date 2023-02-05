# 전자정보프레임워크 스터디 내용 입니다. 
## Spring boot
1. 개발 환경 : eGovFrame 3.10.0 , Mysql 8.0, Mysql-connector v8.0.31 , Apache Tomcat v8.5
2. 개발 기능 : Dept 부서 테이블 관리, code 테이블 관리
### 2023년 01월 05일 첫업로드 전자정보프레임워크 설치, 설정, mysql 연결, <br>기본 MVC 모델 구조 파악하기 샘플을 활용하여 배우기

## testProject01 프로젝트에 작성하였습니다.
## 2023년 01월 06일 DB 연결 후 Mysql DB에 저장 완료
## 1. 기본 등록용 부서 테이플 활용 및 기본 Spring 
### [저장처리] - deptwriteSave.do
1. DeptService.java (인터페이스 명세 역할)(명세 역할) - 메소드들의 정의
2. DeptServiceImpl.java (메소드 구현 역할) - 프로그램 작업
3. DeptDAO.java (SQL파일과 연결하는 역할) - sql 파일의 ID 값을 생성
4. Dept_SQL.xml (SQL문을 실행하는 역할) - dao와 같은 id값으로 세팅
5. DeptController.java (파일에서 저장 서비스의 가동)
6. sql-map-config.xml 파일에 Dept_SQL.xml 을 등록한다.

### [수정처리] - deptUpdate.do

### [삭제처리] - deptDelete.do 

## 등록 화면 작성하기
### [등록화면] - deptWrite.do // 데이터 입력 하는 폼 작성

## 추가 작성하기 리스트 작성하기
### [목록화면] - deptList.do // 목록 화면을 갱신
1. DeptService.java
2. DeptServiceImpl.java
3. DeptDAO.java
4. Dept_SQL.xml
5. DeptController.java
6. deptList.jsp

### [상세화면] - deptDetail.do 

### [수정화면] - deptModify.do // 수정 화면을 갱신

## 2. 일반게시판 만들기 (완성 2023년 01월 29일 일요일)
### 구조
1. main.web
    - BoardController.java
2. main.service
    - BoardService.java
    - BoardVO.java
3. main.service.impl
    - BoardServiceImpl.java
    - BoardDAO.java
4. Board_SQL.xml
5. board / boardWrite.jsp
           boardList.jsp
           passWrite.jsp
           boardDetail.jsp
           boardModify.jsp
### 프로그램 목록
1. boardWrite.do
2. boardWriteSave.do
3. boardList.do
4. boardModifyWrite.do
5. boardModifySave.do
6. boardDelete.do
7. passWrite.do

## 3. 회원 관리 전자정부프레임워크(2023년 01월 29일 시작)
### 맵핑 구조
1. memberWrite.do
2. memberWriteSave.do
3. idcheck.do
4. post1.do
5. post2.do
6. loginWrite.do
7. loginWriteSub.do
8. logout.do
9. memberModifyWrite.do
10. memberModifySave.do

### 파일 구조
- main.service
1. MemberVO.java
2. MemberService.java
- main.service.impl
3. MemberServiceImpl.java
4. MemberDAO.java
- sql
5. Member_SQL.xml

### 화면 구조
1. memberWrite.jsp
2. post1.jsp
3. post2.jsp
4. loginWrite.jsp
5. memberModifyWrite.jsp