package main.web;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {                
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody // ajax 과 연동할 어노테이션
	public String insertBoard(BoardVO vo) throws Exception{
		vo.setRdate(new Timestamp(System.currentTimeMillis())); // 객체로 현재 설정해서 저장해주자.
		Timestamp resultTime = vo.getRdate();
		String result = boardService.insertNBoard(vo);
		String msg = "";
		if(result == null) {
			msg = "ok";
			System.out.println(resultTime +" "+ msg + " 입력완료하였습니다.");
		}else {
			msg = "fail";
			System.out.println(resultTime +" "+ msg + " 실패하였습니다.");
		}
		return msg; // return 값을 ajax에서 설정한 ok를 리턴한다.
	}
}
