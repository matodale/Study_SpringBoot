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
		model.addAttribute("resultList", list); // ModelMap 매개변수로 하여 데이터값을 전달 (jsp에서의 속성, list)
		return "dept/deptList"; // dept/deptList.jsp 경로
	}
	
	@RequestMapping(value = "/deptDetail.do")
	public String selectDeptDetail(int deptno, ModelMap model) throws Exception{
		DeptVO vo = deptService.selectDeptDetail(deptno);
		System.out.println("부서번호 :"+ vo.getDeptno());
		model.addAttribute("deptVO", vo);
		return "dept/deptDetail";
	}
	// 삭제 기능 화면
	@RequestMapping(value="/deptDelete.do")
	public String deleteDept(int deptno) throws Exception{
		int result = deptService.delectDept(deptno);
		if(result == 1) {
			System.out.println("삭제가 완료되었습니다.");
		}else {
			System.out.println("데이터가 없거나 삭제가 실패하였습니다.");
		}
		return "";
	}
	// 데이터 수정 화면 맵핑
	@RequestMapping(value="/deptModifyWrite.do")
	public String selectDeptModify(int deptno, ModelMap model) throws Exception{
		// 부서번호인 deptno를 이용해 데이터를 가져와야 한다.
		// 데이터 클래스 DeptVO의 변수 클래스를 vo변수로 선언함.
		DeptVO vo = deptService.selectDeptDetail(deptno);
		// 화면으로 출력을 위해 속성 배열 클래스인 ModelMap의 addAttribute()메소드를 이용한다.
		// jsp파일에서 사용할 변수 vo값으로 지정
		model.addAttribute("vo", vo);
		return "dept/deptModifyWrite";
	}
	@RequestMapping(value="/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception{
		// 업데이트 서비스 기능인 updateDept sql문을 이용한 기능을 가진 클래스를 작성하자.
		// 서비스 작성 후 기능 작성후 완료
		int result = deptService.updateDept(vo);
		if(result == 1) {
			System.out.println("수정완료.");
		}else {
			System.out.println("수정실패.");
		}
		return "";
	}
}





















