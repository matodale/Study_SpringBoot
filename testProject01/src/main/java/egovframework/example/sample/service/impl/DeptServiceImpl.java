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
	
	// Resource
	@Resource(name = "deptDAO")
	private DeptDAO deptDAO;
	
	// Method create : 데이터 입력하는 기능
	@Override
	public String InsertDept(DeptVO vo) throws Exception {
		return deptDAO.InsertDept(vo); // 저장하는 데이터가 입력 된다.
	}
	
	// 데이터 갱신 하는 메소드
	@Override
	public List<?> selectDeptList(DeptVO vo) throws Exception {
		return deptDAO.selectDeptList(vo); // DB를 불러오는 역할
	}
	
	
	
}
