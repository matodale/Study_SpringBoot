package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO") // 레포지토리 이름을 다음 클래스에서 쓰입니다. Repository
public class CodeDAO extends EgovAbstractDAO{
	// 4. CodeDAO를 작성 (EgovAbstractDAO) 상속
	// sql문을 작성할 메소드를 작성한다.
	// EgovAbstractDAO 전자정부프레임워크 클래스 상속.
	public String insertCodes(CodeVO vo) throws Exception {
		return (String) insert("codeDAO.insertCodes", vo);
	}

	public List<?> selectCodesList(CodeVO vo) throws Exception{
		// SQL ID, vo는 매개변수를 데이터로 전달함.
		return list("codeDAO.selectCodesList", vo); 
	}
	
}
