package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO") // 레포지토리 이름을 다음 클래스에서 쓰입니다.
public class CodeDAO extends EgovAbstractDAO{
	// sql문을 작성할 메소드를 작성한다.
	// EgovAbstractDAO 전자정부프레임워크 클래스 상속.
	public String insertCodes(CodeVO vo) throws Exception {
		return (String) insert("codeDAO.insertCodes", vo);
	}
	
}
