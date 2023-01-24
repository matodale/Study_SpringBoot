package main.web;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String insertNBoard(BoardVO vo) throws Exception{
		// 객체로 현재 시간을 설정해서 저장
		vo.setRdate(new Timestamp(System.currentTimeMillis())); 
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
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception{
		// total 갯수를 얻어야 한다.
		// total 갯수를 정해서 페이지를 정한다.
		// total int 타입이므로 ceil double 함수 이기 때문에 타입 변환을 하여 계산
		// viewPage 를 추가로 BoardVO 관련으로 설정해준다.
		int total = boardService.selectNBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/10);
		int viewPage = vo.getViewPage();
		// 1 Page view => viewPage1 , 10
		// viewPage 변수 초기값 1을 주어 해당 페이지가 늘어나면 해당 페이지 차례대로 늘어나게 함.
		// (1-1) * 10 + 1 -> 1
		// (2-1) * 10 + 1 -> 11
		// (3-1) * 10 + 1 -> 21 
		int startIndex = (viewPage - 1) * 10 + 1;
		int endIndex = startIndex + (10 - 1);
		// startIndex 와 endIndex를 SQL문으로 보내준다.
		
		vo.setStartIndex(startIndex); 
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectNBoardList(vo); // list 변수에 실행 메소드 지정.
		System.out.println("list : " + list);
		
		model.addAttribute("total", total); // 총 갯수 
		model.addAttribute("totalPage", totalPage); // 총 갯수를 10개씩 나누어 1개의 페이지 계산
		model.addAttribute("resultList", list); // 전송할 데이터
		return "board/boardList";
	}
}
