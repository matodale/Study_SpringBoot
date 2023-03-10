package egovframework.example.sample.service;
//1. CodeVO 작성
public class CodeVO {
	private int code;
	// integer type code : 순서대로 저장하는 번호
	private int gid;
	// integer type gid : 1, 2 구분으로 직업, 취미로 지정한 숫자 코드
	private String name;
	// String type name : 직업, 취미를 써주는 데이터
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
