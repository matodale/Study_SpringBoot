package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	// 제일 먼저 작성되는 interface 파일
	// interface 객체 만들고 InsertDept 메소드의 매개변수를 연결함.
	public String InsertDept(DeptVO vo) throws Exception;
	// List 타입으로 반환
	public List<?> selectDeptList(DeptVO vo) throws Exception;
	// 상세보기를 하기위한 인터페이스 
	// deptno , dname , loc 변수 3개를 모두 가져오는 객체 DeptVO를 타입으로 지정.
	/*
	 * [상세화면] - deptDetail.do
	 * 1. DeptService.java
	 * 2. DeptServiceImpl.java
	 * 3. DeptDAO.java
	 * 4. Dept_SQL.xml
	 * 5. DeptController.java
	 * 6. deptDetail.jsp
	 * */
	public DeptVO selectDeptDetail(int deptno) throws Exception;
	// 결과 타입이 갯수이므로 동일하게 작성
	/*
	 * [삭제화면] - deleteDept.do
	 * 1. DeptService.java
	 * 2. DeptServiceImpl.java
	 * 3. DeptDAO.java
	 * 4. Dept_SQL.xml
	 * 5. DeptController.java
	 * 6. deptDetail.jsp
	 * */
	public int delectDept(int deptno) throws Exception;
	/*
	 * [ 업데이트 기능 ] - updateDept.do
	 * 1. DeptService.java
	 * 2. DeptServiceImpl.java
	 * 3. DeptDAO.java
	 * 4. Dept_SQL.xml
	 * 5. DeptController.java
	 * 6. deptModifyWrite.jsp
	 * */
	// DeptVO 변수들 모두 가져와 수정해야 하므로 변수들 모두 매개변수로 지정.
	public int updateDept(DeptVO vo) throws Exception;
}

