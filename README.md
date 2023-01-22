# 전자정보프레임워크 스터디 내용 입니다. 
## Spring boot
1. 개발 환경 : eGovFrame 3.10.0 , Mysql 8.0, Mysql-connector v8.0.31 , Apache Tomcat v8.5
2. 개발 기능 : Dept 부서 테이블 관리, code 테이블 관리
### 2023년 01월 05일 첫업로드 전자정보프레임워크 설치, 설정, mysql 연결, <br>기본 MVC 모델 구조 파악하기 샘플을 활용하여 배우기

## 2023년 01월 06일 DB 연결 후 Mysql DB에 저장 완료
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

## 일반게시판 만들기
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



