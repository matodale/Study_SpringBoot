package egovframework.example.sample.service;

import java.util.List;
//2. CodeService 작성
// 코드 입력 인터페이스 : sql문을 실행 시키기 위해 인터페이스 객체 선언
public interface CodeService {
	public String insertCodes(CodeVO vo) throws Exception;
	public List<?> selectCodesList(CodeVO vo) throws Exception;
	// Total 출력하는 서비스
	// select count(*) from codes; 출력이 숫자이므로 해당 서비스를 선언. RequestMapping은 따로 지정하지 않아도 된다.
	public int selectCodesCount(CodeVO vo) throws Exception;
	// delete from codes where code = '5'
	public int deleteCodes(int code) throws Exception;
	// select code, gid, name from codes where code = ''
	public CodeVO selectCodesDetail(int code) throws Exception;
	// update codes set gid = '1', name = '축구' where code = '5'
	public int updateCodes(CodeVO vo) throws Exception;
}
