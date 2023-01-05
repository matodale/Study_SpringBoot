package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

// 서비스와 연결 해주는 파일 interface 인 상속을 받아서 사용한다.
// 구현을 하는 목적을 한다. 
/*
 * 추상화
 * 다형성 - 오버라이딩, 오버로딩
 * 상속
 * 캡슐화
 * 
 * */
@Service("deptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService{
	
	@Resource(name = "deptDAO")
	private DeptDAO deptDAO;
	
	@Override
	public String InsertDept(DeptVo vo) throws Exception {
		
		return deptDAO.InsertDept(vo);
	}
	
}
