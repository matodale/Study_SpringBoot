package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.example.sample.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO{
	
	// EgovAbstractDAO 을 상속 받아서 생성합니다.
	// 데이터베이스와 연결, sql id 값을 세팅
	public String InsertDept(DeptVO vo) throws Exception {
		// 반환 값을 문자열로하고 insert method를 반환 한다.
		return (String)insert("deptDAO.InsertDept" , vo);
	}
	// sql id 값을 세팅
	public List<?> selectDeptList(DeptVO vo) {
		// 목록을 위한 list 메소드
		return list("deptDAO.selectDeptList", vo);
	}
}
