package main.service;

import java.util.List;

public interface BoardService {
	// 게시판 데이터 입력 저장 기능 insertNBoard
	public String insertNBoard(BoardVO vo) throws Exception;
	// 게시판 데이터 갱신하여 화면 목록에 불러오는 기능 selectNBoardList
	public List<?> selectNBoardList(BoardVO vo) throws Exception;
}
