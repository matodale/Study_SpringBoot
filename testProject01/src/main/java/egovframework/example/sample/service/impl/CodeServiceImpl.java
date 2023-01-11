package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Service("codeService") // controller 매칭
public class CodeServiceImpl implements CodeService {
	// 상속을 모두 처음에 설정이 가능하다.
	// 구현 클래스입니다.
	// CodeDAO를 사용.
	@Resource(name="codeDAO")
	private CodeDAO codeDAO;
	@Override
	public String insertCodes(CodeVO vo) throws Exception {
		return codeDAO.insertCodes(vo);
	}

}
