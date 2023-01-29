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
		int unit = 10; // 게시판에 보여질 갯수
		// total 갯수를 얻어야 한다.
		// total 갯수를 정해서 페이지를 정한다.
		// total int 타입이므로 ceil double 함수 이기 때문에 타입 변환을 하여 계산
		// viewPage 를 추가로 BoardVO 관련으로 설정해준다.
		int total = boardService.selectNBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		int viewPage = vo.getViewPage(); // BoardVO 에서 불러오는 getViewPage
		// url 방지 해당 게시판 범위 내에서만 보여지게 한다.
		if(viewPage > totalPage || viewPage < 1 ) {
			viewPage = 1;
		}
		// 1 Page view => viewPage1 , 10
		// viewPage 변수 초기값 1을 주어 해당 페이지가 늘어나면 해당 페이지 차례대로 늘어나게 함.
		// (1-1) * 10 + 1 -> 1
		// (2-1) * 10 + 1 -> 11
		// (3-1) * 10 + 1 -> 21 
		int startIndex = (viewPage - 1) * unit + 1;
		int endIndex = startIndex + (unit - 1);
		// total -> 12 , 1 -> 12을 보여줌, 2 -> 2를 보여줌.
		// total -> 34 , 1 page -> 34 ~ 25, 2 page -> 24 ~ 15, 3page -> 14 ~ 5 -> .....
		int startRowNo = total - (viewPage - 1) * unit; 
		// startIndex 와 endIndex를 SQL문으로 보내준다.
		vo.setStartIndex(startIndex); 
		vo.setEndIndex(endIndex);
		List<?> list = boardService.selectNBoardList(vo); // list 변수에 실행 메소드 지정.
		System.out.println("list : " + list);
		// jsp 로 전송하는 메소드
		model.addAttribute("rowNumber", startRowNo); // 행 번호
		model.addAttribute("total", total); // 총 갯수 
		model.addAttribute("totalPage", totalPage); // 총 갯수를 10개씩 나누어 1개의 페이지 계산
		model.addAttribute("resultList", list); // 전송할 데이터
		return "board/boardList";
	}
	
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception{
		boardService.updateNBoardHits(vo.getUnq()); // 조회수 증가
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq()); // 상세보기 SQL문 실행
		String content = boardVO.getContent(); // content 변수에 boardVO content 불러오기
		boardVO.setContent(content.replace("\n", "<br>")); // 재설정하기
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception{
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		model.addAttribute("boardVO", boardVO);
		return "board/boardModifyWrite";
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody // ajax 과 연동할 어노테이션
	public String updateNBoard(BoardVO vo) throws Exception{
		int count = boardService.selectNBoardPass(vo);
		int result = 0;
		if(count == 1) {
			result = boardService.updateNBoard(vo); // int result = 1 정상 처리 결과 
			System.out.println(count + " : 암호가 일치합니다.");
		}else {
			System.out.println(count + " : 암호가 일치하지 않습니다.");
			result = -1;
		}
		return result+""; // return 값을 ajax에서 설정한 ok를 리턴한다.
	}
}
