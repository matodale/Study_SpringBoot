package egovframework.example.sample.service;

public class DeptVO {
	// 객체를 캡슐화 세팅
	// 부서번호, 부서이름, 부서위치 작성
	private String deptno;
	private String dname;
	private String loc;
	
	// get , set 메소드 작성
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
	
}
