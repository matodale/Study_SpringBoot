package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

@Service("boardService") // controller 와 연결되는 이름
public class BoardServiceImpl implements BoardService {
	@Resource(name="boardDAO")
	private BoardDAO boardDAO; // private , public 접근지정자를 설정해준다.
	
	@Override
	public String insertNBoard(BoardVO vo) throws Exception {
		return boardDAO.insertNBoard(vo);
	}

	@Override
	public List<?> selectNBoardList(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardList(vo);
	}

	@Override
	public int selectNBoardTotal(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardTotal(vo);
	}

	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateNBoardHits(int unq) throws Exception {
		return boardDAO.updateNBoardHits(unq);
	}

	@Override
	public int updateNBoard(BoardVO vo) throws Exception {
		return boardDAO.updateNBoard(vo);
	}

	@Override
	public int selectNBoardPass(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardPass(vo);
	}

	@Override
	public int deleteNBoard(BoardVO vo) throws Exception {
		return boardDAO.deleteNBoard(vo);
	}

}
