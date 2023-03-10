package egovframework.example.sample.service.impl;

import java.util.List;


import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
//4. CodeDAO를 작성 (EgovAbstractDAO) 상속
// 레포지토리 이름을 다음 클래스에서 쓰입니다. Repository

@Repository("codeDAO") 
public class CodeDAO extends EgovAbstractDAO{
	// sql문을 작성할 메소드를 작성한다.
	// EgovAbstractDAO 전자정부프레임워크 클래스 상속.
	public String insertCodes(CodeVO vo){
		return (String) insert("codeDAO.insertCodes", vo);
	}
	// SQL ID, vo는 매개변수를 데이터로 전달함.
	public List<?> selectCodesList(CodeVO vo){
		return list("codeDAO.selectCodesList", vo); 
	}
	
	public int selectCodesCount(CodeVO vo){
		return (int)select("codeDAO.selectCodesCount", vo);
	}
	
	public int deleteCodes(int code){
		return delete("codeDAO.deleteCodes", code);
	}
	
	public CodeVO selectCodesDetail(int code){
		return (CodeVO)select("codeDAO.selectCodesDetail", code);
	}
	
	public int updateCodes(CodeVO vo) {
		return (int)update("codeDAO.updateCodes", vo);
	}
	
}
