package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Service("codeService") // controller 매칭 (반드시 작성입니다.)
public class CodeServiceImpl implements CodeService {
	// 3. CodeServiceImpl 작성
	// 처음 파일 생성 시 상속을 모두 처음에 설정이 가능하다.
	// 서비스 구현 클래스입니다.
	// CodeDAO를 사용하기 위해 어노테이션 Resource을 작성.
	@Resource(name="codeDAO")
	private CodeDAO codeDAO;
	
	// 인터페이스 상속을 받아 같은 이름의 메소드 생성함.
	@Override
	public String insertCodes(CodeVO vo) throws Exception {
		return codeDAO.insertCodes(vo);
	}
	// 다형성(오버로딩, 오버라이딩)
	@Override
	public List<?> selectCodesList(CodeVO vo) throws Exception {
		return codeDAO.selectCodesList(vo);
	}
}
