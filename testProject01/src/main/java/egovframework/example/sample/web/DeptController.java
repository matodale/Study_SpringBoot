package egovframework.example.sample.web;
/* 시스템 import */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/* 파일 import */
import egovframework.example.sample.service.DeptVo;


@Controller
public class DeptController {
	// 어노테이션
	// deptWrite 화면 출력하는 주소 맵핑
	@RequestMapping(value = "/deptWrite.do")
	public String deptWrite() {
		return "dept/deptWrite";
	}
	
	// deptWrite 화면에서의 데이터를 받아와서 출력하는 메소드 세팅
	@RequestMapping(value = "/deptWriteSave.do")
	public String deptWriteSave(DeptVo vo) {
		// 전달된 데이터를 출력하기
		System.out.println("부서번호 : " + vo.getDeptno());
		System.out.println("부서이름 : " + vo.getDname());
		System.out.println("부서위치 : " + vo.getLoc());
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
