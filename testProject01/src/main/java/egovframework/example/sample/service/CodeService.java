package egovframework.example.sample.service;

import java.util.List;

public interface CodeService {
	// 2. CodeService 작성
	// 코드 입력 인터페이스 : sql문을 실행 시키기 위해 인터페이스 객체 선언
	public String insertCodes(CodeVO vo) throws Exception;
	public List<?> selectCodesList(CodeVO vo) throws Exception;
}
