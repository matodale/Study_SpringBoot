package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.example.sample.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO") // Repository
public class DeptDAO extends EgovAbstractDAO{
	// EgovAbstractDAO 을 상속 받아서 재생성합니다.
	// 데이터베이스와 연결, sql id 값을 세팅
	public String InsertDept(DeptVO vo) throws Exception {
		return (String) insert("deptDAO.InsertDept" , vo); // 반환 값을 문자열로하고 insert method를 반환 한다.
	}
	public List<?> selectDeptList(DeptVO vo) { // sql id 값을 세팅
		return (List<?>) list("deptDAO.selectDeptList", vo); // 목록 출력을 하려면 list 메소드를 실행
	}
	public DeptVO selectDeptDetail(int deptno) {
		return (DeptVO) select("deptDAO.selectDeptDetail", deptno);
	}
	public int deleteDept(int deptno) {
		return (int) delete("deptDAO.deleteDept", deptno);
	}
	public int updateDept(DeptVO vo) {
		return (int) update("deptDAO.updateDept", vo);
	}
}
