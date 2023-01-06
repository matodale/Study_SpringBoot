package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	// interface 객체 만들고 InsertDept 메소드의 매개변수를 연결함.
	public String InsertDept(DeptVO vo) throws Exception;
	// List 타입으로 반환
	public List<?> selectDeptList(DeptVO vo) throws Exception;
}

