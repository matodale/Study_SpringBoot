package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller // 스프링 구조에서의 컨트롤러 어노테이션
public class CodeController {
	
	// codeService.java file을 사용하기 위해 작성.
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "/codeWrite.do")
	public String codeWrite() {
		return "code/codeWrite";
	}
	
	@RequestMapping(value = "/codeWriteSave.do")
	public String insertCodes(CodeVO vo) throws Exception {
	// System.out.println("코드번호 : " + vo.getCode());
	// System.out.println("분류 : " + vo.getGid());
	// System.out.println("코드이름 : " + vo.getName());
		String result = codeService.insertCodes(vo);
		if (result == null) {
			System.out.println("데이터 저장 성공");
		} else {
			System.out.println("데이터 저장 실패"); 
		}
		// codeList.do로 가기
		return "redirect:codeList.do";
	}
	
	@RequestMapping(value = "/codeList.do")
	public String selectCodesList(CodeVO vo, ModelMap model) throws Exception{
		int total = codeService.selectCodesCount(vo);
		List<?> list = codeService.selectCodesList(vo);
		// System.out.println("list =====> " + list); // select 문을 실행시킨 값을 list변수에 저장함.
		model.addAttribute("resultList", list); // resultList JSP 파일에서 데이터를 보낸다.
		model.addAttribute("resultTotal", total); // 화면 영역에 보낼 변수값을 지정.
		return "code/codeList";
	}
	
	@RequestMapping(value = "/codeDelete.do")
	public String deleteCodes(int code) throws Exception{
		int result = codeService.deleteCodes(code);
		if (result == 1) {
			System.out.println("데이터 삭제 성공");
		} else {
			System.out.println("데이터 삭제 실패"); 
		}
		return "redirect:codeList.do";
	}
	
	@RequestMapping(value = "/codeModifyWrite.do")
	public String selectCodesDetail(int code, ModelMap model) throws Exception{
		CodeVO vo = codeService.selectCodesDetail(code);
		model.addAttribute("vo", vo);
		return "code/codeModifyWrite";
	}
	
	@RequestMapping(value = "/codeModifySave.do")
	public String updateCodes(CodeVO vo) throws Exception{
		int result = codeService.updateCodes(vo);
		if (result == 1) {
			System.out.println("데이터 수정 성공");
		} else {
			System.out.println("데이터 수정 실패"); 
		}
		return "redirect:codeList.do";
	}
}
