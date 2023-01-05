package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;
import egovframework.example.sample.service.DeptVo;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO{
	// EgovAbstractDAO 을 상속 받아서 생성합니다.
	// 데이터베이스와 연결
	public String InsertDept(DeptVo vo) throws Exception {
		return (String)insert("deptDAO.InsertDept" , vo);
	}
	
}
