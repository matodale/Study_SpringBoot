package egovframework.example.sample.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller // 스프링 구조에서의 컨트롤러 어노테이션
public class CodeController {
	@Resource(name = "codeService")
	private CodeService codeService;

	@RequestMapping(value = "/codeWrite.do")
	public String codeWrite() {
		return "code/codeWrite";
	}

	@RequestMapping(value = "/codeWriteSave.do")
	public String insertCodes(CodeVO vo) throws Exception {
//		System.out.println("코드번호 : " + vo.getCode());
//		System.out.println("분류 : " + vo.getGid());
//		System.out.println("코드이름 : " + vo.getName());
		String result = codeService.insertCodes(vo);
		
		if (result == null) {
			System.out.println("데이터 저장 성공");
		} else {
			System.out.println("데이터 저장 실패");
		}
		return "redirect:codeList.do";
	}
}