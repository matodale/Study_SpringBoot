package egovframework.example.sample.web;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;


@Controller
public class DeptController {
	
	// 서비스 폴더 있는 interface 선언과 연결
	@Resource(name="deptService")
	private DeptService deptService;
	
	// 어노테이션
	// deptWrite 화면 출력하는 주소 맵핑
	@RequestMapping(value = "/deptWrite.do")
	public String deptWrite() {
		return "dept/deptWrite";
	}
	
	// deptWrite 화면에서의 데이터를 받아와서 출력하는 메소드 세팅
	@RequestMapping(value = "/deptWriteSave.do")
	public String deptWriteSave(DeptVO vo) throws Exception{
		
		// 전달된 데이터를 출력하기
		System.out.println("부서번호 : " + vo.getDeptno());
		System.out.println("부서이름 : " + vo.getDname());
		System.out.println("부서위치 : " + vo.getLoc());
		// 받아온 서비스.기능을 써준다.
		String result = deptService.InsertDept(vo);
		
		if(result == null) {
			// 저장 성공
			System.out.println("저장성공!");
		}else {
			System.out.println("저장실패!");
		}
		
		return "";
	}
	
	@RequestMapping(value = "/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception{
		List<?> list = deptService.selectDeptList(vo);
		System.out.println(list);
		// ModelMap 매개변수로 하여 데이터값을 전달 (jsp에서의 속성, list)
		model.addAttribute("resultList", list);
		return "dept/deptList";
	}
	
	
}
