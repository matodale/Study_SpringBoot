package main.web;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	// Service 클래스를 불러온다.
	@Resource(name="memberService")
	private MemberService memberService;
	
	// 회원 등록 화면
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite";
	}
	// 대문자로 변경 키 컨트롤 + 시프트 + X
	// 소문자로 변경 키 컨트롤 + 시프트 + Y
	// 회원 등록 SQL문 실행 ajax와 연동
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception{
		// 객체로 현재 시간을 설정해서 저장
		vo.setReg(new Timestamp(System.currentTimeMillis())); 
		Timestamp resultTime = vo.getReg(); 
		String message = "";
		String result = memberService.insertMember(vo);
		System.out.println(result);
		if(result == null) { // 성공 했을 때
			message = "ok";
			System.out.println("message : " + message + " " + resultTime);
		}else { // 실패 하였을 경우
			message = "";
			System.out.println("message : " + message + " " + resultTime);
		}
		return message;
	}
	
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String userid) throws Exception{
		int count = memberService.selectMemberIdCheck(userid);
		String message = "";
		if(count == 0) {
			message = "ok";
			System.out.println("message : " + message + "를 보냅니다.");
		}else{
			message = "fail";
			System.out.println("message : " + message + "를 보냅니다.");
		}
		return message;
	}
	
	@RequestMapping("/post1.do")
	public String post1() {
		return "member/post1";
	}
	
	@RequestMapping("/post2.do")
	public String post2(String dong, ModelMap model) throws Exception{
		List<?> list = memberService.selectPostList(dong);
		// System.out.println("list : " + list);
		model.addAttribute("resultList", list);
		return "member/post2";
	}
}


















