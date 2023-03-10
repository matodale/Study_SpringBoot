package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
	// 서비스와 연결 해주는 파일 interface 인 상속을 받아서 사용한다.
	// 구현을 하는 목적을 한다. 
	// interface 와 상속 되어 있다.
@Service("deptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService{
	@Resource(name = "deptDAO") // Resource
	private DeptDAO deptDAO;
	@Override // Method create : 데이터 입력하는 기능
	public String InsertDept(DeptVO vo) throws Exception {
		// 저장하는 데이터가 입력 된다. 입력에 이상이 없으면 1 = 성공을 출력한다.
		return deptDAO.InsertDept(vo); 
	}
	@Override // 데이터 갱신 하는 메소드
	public List<?> selectDeptList(DeptVO vo) throws Exception {
		return deptDAO.selectDeptList(vo); // DB를 불러오는 역할
	}
	@Override // deptno , dname , loc 변수 3개를 모두 가져오는 객체 DeptVO를 타입으로 지정.
	public DeptVO selectDeptDetail(int deptno) throws Exception {
		return deptDAO.selectDeptDetail(deptno);
	}
	@Override
	public int delectDept(int deptno) throws Exception {
		// 삭제 성공시 1을 출력. 실패시 0을 출력
		return deptDAO.deleteDept(deptno);
	}
	@Override
	public int updateDept(DeptVO vo) throws Exception {
		// 업데이트 성공시 1을 출력함.
		return deptDAO.updateDept(vo);
	}
	
}























