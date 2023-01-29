package main.service;

import java.util.List;

public interface BoardService {
	/**
	 * 2023.01.28 게시판 관리(최초작성)
	 * 개발자 : 박철호
	 */
	// 게시판 데이터 입력 저장 기능 insertNBoard
	public String insertNBoard(BoardVO vo) throws Exception;
	// 게시판 데이터 갱신하여 화면 목록에 불러오는 기능 selectNBoardList
	public List<?> selectNBoardList(BoardVO vo) throws Exception;
	// 게시판 총 갯수 total 출력 SELECT COUNT(*) total FROM nboard;
	public int selectNBoardTotal(BoardVO vo) throws Exception;
	// 게시판 상세보기 화면 SELECT * FROM nboard WHERE unq = 5;
	public BoardVO selectNBoardDetail(int unq) throws Exception;
	// 조회수 증가 관련 UPDATE nboard SET hits = hits + 1 WHERE unq = 5;
	public int updateNBoardHits(int unq) throws Exception;
	// 게시판 수정 UPDATE nboard SET title = '', pass = '', name = '', content = '' WHERE unq = 5;
	public int updateNBoard(BoardVO vo) throws Exception;
	// SELECT COUNT(*) FROM nboard WHERE unq = 1 and pass = 'test'; 게시판 암호 확인
	public int selectNBoardPass(BoardVO vo) throws Exception;
}
